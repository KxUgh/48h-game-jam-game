extends Attack

@export var sprite: AnimatedSprite2D

func _process(delta: float) -> void:
	if not sprite.is_playing():
		queue_free()
