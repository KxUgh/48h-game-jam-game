extends Attack

@export var speed: float
@export var max_duration: float

@onready var duration: float = 0

func _physics_process(delta: float) -> void:
	duration += delta
	var direction: Vector2 = Vector2(cos(rotation),sin(rotation)).normalized()
	position += speed * direction * delta
	if duration > max_duration:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	super(body)
	queue_free()
