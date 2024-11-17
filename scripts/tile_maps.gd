extends Node2D
@export var level_layers: Array[TileMapLayer]

@onready var original_layer_count: int = len(level_layers)

var level_index: int = 0

func _ready() -> void:
	SignalBus.enemies_killed.connect(change_level_appearance)
	# Disable them so that they can remain enabled in the editor
	for layer in level_layers:
		layer.enabled = false

func change_level_appearance() -> void:
	SignalBus.score_changed.emit(level_index+1)
	if level_index >= len(level_layers):
		var new_layer: TileMapLayer = level_layers[level_index % original_layer_count].duplicate()
		add_child(new_layer)
		level_layers.append(new_layer)
	level_layers[level_index].enabled = true
	level_index += 1
	await get_tree().physics_frame
	SignalBus.spawn_enemies.emit()
