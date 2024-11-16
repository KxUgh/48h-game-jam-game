class_name Enemy
extends Entity

@export var speed: float

func _physics_process(delta: float) -> void:
	super(delta)

func take_damage(damage: float) -> bool:
	return super(damage)

func can_attack() -> bool:
	return super()
