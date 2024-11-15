extends Node2D
@export var level_layers: Array[TileMapLayer]

var level_index: int = 0

func change_level_appearance() -> void:
	level_layers[level_index].enabled = true	
	level_index += 1
func _ready() -> void:
	change_level_appearance()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
