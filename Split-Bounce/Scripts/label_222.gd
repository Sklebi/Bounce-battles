extends Label

@onready var timer: Timer = $"../../Timer"

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if timer.is_stopped():
		text = "0s"
		return
		
	var seconds_left: int = int(ceil(timer.time_left))
	text = str(seconds_left) + "s"
