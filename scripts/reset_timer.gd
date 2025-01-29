extends Timer

signal started

@onready var countdown: String = $Label.text


func _on_timeout() -> void:
	$Label.visible = false
	get_tree().reload_current_scene()


func _on_started() -> void:
	$Label.visible = true 
	
	
func reset_timer() -> void:
	start(3.0)
	started.emit()


func _process(_delta: float) -> void:
	$Label.text = "Get Ready in... " + str(round($".".time_left))
