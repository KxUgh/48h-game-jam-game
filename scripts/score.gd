extends Label


func _ready() -> void:
	SignalBus.score_changed.connect(_on_score_changed)
	_on_score_changed(0)
	
func update_score() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_score_changed(score: int) -> void:
	text = "Score: " + str(score)
