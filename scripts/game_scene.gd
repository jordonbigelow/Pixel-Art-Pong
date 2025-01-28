extends Node

@onready var player_1_paddle: Sprite2D = $"Player 1 Paddle".get_child(0)
@onready var player_2_paddle: Sprite2D = $"Player 2 Paddle".get_child(0)
@onready var player_1_score: Label = $"Player 1 Score"
@onready var player_2_score: Label = $"Player 2 Score"


func _ready() -> void:
	player_1_paddle.texture = load("res://assets/paddles/p1_paddle.png")
	player_2_paddle.texture = load("res://assets/paddles/p2_paddle.png")
	player_1_score.text = str(Globals.player_1_score)
	player_2_score.text = str(Globals.player_2_score)
	

func _process(_delta: float) -> void:
	player_1_score.text = str(Globals.player_1_score)
	player_2_score.text = str(Globals.player_2_score)


func _on_reset_button_pressed() -> void:
	$ResetTimer.reset_timer()
		
	
func _on_player_one_back_wall_body_entered(body: Node2D) -> void:
	Globals.player_2_score += 1
	body.queue_free()
	$ResetTimer.reset_timer()
	

func _on_player_two_back_wall_body_entered(body: Node2D) -> void:
	Globals.player_1_score +=1
	body.queue_free()
	$ResetTimer.reset_timer()

	
