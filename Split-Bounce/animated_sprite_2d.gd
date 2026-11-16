extends AnimatedSprite2D

var input_left: String = "button_A"
var input_right: String = "button_D"
var input_up: String = "button_W"
var input_down: String = "button_S"

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed(input_left):
		play("LEFT")
	elif Input.is_action_just_pressed(input_right):
		play("RIGHT")
	elif Input.is_action_just_pressed(input_up):
		play("UP")
	elif Input.is_action_just_pressed(input_down):
		play("DOWN")
