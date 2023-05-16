extends BaseState

@export_node_path("Node") var idle_node
@export_node_path("Node") var crouch_walk_node

@onready var idle_state: BaseState = get_node(idle_node)
@onready var crouch_walk_state: BaseState = get_node(crouch_walk_node)

func enter() -> void:
	pass

func input(_event: InputEvent) -> BaseState:
	if Input.is_action_just_released("crouch"):
		return idle_state
		
	if is_moving():
		return crouch_walk_state
	
	return null
