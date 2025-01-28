extends Timer

signal started

@onready var countdown: String = $Label.text


func _on_timeout() -> void:
	$Label.visible =false
	get_tree().reload_current_scene()


func _on_started() -> void:
	$Label.visible = true 


func _process(_delta: float) -> void:
	$Label.text = "Restart in... " + str(round($".".time_left))
