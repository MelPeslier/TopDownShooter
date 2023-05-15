class_name BaseState
extends Node

enum State{
	NULL,
	IDLE,
	WALK,
}

@export var animation_name :String

var player: Player

func rotate_to_mouse(delta: float) -> void:
	var rotation_speed: float = PI * 3.0
	# Rotation douce entre le joueur et le viseur (la souris)
	# On récupère le vecteur entre notre joueur et le viseur
	var vec_to_aim = player.get_global_mouse_position() - player.global_position
	
	# On récupère l'angle entre cette nouvelle direction et la direstion actuelle
	var angle_to_target = vec_to_aim.angle()
	
	# On récupère la rotation autorisée cette frame
	var allowed_rotation = rotation_speed * delta
	
	# On récupère la rotation complète vers le viseur
	angle_to_target = lerp_angle(player.global_rotation, angle_to_target, 1.0)
	
	# On limite la rotation à celle autorisée cette frame
	angle_to_target = clamp(
		angle_to_target,
		player.global_rotation - allowed_rotation,
		player.global_rotation + allowed_rotation
	)
	
	# On définit la rotation du joueur !
	player.global_rotation = angle_to_target

# Fonction pour gérer l'animation à ajouter
func enter() -> void:
	#player.animations.play(animation_name)
	pass

func exit() -> void:
	pass

func input(_event: InputEvent) -> int:
	return State.NULL

func process(_delta: float) -> int:
	return State.NULL

func physics_process(delta: float) -> int:
	rotate_to_mouse(delta)
	return State.NULL
