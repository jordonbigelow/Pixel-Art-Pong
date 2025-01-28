extends Node

@onready var player_1_paddle: Sprite2D = $"Player 1 Paddle".get_child(0)
@onready var player_2_paddle: Sprite2D = $"Player 2 Paddle".get_child(0)
@onready var player_1_score: Label = $"Player 1 Score"
@onready var player_2_score: Label = $"Player 2 Score"


func _ready() -> void:
	player_1_paddle.texture = load("res://assets/lightsaber_jedi_side.png")
	player_2_paddle.texture = load("res://assets/lightsaber_dark_side.png")
	player_1_score.text = str(Globals.player_1_score)
	player_2_score.text = str(Globals.player_2_score)
	

func _process(_delta: float) -> void:
	player_1_score.text = str(Globals.player_1_score)
	player_2_score.text = str(Globals.player_2_score)


func _on_reset_button_pressed() -> void:
	reset_timer()
		
	
func _on_player_one_back_wall_body_entered(body: RigidBody2D) -> void:
	Globals.player_2_score += 1
	$Ball.queue_free()
	reset_timer()
	

func _on_player_two_back_wall_body_entered(body: RigidBody2D) -> void:
	Globals.player_1_score +=1
	$Ball.queue_free()
	reset_timer()


func reset_timer() -> void:
	$ResetTimer.start(3.0)
	$ResetTimer.started.emit()
