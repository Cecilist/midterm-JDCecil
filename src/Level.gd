extends Node2D

var _player : KinematicBody2D

func _ready():
	_spawn_Player()

func _spawn_Player():
		_player = load("res://src/Player.tscn").instance()
		_player.position = $SpawnPoint.position
		add_child(_player)
