extends RigidBody2D

@export var speed: float = 250
var velocity: Vector2


func _ready() -> void:
	velocity = Vector2(-speed, randi_range(100, 150))
	
	
func _physics_process(delta: float) -> void:
	var scaled_velocity: Vector2 = velocity * delta
	var collision: KinematicCollision2D = move_and_collide(scaled_velocity)
	
	if collision:
		var normal: Vector2 = collision.get_normal()
		velocity = velocity.bounce(normal)
		$AudioStreamPlayer2D.play(0.0)
