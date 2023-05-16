# walk state
extends MoveStates

# Récupération des états
@export_node_path("Node") var idle_node

@onready var idle_state: BaseState = get_node(idle_node)

func enter() -> void:
	# Pour appeler la fonction parente et la surcharger ici
	#super()
	print("+++ENTER+++ walk")

func exit() -> void:
	print("---EXIT--- walk")

func physics_process(delta: float) -> BaseState:
	super(delta)
	
	if player.velocity.length() == 0.0:
		return idle_state
	
	return null
