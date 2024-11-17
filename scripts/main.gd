class_name RootNode
extends Node2D

@export var player: Player
@export var death_screen: PackedScene

func _ready() -> void:
	player.player_died.connect(deadify)
	SignalBus.enemy_killed.connect(check_enemies)

func check_enemies() -> void:
	await get_tree().process_frame
	var enemies: Array[Node] = get_tree().get_nodes_in_group("Enemies")
	if len(enemies) == 0:
		await get_tree().physics_frame
		SignalBus.enemies_killed.emit()

func deadify() -> void:
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_packed(death_screen)
