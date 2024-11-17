extends Node2D

@export var player: Player
@export var death_screen: PackedScene

func _ready() -> void:
	player.player_died.connect(deadify)

func deadify() -> void:
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_packed(death_screen)
