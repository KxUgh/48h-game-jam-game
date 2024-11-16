extends Enemy

@export var damage: float
@export var attack_cooldown: float
@onready var since_last_attack: float = attack_cooldown
@export var arrow: Weapon

var target: Player

func _ready() -> void:
	pass # Replace with function body.
func _physics_process(delta: float) -> void:
	since_last_attack += delta
	if(can_attack()):
		arrow.attack(position,target.position)
		since_last_attack=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func can_attack() -> bool:
	return since_last_attack > attack_cooldown
