extends Weapon

@export var slash: PackedScene

func attack(origin_position: Vector2, target_position: Vector2) -> void:
	var angle: float = origin_position.angle_to_point(target_position)
	var slash_instance: Attack = init_attack(slash)
	slash_instance.rotation = angle
	add_child(slash_instance)
