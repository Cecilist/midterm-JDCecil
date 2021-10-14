extends Node2D

var totalCoins : int = 10
# Since we start "half-way there" we start with half the coins already collected
var coinsCollected : float = totalCoins / 2.0
var _player : KinematicBody2D


func _ready():
	_spawn_Player()

func _spawn_Player():
		_player = load("res://src/Player.tscn").instance()
		_player.position = $SpawnPoint.position
		add_child(_player)


func _on_Lava_body_entered(body):
	if body == _player:
		_game_Over()
		
func _game_Over():
	var _ignored := get_tree().change_scene("res://src/GameOver.tscn")


func _on_Coin_body_entered(body):
	if body == _player:
		coinsCollected += 1
		$HUD/CoinsLabel.text = "Coins Collected: " + str(coinsCollected) + " / 10"
		


func _on_Goal_body_entered(body):
	if body == _player and coinsCollected  >= totalCoins:
		var _ignored := get_tree().change_scene("res://src/AllCoinsWin.tscn")
	elif body == _player and coinsCollected  < totalCoins:
		var _ignored := get_tree().change_scene("res://src/NotAllCoinsWin.tscn")
