extends Enemy

@export var bow: Weapon

@export var target: Player

func _ready() -> void:
	pass # Replace with function body.
func _physics_process(delta: float) -> void:
	super(delta)
	if(can_attack()):
		bow.attack(position,target.position)
		since_last_attack=0

func can_attack() -> bool:
	return super()
