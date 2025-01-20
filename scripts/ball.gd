extends RigidBody2D

const SPEED: float = .1
var velocity: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(-SPEED, 0.1)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision := move_and_collide(velocity)
	
	if collision:
		if collision.get_collider_id() == 30198990121:
			print("Game Over")
			get_tree().paused = true
		elif collision.get_collider_id() == 30232544555:
			print("Game Over")
			get_tree().paused = true
		if collision.get_collider_id() == 29964109068:
			Globals.player_1_score += 1
		elif collision.get_collider_id() == 30014440717:
			Globals.player_2_score += 1
			
		var normal := collision.get_normal()
		velocity = velocity.bounce(normal)
