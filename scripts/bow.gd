extends Weapon

@export var shot: PackedScene

func attack(origin_position: Vector2, target_position: Vector2) -> void:
	var angle: float = origin_position.angle_to_point(target_position)
	var shot_instance: Attack = init_attack(shot)
	shot_instance.rotation = angle
	shot_instance.position = origin_position
	add_child(shot_instance)
