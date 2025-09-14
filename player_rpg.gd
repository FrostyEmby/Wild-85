extends CharacterBody2D

@export var speed : int = 300
@export var skating : bool = false # makes velocity stay in the picture frame by frame, allowing the player to gain momentum

func _process(delta: float) -> void:
	if not skating:
		velocity = Vector2.ZERO
	
	var up : bool = Input.is_action_pressed("up")
	var down : bool = Input.is_action_pressed("down")
	var right : bool = Input.is_action_pressed("right")
	var left : bool = Input.is_action_pressed("left")
	
	velocity.x += (int(right) - int(left)) * speed
	velocity.y += (int(down) - int(up)) * speed
	move_and_slide()
