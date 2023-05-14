extends CharacterBody2D


var max_speed :float = 500.0
var rotation_speed :float = PI * 3.0
var time_acceleration :float = 1.45

# Utiliser dans une fonction lerp ; doit être compris entre 0 et 1
var deceleration_time :float = 0.15

# Mouvements ; Pour gérer le temps d'accélération
var input_time :float = 0.0


func expoOut(time :float):
	if time > 0.499 : 
		return 1.0
	return 1.0 - pow(2, -10 * abs(time))


func rotate_to_mouse(delta):
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


func get_input(delta):
	var vector_direction :Vector2 = Vector2(0.0, 0.0);
	
	if Input.is_action_pressed("up"):
		vector_direction.y -= 1.0
		
	if Input.is_action_pressed("down"):
		vector_direction.y += 1.0

	if Input.is_action_pressed("left"):
		vector_direction.x -= 1.0
		
	if Input.is_action_pressed("right"):
		vector_direction.x += 1.0
	
	if vector_direction != Vector2(0.0, 0.0):
		input_time += delta * time_acceleration
		velocity = expoOut(input_time) * vector_direction.normalized() * max_speed
	else:
		input_time = 0.0
		velocity = Vector2(
			lerp(velocity.x, 0.0, deceleration_time),
			lerp(velocity.y, 0.0, deceleration_time)
		)


func _physics_process(delta):
	rotate_to_mouse(delta)
	get_input(delta)
	move_and_slide()
