extends Area2D

var direction := Vector2.ZERO

onready var _tween = get_node("Tween")

func _physics_process(delta):
	move_local_y(-100*delta)

