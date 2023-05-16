class_name BaseState
extends Node

@export var animation_name :String

var player: Player

func is_moving() -> bool:
	return Input.is_action_pressed("up") || Input.is_action_pressed("down") || Input.is_action_pressed("left") || Input.is_action_pressed("right")

func enter() -> void:
# Pour gérer l'animation ; à ajouter
	#player.animations.play(animation_name)
	pass

func exit() -> void:
	pass

func input(_event: InputEvent) -> BaseState:
	return null

func process(_delta: float) -> BaseState:
	return null

func physics_process(delta: float) -> BaseState:
	player.rotate_to_mouse(delta)
	return null
