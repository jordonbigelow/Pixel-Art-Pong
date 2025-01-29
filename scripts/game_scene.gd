extends Node

@onready var player_1_paddle: Sprite2D = $"Player 1 Paddle".get_child(0)
@onready var player_2_paddle: Sprite2D = $"Player 2 Paddle".get_child(0)
@onready var player_1_score: Label = $"Player 1 Score"
@onready var player_2_score: Label = $"Player 2 Score"

@onready var start_screen: PackedScene = load("res://scenes/start_screen.tscn")

signal player_1_won
signal player_2_won


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
	
	if check_if_player_won(Globals.player_1_score, Globals.player_2_score):
		player_2_won.emit()	
	else:
		$ResetTimer.reset_timer()
		
	play_scored_sound()
	

func _on_player_two_back_wall_body_entered(body: Node2D) -> void:
	Globals.player_1_score +=1
	body.queue_free()
	
	if check_if_player_won(Globals.player_1_score, Globals.player_2_score):	
		player_1_won.emit()
	else:
		$ResetTimer.reset_timer()
		
	play_scored_sound()
	
	
func play_scored_sound() -> void:
	$PlayerScored.play(1.20)
	
	
func check_if_player_won(p1_score: int, p2_score: int) -> bool:
	if p1_score >= Globals.MAX_SCORE and p1_score > p2_score + 1:
		return true
	if p2_score >= Globals.MAX_SCORE and p2_score > p1_score + 1:
		return true
	else:
		return false


func _on_player_1_won() -> void:
	$PlayerWon.play(0.2)
	$PlayerWonLabel.text = "Player 1 is the Winner!"
	$PlayerWonLabel.visible = true
	$ResetButton.visible = false
	
	
func _on_player_2_won() -> void:
	$PlayerWon.play(0.2)
	$PlayerWonLabel.text = "Player 2 is the Winner!"
	$PlayerWonLabel.visible = true
	$ResetButton.visible = false
	

func _on_back_button_pressed() -> void:
	reset_player_scores()
	get_tree().change_scene_to_packed(start_screen)	


func reset_player_scores() -> void:
	Globals.player_1_score = 0
	Globals.player_2_score = 0
