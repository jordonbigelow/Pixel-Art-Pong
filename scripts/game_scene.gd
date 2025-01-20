extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"Player 1 Score".text = "Player 1 Score: " + str(Globals.player_1_score)
	$"Player 2 Score".text = "Player 2 Score: " + str(Globals.player_2_score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"Player 1 Score".text = "Player 1 Score: " + str(Globals.player_1_score)
	$"Player 2 Score".text = "Player 2 Score: " + str(Globals.player_2_score)
