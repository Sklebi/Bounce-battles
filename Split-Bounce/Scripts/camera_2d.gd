extends Camera2D

@onready var platformer_player: CharacterBody2D = $"../PlatformerPlayer"

func _process(_delta: float) -> void:
	if platformer_player:
		var player_y: float = platformer_player.global_position.y
		
		# In 2D, a smaller Y value means higher up on the screen
		if player_y < global_position.y:
			global_position.y = player_y
