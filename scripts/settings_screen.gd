extends Node2D


func _on_game_scene_pause_button_pressed() -> void:
	if get_tree().is_paused():
		show()
	else:
		hide()
