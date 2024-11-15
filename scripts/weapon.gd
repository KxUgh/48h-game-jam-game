# A virtual class which allows for a modular weapon system
class_name Weapon
extends Node2D

@export var weapon_owner: CollisionObject2D
@export var damage: float

func attack(_origin_position: Vector2, _target_position: Vector2) -> void:
	pass

func init_attack(attack_scene: PackedScene) -> Attack:
	var attack_instance: Attack = attack_scene.instantiate()
	attack_instance.collision_layer = weapon_owner.collision_layer
	attack_instance.collision_mask = weapon_owner.collision_mask
	attack_instance.damage = damage
	return attack_instance
