class_name Player
extends Entity

signal health_changed()

@export var sword: Weapon
@export var speed: float
@export var acceleration: float

func _ready() -> void:
	pass 

func _physics_process(delta: float) -> void:
	super(delta)
	var x_direction: float = Input.get_axis("left","right")
	var y_direction: float = Input.get_axis("up","down")
	var direction: Vector2 = Vector2(x_direction,y_direction).normalized()
	
	velocity = lerp(velocity,speed * direction,acceleration * delta)
	
	if Input.is_action_just_pressed("attack"):
		sword.attack(position,get_global_mouse_position())
	
	move_and_slide()
	
func take_damage(damage: float) -> bool:
	if not super(damage):
		return false
	health -= damage
	health = clampf(health,0,max_health)
	health_changed.emit()
	return true
	
func heal(amount: float) -> void:
	health += amount
	health = clampf(health,0,max_health)
	health_changed.emit()
