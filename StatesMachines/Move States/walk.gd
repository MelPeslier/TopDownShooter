# walk state
extends MoveStates

# Récupération des états
@export_node_path("Node") var idle_node
@export_node_path("Node") var run_node
@export_node_path("Node") var crouch_walk_node

@onready var idle_state: BaseState = get_node(idle_node)
@onready var run_state: BaseState = get_node(run_node)
@onready var crouch_walk_state: BaseState = get_node(crouch_walk_node)

var walk_speed: float = 450.0

func enter() -> void:
	speed = walk_speed

func physics_process(delta: float) -> BaseState:
	super(delta)
	
	if not is_moving():
		return idle_state
	
	if Input.is_action_just_pressed("run"):
		return run_state
	
	if Input.is_action_just_pressed("crouch"):
		return crouch_walk_state
	
	return null
