extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.8
@onready var score_label = $Control/ScoreLabel

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var is_jumping = false


func _physics_process(delta):
	# Add the gravity.
	score_label.text = str(Verdier.points)
	
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	if Input.is_action_pressed("ctrl"):
		scale.y = 0.5
	if Input.is_action_just_released("ctrl"):
		scale.y = 1
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_jumping and not is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_jumping = false
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		is_jumping = true
		velocity.y = JUMP_VELOCITY

	move_and_slide()

func die():
	get_tree().change_scene_to_file("res://scenes/death_screen.tscn")
