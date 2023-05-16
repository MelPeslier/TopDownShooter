extends MoveStates

@export_node_path("Node") var walk_node

@onready var walk_state = get_node(walk_node)

var run_speed: float = 700.0
var run_to_walk_limit: float = 700 * 0.7

func enter() -> void:
	speed = run_speed
	print("+++ENTER+++ run")

func exit() -> void:
	print("---EXIT--- run")

func physics_process(delta: float) -> BaseState:
	super(delta)
	
	if Input.is_action_just_pressed("run"):
		return walk_state
	
	elif player.velocity.length() < run_to_walk_limit and not is_moving():
		return walk_state
	
	return null
