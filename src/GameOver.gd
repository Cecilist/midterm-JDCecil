extends Node2D


func _on_TitleButton_pressed():
	var _ignored := get_tree().change_scene("res://src/TitleScreen.tscn")


func _on_RetryButton_pressed():
	var _ignored := get_tree().change_scene("res://src/Level.tscn")
