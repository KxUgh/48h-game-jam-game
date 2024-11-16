extends Attack

@export var speed: float
@export var max_duration: float

@onready var duration: float = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	duration += delta
	var direction: Vector2 = Vector2(cos(rotation),sin(rotation)).normalized()
	position += speed * direction * delta
	if duration > max_duration or targets_hit > 0:
		queue_free()
