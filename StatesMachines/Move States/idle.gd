# idle state
extends BaseState

# Recoit les états qui lui sont utils et les prépares pour utilisation
@export_node_path("Node") var walk_node

@onready var walk_state: BaseState = get_node(walk_node)

func enter() -> void:
	print("+++ENTER+++ idle")

func exit() -> void:
	print("---EXIT--- idle")

func get_move_input() -> bool:
	return Input.is_action_pressed("up") || Input.is_action_pressed("down") || Input.is_action_pressed("left") || Input.is_action_pressed("right")

func input(_event) -> BaseState:
	if get_move_input():
		return walk_state
	
	return null
