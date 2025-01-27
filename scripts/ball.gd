extends RigidBody2D

@export var speed: float = 250
var velocity: Vector2


func _ready() -> void:
	velocity = Vector2(-speed, randi_range(100, 150))
	
	
func _physics_process(delta: float) -> void:
	var scaled_velocity: Vector2 = velocity * delta
	var collision: KinematicCollision2D = move_and_collide(scaled_velocity)
	
	if collision:
		if collision.get_collider_id() == 30198990121:
			print("Game Over, Player 2 Wins")
			get_tree().paused = true
		elif collision.get_collider_id() == 30232544555:
			print("Game Over, Player 1 Wins")
			get_tree().paused = true
		if collision.get_collider_id() == 29964109068:
			Globals.player_1_score += 1
		elif collision.get_collider_id() == 30014440717:
			Globals.player_2_score += 1
			
		var normal: Vector2 = collision.get_normal()
		velocity = velocity.bounce(normal)
