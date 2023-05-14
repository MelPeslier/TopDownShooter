extends CharacterBody2D


var max_speed :float = 500.0
var acceleration :float = 375.0
var rotation_speed :float = PI * 3.0

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
	



func _physics_process(delta):
	# Rotation douce entre le joueur et le viseur (la souris)
	# On récupère le vecteur entre notre joueur et le viseur
	var vec_to_aim = get_global_mouse_position() - global_position
	
	# On récupère l'angle entre cette nouvelle direction et la direstion actuelle
	var angle_to_target = vec_to_aim.angle()
	
	# On récupère la rotation autorisée cette frame
	var allowed_rotation = rotation_speed * delta
	
	# On récupère la rotation complète vers le viseur
	angle_to_target = lerp_angle(global_rotation, angle_to_target, 1.0)
	
	# On limite la rotation à celle autorisée cete frame
	angle_to_target = clamp(
		angle_to_target,
		global_rotation - allowed_rotation,
		global_rotation + allowed_rotation
	)
	
	# On définit la rotation du joueur !
	global_rotation = angle_to_target
	
	get_input()
	move_and_slide()
