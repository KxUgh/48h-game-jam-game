extends Weapon

@export var spell: PackedScene

func attack(_origin_position: Vector2, target_position: Vector2) -> void:
	var spell_instance: Attack = init_attack(spell)
	spell_instance.position = target_position
	add_child(spell_instance)
