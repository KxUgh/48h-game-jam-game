extends Control

@export var menu_button: Button
@export var exit_button: Button
# Called when the node enters the scene tree for the first time.
func _ready():
	menu_button.button_up.connect(on_menu_button_pressed)
	exit_button.button_up.connect(on_exit_button_pressed)

func on_menu_button_pressed() -> void:
	pass
	
func on_exit_button_pressed() -> void:
	get_tree().quit()
