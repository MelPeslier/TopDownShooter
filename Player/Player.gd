class_name Player
extends CharacterBody2D

@onready var states = $state_manager

# Variable pour les animations à ajouter
#@onready var animations = $animations

# Pour gérer l'accélération
var input_time: float = 0.0

func _ready() -> void:
	states.init(self)

# Permet de propager un input dans l'abre de noeuds de l'objet actuel ('player')
func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)
