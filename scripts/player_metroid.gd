extends CharacterBody2D

@export var speed : int = 130
@export var jump_height : int = 70
@export var push : int = 5

var doubleJumpReady := true

func _physics_process(delta: float) -> void:
	var up : bool = Input.is_action_just_pressed("up")
	var down : bool = Input.is_action_pressed("down")
	var right : bool = Input.is_action_pressed("right")
	var left : bool = Input.is_action_pressed("left")
	
	var x_dir = (int(right) - int(left)) # outputs 1, 0, or -1 depending on which switches are pressed
	
	velocity.x = 0
	velocity.x += x_dir * speed
	
	# jump
	if up:
		if is_on_floor():
			velocity.y = -sqrt(2 * get_gravity().y * jump_height)
			doubleJumpReady = true
		elif doubleJumpReady:
			velocity.y = -sqrt(2 * get_gravity().y * jump_height)
			doubleJumpReady = false
	
	# account for gravity
	velocity += get_gravity() * delta 
	
	# position moved based on collision and velocity
	var col = move_and_slide()
	
	if col:
		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			if collision.get_collider() is MovableBox:
				collision.get_collider().apply_central_impulse(-collision.get_normal() * push)
	
