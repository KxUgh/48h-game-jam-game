class_name Player
extends Entity

signal health_changed()
signal player_died()

@export var sprite: AnimatedSprite2D
@export var wand: Weapon
@export var base_speed: float
@export var acceleration: float
@export var casting_time: float

@onready var since_last_cast: float = casting_time
@onready var speed = base_speed

func _ready() -> void:
	since_last_attack = 0

func _physics_process(delta: float) -> void:
	super(delta)
	since_last_cast += delta
	calculate_speed()
	
	var x_direction: float = Input.get_axis("left","right")
	var y_direction: float = Input.get_axis("up","down")
	var direction: Vector2 = Vector2(x_direction,y_direction).normalized()
	
	velocity = lerp(velocity,speed * direction,acceleration * delta)
	
	var dir_to_mouse = position.direction_to(get_global_mouse_position())
	
	if dir_to_mouse.x != 0:
		sprite.scale.x = sign(dir_to_mouse.x)
	if velocity.length() > 0:
		request_animation_change("walk")
	else:
		request_animation_change("idle")
	
	if Input.is_action_just_pressed("attack") and can_attack():
		request_animation_change("attack")
		wand.attack(position,get_global_mouse_position())
		since_last_cast = 0
		since_last_attack = 0
	
	move_and_slide()
	
func take_damage(damage: float) -> bool:
	if not super(damage):
		return false
	request_animation_change("hit")
	health -= damage
	health = clampf(health,0,max_health)
	health_changed.emit()
	if health <= 0:
		player_died.emit()
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

func request_animation_change(requested_animation: String) -> void:
	var unskippable_anims: Array[String] = ["attack","hit"]
	var override_anims: Array[String] = ["attack"]
	if not sprite.is_playing():
		sprite.play(requested_animation)
		return
	if requested_animation in override_anims:
		sprite.play(requested_animation)
		return
	if sprite.animation not in unskippable_anims:
		sprite.play(requested_animation)
		return
