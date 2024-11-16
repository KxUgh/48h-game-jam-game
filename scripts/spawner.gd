extends Node2D

@export var scene_to_spawn: PackedScene

@onready var root: Node2D = get_node("/root/RootNode")

func spawn() -> void:
	var scene_instance: Node2D = scene_to_spawn.instantiate()
	scene_instance.position = position
	root.add_child(scene_instance)
