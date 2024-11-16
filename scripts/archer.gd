extends Enemy

@export var nav_agent: NavigationAgent2D
@export var nav_timer: Timer
@export var sprite: AnimatedSprite2D
@export var bow: Weapon
@export var desired_distance: float
var target: Player

func _ready() -> void:
	find_target()
	nav_timer.timeout.connect(update_nav_agent)
	since_last_attack = 0

func _physics_process(delta: float) -> void:
	super(delta)
		
	var next_path_position: Vector2 = nav_agent.get_next_path_position()
	var direction: Vector2 = position.direction_to(next_path_position)
	
	if position.distance_to(next_path_position) > 15:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	
	
	sprite.scale.x = sign(target.position.x - position.x)
	
	if velocity.length() > 0:
		request_animation_change("walk")
	else:
		request_animation_change("idle")
	
	if can_attack():
		request_animation_change("attack")
		bow.attack(position,target.position)
		since_last_attack = 0

	move_and_slide()

func find_target() -> void:
	var players = get_tree().get_nodes_in_group("Players")
	if len(players) > 0:
		target = players[0]

func update_nav_agent() -> void:
	var move_direction: Vector2 = target.position.direction_to(position)
	nav_agent.target_position = target.position + move_direction * desired_distance
	
func can_attack() -> bool:
	return super()
	
func take_damage(damage: float) -> bool:
	if not super(damage):
		return false
	request_animation_change("hit")
	health -= damage
	health = clampf(health,0,max_health)
	if health == 0:
		die()
	return true
	
func die() -> void:
	queue_free()
	
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
