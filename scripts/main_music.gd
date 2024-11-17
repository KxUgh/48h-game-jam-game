extends AudioStreamPlayer

func _ready() -> void:
	finished.connect(start)

func start() -> void:
	play()
