extends Area2D

@export var heal_amount: float

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	

func _on_body_entered(body: Node2D) -> void:
	if body is Entity:
		if body.health != body.max_health:
			body.heal(heal_amount)
			queue_free()
