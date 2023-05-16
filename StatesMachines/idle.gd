# idle state
extends BaseState

# Recoit les états qui lui sont utils et les prépares pour utilisation
@export_node_path("Node") var walk_node
@export_node_path("Node") var crouch_node

@onready var walk_state: BaseState = get_node(walk_node)
@onready var crouch_state: BaseState = get_node(crouch_node)

func enter() -> void:
	pass

func physics_process(_delta: float) -> BaseState:
	if is_moving():
		return walk_state
	
	if Input.is_action_pressed("crouch"):
		return crouch_state
	
	return null
