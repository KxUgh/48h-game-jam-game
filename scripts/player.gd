class_name Player
extends Entity

signal health_changed()

@export var wand: Weapon
@export var base_speed: float
@export var acceleration: float
@export var casting_time: float

@onready var since_last_cast: float = casting_time
@onready var speed = base_speed

func _physics_process(delta: float) -> void:
	super(delta)
	since_last_cast += delta
	calculate_speed()
	
	var x_direction: float = Input.get_axis("left","right")
	var y_direction: float = Input.get_axis("up","down")
	var direction: Vector2 = Vector2(x_direction,y_direction).normalized()
	
	velocity = lerp(velocity,speed * direction,acceleration * delta)
	
	if Input.is_action_just_pressed("attack") and can_attack():
		wand.attack(position,get_global_mouse_position())
		since_last_cast = 0
		since_last_attack = 0
	
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
	
func can_attack() -> bool:
	return super()
	
func calculate_speed() -> void:
	if since_last_cast < casting_time:
		speed = base_speed * 0.3
	else:
		speed = base_speed
