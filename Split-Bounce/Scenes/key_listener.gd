extends Sprite2D
@onready var falling_key = preload("res://Scenes/falling_key.tscn")
@export var key_name: String = ""

var falling_key_queue = []

var perfect_press_threshold: float = 30
var great_press_threshold: float = 50
var good_press_threshold: float = 60
var ok_press_threshold: float = 80

var perfect_press_score: float = 250
var great_press_score: float = 100
var good_press_score: float = 50
var ok_press_score: float = 20

func _process(_delta):
	if falling_key_queue.size() > 0:
		var front_key = falling_key_queue.front()
		
		# If the key freed itself off-screen or already passed, remove it from the queue
		if not is_instance_valid(front_key) or front_key.has_passed:
			falling_key_queue.pop_front()
		elif key_name != "" and Input.is_action_just_pressed(key_name):
			var key_to_pop = falling_key_queue.pop_front()
			
			var distance_from_pass = abs(global_position.y - key_to_pop.global_position.y)
			
			if distance_from_pass < perfect_press_threshold:
				Signals.IncrementScore.emit(perfect_press_score)
			elif distance_from_pass < great_press_threshold:
				Signals.IncrementScore.emit(great_press_score)
			elif distance_from_pass < good_press_threshold:
				Signals.IncrementScore.emit(good_press_score)
			elif distance_from_pass < ok_press_threshold:
				Signals.IncrementScore.emit(ok_press_score)
			
			key_to_pop.queue_free()

func CreateFallingKey():
	var fk_inst = falling_key.instantiate()
	get_parent().add_child(fk_inst)
	fk_inst.Setup(position.x, frame + 4)
	falling_key_queue.push_back(fk_inst)

func _on_random_spawn_timer_timeout() -> void:
	CreateFallingKey()
	$RandomSpawnTimer.wait_time = randf_range(0.4, 3)
	$RandomSpawnTimer.start()
