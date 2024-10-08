extends CharacterBody2D

#signal on_plane_died

const  GRAVITY := 700.0
const POWER := -400.0

@onready var sprite: AnimatedSprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var engine_sound: AudioStreamPlayer = $EngineSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
	
	if is_on_floor() == true:
		die()
		
func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER
		animation_player.play("power")
		
func die() -> void:
	engine_sound.stop()
	sprite.stop()
	set_physics_process(false)
	#on_plane_died.emit()
	SignalManager.on_plane_died.emit()
