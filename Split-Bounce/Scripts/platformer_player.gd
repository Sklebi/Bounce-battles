extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -800.0

# Input action variables (swappable from another script)
var input_left: String = "P1Left"
var input_right: String = "P1Right"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if true and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis(input_left, input_right)
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
