# idle state
extends BaseState

# Recoit les états qui lui sont utils et les prépares pour utilisation
@export_node_path("Node") var walk_node

@onready var walk_state: BaseState = get_node(walk_node)

func enter() -> void:
	print("+++ENTER+++ idle")

func exit() -> void:
	print("---EXIT--- idle")

func input(_event) -> BaseState:
	if is_moving():
		return walk_state
	
	return null
