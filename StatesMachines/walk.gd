# walk state
extends BaseState

@export var max_speed: float = 500.0
@export var time_acceleration: float = 1.45
@export var deceleration_time: float = 0.15

var stop_smooth: float = 0.99

var vector_direction :Vector2 = Vector2(0.0, 0.0);

func expoOut(time :float):
	if time > 0.499 : 
		return 1.0
	return 1.0 - pow(2, -10 * abs(time))

func get_input(delta: float) -> void:
	vector_direction = Vector2(0.0, 0.0);
	
	if Input.is_action_pressed("up"):
		vector_direction.y -= 1.0
		
	if Input.is_action_pressed("down"):
		vector_direction.y += 1.0

	if Input.is_action_pressed("left"):
		vector_direction.x -= 1.0
		
	if Input.is_action_pressed("right"):
		vector_direction.x += 1.0
	
	if vector_direction.x != 0.0 || vector_direction.y != 0.0:
		player.input_time += delta * time_acceleration
		player.velocity = expoOut(player.input_time) * vector_direction.normalized() * max_speed
	else:
		player.input_time = 0.0
		player.velocity = Vector2(
			lerp(player.velocity.x, 0.0, deceleration_time),
			lerp(player.velocity.y, 0.0, deceleration_time)
		)
		if player.velocity.length() <= stop_smooth and player.velocity.length() >= -stop_smooth:
			player.velocity = Vector2.ZERO

func enter() -> void:
	# Pour appeler la fonction parente et la surcharger ici
	#super()
	print("walk state")

func physics_process(delta: float) -> int:
	super(delta)
	
	get_input(delta)
	
	player.move_and_slide()

	if player.velocity.length() == 0.0:
		return State.IDLE
	
	return State.NULL
