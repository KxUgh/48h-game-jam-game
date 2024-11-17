class_name RootNode
extends Node2D

@export var player: Player
@export var death_screen: Control

func _ready() -> void:
	player.player_died.connect(deadify)

func _physics_process(delta: float) -> void:
	var enemies: Array[Node] = get_tree().get_nodes_in_group("Enemies")
	if len(enemies) == 0:
		SignalBus.enemies_killed.emit()


func deadify() -> void:
	await get_tree().create_timer(0.1).timeout
	death_screen.visible = true
