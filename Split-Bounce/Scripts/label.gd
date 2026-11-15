extends Label

@export var camera_2d: Camera2D

func _process(delta: float) -> void:
	if camera_2d:
		text = "Score: %.0f" % -camera_2d.global_position.y
