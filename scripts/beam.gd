extends Attack

@export var sprite: AnimatedSprite2D


func _process(_delta: float) -> void:
	if not sprite.is_playing():
		queue_free()
	if sprite.frame > 7:
		monitoring = true
