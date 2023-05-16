class_name BaseState
extends Node

enum State{
	NULL,
	IDLE,
	WALK,
}

@export var animation_name :String

var player: Player

func enter() -> void:
# Pour gérer l'animation ; à ajouter
	#player.animations.play(animation_name)
	pass

func exit() -> void:
	pass

func input(_event: InputEvent) -> int:
	return State.NULL

func process(_delta: float) -> int:
	return State.NULL

func physics_process(delta: float) -> int:
	player.rotate_to_mouse(delta)
	return State.NULL
