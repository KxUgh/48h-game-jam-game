class_name Entity
extends CharacterBody2D

@export var max_health: float
@export var attack_cooldown: float
@export var damage_delay: float

@onready var health: float = max_health
@onready var since_last_damage: float = damage_delay
@onready var since_last_attack: float = attack_cooldown

func _physics_process(delta: float) -> void:
	since_last_damage += delta
	since_last_attack += delta

func take_damage(_damage: float) -> void:
	if since_last_damage < damage_delay:
		return
	since_last_damage = 0
	
func heal(_amount: float) -> void:
	pass
	
func can_attack() -> bool:
	return since_last_attack > attack_cooldown and since_last_damage > damage_delay
