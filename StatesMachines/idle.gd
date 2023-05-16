# idle state
extends BaseState

# Recoit les états qui lui sont utils etles prépares pour utilisation
@export_node_path("Node") var walk_node

@onready var walk_state: BaseState = get_node(walk_node)


func enter() -> void:
	print("idle state");

func input(_event) -> BaseState:
	if Input.is_action_pressed("up") || Input.is_action_pressed("down") || Input.is_action_pressed("left") || Input.is_action_pressed("right"):
		return walk_state
	
	return null
