extends Node

@onready var states = {
	BaseState.State.IDLE: $idle,
	BaseState.State.WALK: $walk,
}

var current_state: BaseState

func change_state(new_state: int) -> void:
	if current_state:
		current_state.exit()
	
	current_state = states[new_state]
	current_state.enter()

func init(player: Player) -> void:
	for child in get_children():
		child.player = player
	
	change_state(BaseState.State.IDLE)

# Fonction personnel, run sur le '_physics_process' du 'Player' qui l'appel
# Pas la '_physics_process' de ce noeud
func physics_process(delta: float) -> void:
	var new_state = current_state.physics_process(delta)
	if new_state != BaseState.State.NULL:
		change_state(new_state)

func input(event: InputEvent) -> void:
	var new_state = current_state.input(event)
	if new_state != BaseState.State.NULL:
		change_state(new_state)
