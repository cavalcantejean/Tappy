extends Node2D

@onready var score_sound: AudioStreamPlayer = $ScoreSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= GameManager.SCROOL_SPEED * delta


func _on_screen_exited() -> void:
	queue_free() 


func _on_pipe_body_entered(body: Node2D) -> void:
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		body.die()


func _on_laser_body_exited(body: Node2D) -> void:
	if body.is_in_group(GameManager.GROUP_PLAYER) == true:
		score_sound.play()
		ScoreManager.increment_score()
