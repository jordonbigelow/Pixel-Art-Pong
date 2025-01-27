extends Node

@onready var player_1_paddle: Sprite2D = $"Player 1 Paddle".get_child(0)
@onready var player_2_paddle: Sprite2D = $"Player 2 Paddle".get_child(0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_1_paddle.texture = load("res://assets/lightsaber_jedi_side.png")
	player_2_paddle.texture = load("res://assets/lightsaber_dark_side.png")
	$"Player 1 Score".text = "Player 1 Score: " + str(Globals.player_1_score)
	$"Player 2 Score".text = "Player 2 Score: " + str(Globals.player_2_score)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$"Player 1 Score".text = "Player 1 Score: " + str(Globals.player_1_score)
	$"Player 2 Score".text = "Player 2 Score: " + str(Globals.player_2_score)
