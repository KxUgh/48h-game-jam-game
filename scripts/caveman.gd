extends Enemy

@export var nav_agent: NavigationAgent2D
@export var nav_timer: Timer
@export var club: Weapon
@export var attack_cooldown: float

@onready var since_last_attack: float = attack_cooldown

var target: Player

func _ready() -> void:
	find_target()
	nav_timer.timeout.connect(update_nav_agent)

func _physics_process(delta: float) -> void:
	since_last_attack += delta
	
	var next_path_position: Vector2 = nav_agent.get_next_path_position()
	var direction: Vector2 = position.direction_to(next_path_position)
	
	print(position.distance_to(target.position))
	if position.distance_to(target.position) > 40:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
		if can_attack():
			club.attack(position,target.position)
			since_last_attack = 0
	move_and_slide()

func find_target() -> void:
	var players = get_tree().get_nodes_in_group("Players")
	if len(players) > 0:
		target = players[0]
		
func update_nav_agent() -> void:
	nav_agent.target_position = target.position
	
func can_attack() -> bool:
	return since_last_attack > attack_cooldown
