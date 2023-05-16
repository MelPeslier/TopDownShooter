# walk state
extends MoveStates

# Récupération des états
@export_node_path("Node") var idle_node
@export_node_path("Node") var run_node

@onready var idle_state: BaseState = get_node(idle_node)
@onready var run_state: BaseState = get_node(run_node)

var walk_speed: float = 450.0

func enter() -> void:
	speed = walk_speed
	print("+++ENTER+++ walk")

func exit() -> void:
	print("---EXIT--- walk")

func physics_process(delta: float) -> BaseState:
	super(delta)
	
	if not is_moving():
		return idle_state
	
	if Input.is_action_just_pressed("run"):
		return run_state
	
	return null
