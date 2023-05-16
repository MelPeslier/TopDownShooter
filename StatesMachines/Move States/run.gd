extends MoveStates

@export_node_path("Node") var walk_node

@onready var walk_state = get_node(walk_node)

@export var run_speed: float = 700.0
@export var run_to_walk_limit: float = 450.0

func enter() -> void:
	speed = run_speed
	input_time = 0.6

func physics_process(delta: float) -> BaseState:
	super(delta)
	
	if Input.is_action_just_pressed("run"):
		return walk_state
	
	if player.velocity.length() < run_to_walk_limit and not is_moving():
		return walk_state
	
	return null
