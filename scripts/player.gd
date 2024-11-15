class_name Player
extends Entity

@export var speed: float

func _ready() -> void:
	pass 

func _physics_process(delta: float) -> void:
	var x_direction: float = Input.get_axis("left","right")
	var y_direction: float = Input.get_axis("up","down")
	var direction: Vector2 = Vector2(x_direction,y_direction).normalized()
	
	velocity = speed * direction
	move_and_slide()
