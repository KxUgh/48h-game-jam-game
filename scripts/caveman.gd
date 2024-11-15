extends Enemy

@export var nav_agent: NavigationAgent2D
@export var nav_timer: Timer

var target: Player

func _ready() -> void:
	find_target()
	nav_timer.timeout.connect(update_nav_agent)

func _physics_process(delta: float) -> void:
	var next_path_position: Vector2 = nav_agent.get_next_path_position()
	var direction: Vector2 = position.direction_to(next_path_position)
	
	velocity = direction * speed
	move_and_slide()

func find_target() -> void:
	var players = get_tree().get_nodes_in_group("Players")
	if len(players) > 0:
		target = players[0]
		
func update_nav_agent() -> void:
	nav_agent.target_position = target.position
