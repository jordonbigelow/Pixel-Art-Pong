extends Control

@onready var start_screen: PackedScene = load("res://scenes/start_screen.tscn")


func _on_back_to_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_screen)
