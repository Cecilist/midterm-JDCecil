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
		print(direction.x)

	elif Input.is_action_pressed("move_left"):
		if direction.x > 0:
			direction.x = 0
		direction.x -= 1
		print(direction.x)
	
	else: 
		# if nothing is being pressed, stop the character
		direction.x = 0.0
	

	_velocity.x = direction.x * speed
	
	
	if _sprite.flip_h and _velocity.x > 0:
		_sprite.flip_h = false
	elif not _sprite.flip_h and _velocity.x < 0:
		_sprite.flip_h = true
		
	
		if _velocity.x !=0:
			_sprite.play("walk")
		else:
			_sprite.play("idle")
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		_velocity.y -= jump_strength
		_sprite.play("jump")
	if is_on_wall():
		direction.x = 0
	
	_velocity = move_and_slide(_velocity, Vector2.UP)
