extends Sprite2D

@export var fall_speed: float = 600

var init_y_pos: float = -360

#true if falling key has passed the allowed input frame
var has_passed: bool = false
var pass_threshold = 300.0

func _init():
	set_process(false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y += fall_speed * delta # Move using local position.y

func Setup(target_x: float, target_frame: int):
	position = Vector2(target_x, init_y_pos) # Set local position
	frame = target_frame
	set_process(true)

func _on_destroy_timer_timeout():
	queue_free()
