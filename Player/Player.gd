class_name Player
extends CharacterBody2D

@onready var states = $state_manager

# Variable pour les animations à ajouter
#@onready var animations = $animations

func rotate_to_mouse(delta: float) -> void:
	var rotation_speed: float = PI * 3.0
	# Rotation douce entre le joueur et le viseur (la souris)
	# On récupère le vecteur entre notre joueur et le viseur
	var vec_to_aim = get_global_mouse_position() - global_position
	
	# On récupère l'angle entre cette nouvelle direction et la direstion actuelle
	var angle_to_target = vec_to_aim.angle()
	
	# On récupère la rotation autorisée cette frame
	var allowed_rotation = rotation_speed * delta
	
	# On récupère la rotation complète vers le viseur
	angle_to_target = lerp_angle(global_rotation, angle_to_target, 1.0)
	
	# On limite la rotation à celle autorisée cette frame
	angle_to_target = clamp(
		angle_to_target,
		global_rotation - allowed_rotation,
		global_rotation + allowed_rotation
	)
	
	# On définit la rotation du joueur !
	global_rotation = angle_to_target

func _ready() -> void:
	states.init(self)

# Permet de propager un input dans l'abre de noeuds de l'objet actuel ('player')
func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)
