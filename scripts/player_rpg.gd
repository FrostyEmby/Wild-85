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
	
	var x_dir = (int(right) - int(left)) # outputs 1, 0, or -1 depending on which switches are pressed
	var y_dir = (int(down) - int(up)) # outputs 1, 0, or -1 depending on which switches are pressed
	
	velocity.x += x_dir * speed
	velocity.y += y_dir * speed
	move_and_slide() # movement output
