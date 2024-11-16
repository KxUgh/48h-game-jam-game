class_name Entity
extends CharacterBody2D

@export var max_health: float
@export var damage_delay: float

@onready var health: float = max_health
@onready var since_last_damage: float = damage_delay

func _physics_process(delta: float) -> void:
	since_last_damage += delta

func take_damage(_damage: float) -> void:
	pass
	
func heal(_amount: float) -> void:
	pass
