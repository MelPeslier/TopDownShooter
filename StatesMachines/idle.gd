# idle state
extends BaseState

func enter() -> void:
	print("idle state");

func input(_event) -> int:
	if Input.is_action_pressed("up") || Input.is_action_pressed("down") || Input.is_action_pressed("left") || Input.is_action_pressed("right"):
		return State.WALK
	
	return State.NULL
