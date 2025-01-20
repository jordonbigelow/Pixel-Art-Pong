extends CharacterBody2D


@export var speed = 300.0
@export var player_number: int

func _physics_process(delta: float) -> void:
	if player_number == 1:
		if Input.is_action_just_pressed("p1_move_up"):
			velocity.y -= 1
		elif Input.is_action_just_pressed("p1_move_down"):
			velocity.y += 1
		var direction := Input.get_axis("p1_move_up", "p1_move_down")
		if direction:
			velocity.y = direction * speed
		else:
			velocity.y = 0
	elif player_number == 2:
		if Input.is_action_just_pressed("p2_move_up"):
			velocity.y -= 1
		elif Input.is_action_just_pressed("p2_move_down"):
			velocity.y += 1
		var direction := Input.get_axis("p2_move_up", "p2_move_down")
	
		if direction:
			velocity.y = direction * speed
		else:
			velocity.y = 0

	move_and_slide()
