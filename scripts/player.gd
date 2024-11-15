class_name Player
extends Entity

@export var sword: Weapon
@export var speed: float

func _ready() -> void:
	pass 

func _physics_process(_delta: float) -> void:
	var x_direction: float = Input.get_axis("left","right")
	var y_direction: float = Input.get_axis("up","down")
	var direction: Vector2 = Vector2(x_direction,y_direction).normalized()
	
	velocity = speed * direction
	
	if Input.is_action_just_pressed("attack"):
		sword.attack(position,get_global_mouse_position())
	
	move_and_slide()
	
func take_damage(damage: float) -> void:
	health -= damage
	health = clampf(health,0,max_health)
	print(health)
