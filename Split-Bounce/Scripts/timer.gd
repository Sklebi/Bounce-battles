extends Timer

var is_arrows_active: bool = true

func _ready() -> void:
	timeout.connect(_on_timeout)

func _on_timeout() -> void:
	# Fetch nodes safely right when the timer triggers
	var player = get_node_or_null("HBoxContainer/ConnorGame/SubViewport/Platformer")
	var animator = get_node_or_null("HBoxContainer/IreneGame/SubViewport/GameLevel") # Or add your animated sprite child path here
	
	# Safety check to prevent crashing if a node is missing
	if player == null or animator == null:
		print("Error: Could not find player or animator nodes for input swapping!")
		return

	is_arrows_active = not is_arrows_active
	
	if is_arrows_active:
		# --- SWAP TO ARROWS ---
		player.input_left = "P1Left"
		player.input_right = "P1Right"
		
		animator.input_left = "P1Left"
		animator.input_right = "P1Right"
		animator.input_up = "P1Up"
		animator.input_down = "P1Down"
		
		print("Swapped to Arrow Keys!")
	else:
		# --- SWAP TO WASD ---
		player.input_left = "button_A"
		player.input_right = "button_D"
		
		animator.input_left = "button_A"
		animator.input_right = "button_D"
		animator.input_up = "button_W"
		animator.input_down = "button_S"
		
		print("Swapped to WASD!")
