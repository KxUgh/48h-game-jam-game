extends TileMapLayer

var all_layers: Array[TileMapLayer]
var higher_layers: Array[TileMapLayer]

func _ready() -> void:
	var siblings: Array[Node] = get_parent().get_children()
	for sibling in siblings:
		if sibling is TileMapLayer:
			all_layers.append(sibling)
	higher_layers = all_layers.slice(all_layers.find(self)+1)

func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	for other_layer in higher_layers:
		if not other_layer.enabled:
			return false
		if coords in other_layer.get_used_cells():
			return true
	return false

func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	tile_data.set_navigation_polygon(0,null)
