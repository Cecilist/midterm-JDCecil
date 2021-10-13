extends KinematicBody2D

export var speed := 5
export var jump_strength := 150

var direction := Vector2.ZERO

var _velocity := Vector2.ZERO
var _gravity : float = ProjectSettings.get("physics/2d/default_gravity")

onready var _sprite := $AnimatedSprite

func _physics_process(delta):
	_velocity.y += _gravity * delta
	if Input.is_action_pressed("move_right"):
		if direction.x < 0:
			direction.x = 0
		direction.x += 1
		if is_on_floor():
			_sprite.flip_h = false
			_sprite.play("walk")

	elif Input.is_action_pressed("move_left"):
		if direction.x > 0:
			direction.x = 0
		direction.x -= 1
		if is_on_floor():
			_sprite.flip_h = true
			_sprite.play("walk")

	else: 
		# if nothing is being pressed, stop the character
		direction.x = 0
		if is_on_floor():
			_sprite.play(" idle")

	

	_velocity.x = direction.x * speed
	
	if _velocity.x != 0 and is_on_floor():
		_sprite.play("walk")
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y -= jump_strength
		_sprite.play("jump")
	
	if not is_on_floor():
		_sprite.play("jump")
		if _velocity.y > 0:
			_sprite.play("fall")
	
	if is_on_wall():
		direction.x = 0
	_velocity = move_and_slide(_velocity, Vector2.UP)
	

