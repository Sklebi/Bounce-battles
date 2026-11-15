extends AnimatedSprite2D

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("button_A"):
		play("LEFT")
	elif Input.is_action_just_pressed("button_D"):
		play("RIGHT")
	elif Input.is_action_just_pressed("button_W"):
		play("UP")
	elif Input.is_action_just_pressed("button_S"):
		play("DOWN")
