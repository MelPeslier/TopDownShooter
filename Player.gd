extends CharacterBody2D


var max_speed :float = 500.0
var acceleration :float = 375.0


func get_input():
	if Input.is_action_pressed("move_up"):
		velocity.y -= acceleration
		if velocity.y < -max_speed:
			velocity.y = -max_speed
	elif Input.is_action_pressed("move_down"):
		velocity.y += acceleration
		if velocity.y > max_speed:
			velocity.y = max_speed;
	else:
		velocity.y = lerp(velocity.y, 0.0, 0.15)
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= acceleration
		if velocity.x < -max_speed:
			velocity.x = -max_speed
	elif Input.is_action_pressed("move_right"):
		velocity.x += acceleration
		if velocity.x > max_speed:
			velocity.x = max_speed;
	else:
		velocity.x = lerp(velocity.x, 0.0, 0.15)
	



func _physics_process(_delta):
	get_input()
	move_and_slide()
