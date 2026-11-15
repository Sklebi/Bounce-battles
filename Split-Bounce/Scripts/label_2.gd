extends Label

@export var timer: Timer

func _process(delta: float) -> void:
	if timer:
		text = "Time: %d" % round(timer.time_left)
