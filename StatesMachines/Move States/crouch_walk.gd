extends MoveStates

@export_node_path("Node") var crouch_node
@export_node_path("Node") var walk_node

@onready var crouch_state: BaseState = get_node(crouch_node)
@onready var walk_state: BaseState = get_node(walk_node)

@export var crouch_walk_speed: float = 150.0

func enter() -> void:
	speed = crouch_walk_speed

func input(_event: InputEvent) -> BaseState:
	if not is_moving():
		return crouch_state
	
	if Input.is_action_just_released("crouch"):
		return walk_state
	
	return null
