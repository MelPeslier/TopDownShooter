class_name MoveStates
extends BaseState

var speed: float = 500.0
var time_acceleration: float = 1.45
var deceleration_time: float = 0.15
var stop_smooth: float = 0.99

# Pour gérer l'accélération
var input_time: float = 0.0

# Pour connaitre la direction
var vector_direction :Vector2 = Vector2(0.0, 0.0);

func expoOut(time :float):
	if time > 0.499 : 
		return 1.0
	return 1.0 - pow(2, -10 * abs(time))

func get_direction_input() -> void:
	vector_direction = Vector2(0.0, 0.0);
	
	if Input.is_action_pressed("up"):
		vector_direction.y -= 1.0
		
	if Input.is_action_pressed("down"):
		vector_direction.y += 1.0

	if Input.is_action_pressed("left"):
		vector_direction.x -= 1.0
		
	if Input.is_action_pressed("right"):
		vector_direction.x += 1.0

func physics_process(delta: float) -> BaseState:
	super(delta)
	get_direction_input()
	
	if vector_direction.x != 0.0 || vector_direction.y != 0.0:
		input_time += delta * time_acceleration
		player.velocity = expoOut(input_time) * vector_direction.normalized() * speed
	else:
		input_time = 0.0
		player.velocity = Vector2(
			lerp(player.velocity.x, 0.0, deceleration_time),
			lerp(player.velocity.y, 0.0, deceleration_time)
		)
		if player.velocity.length() <= stop_smooth and player.velocity.length() >= -stop_smooth:
			player.velocity = Vector2.ZERO
	
	player.move_and_slide()
	
	return null
