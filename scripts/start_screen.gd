extends Control

@onready var game_scene: PackedScene = load("res://scenes/game_scene.tscn")
@onready var how_to_play_scene: PackedScene = load("res://scenes/how_to_play_screen.tscn")

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(game_scene)


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_packed(how_to_play_scene)


func _on_exit_pressed() -> void:
	get_tree().quit()
