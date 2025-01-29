extends Control

@onready var game_scene: PackedScene = load("res://scenes/game_scene.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)
