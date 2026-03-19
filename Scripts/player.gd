extends CharacterBody2D
class_name Player

const SPEED = 150.0
const JUMP_VELOCITY = -400.0
const FALL_THRESHOLD = 220

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if Global.indices_contador == 14:
			Global.used_indices = []
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("Nikki_Jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_action_strength("right") - Input.get_action_strength("left")
	  
	if direction != 0:
		velocity.x = direction * SPEED
		if direction < 0:
			$AnimatedSprite2D.play("Nikki_Run")
			$AnimatedSprite2D.flip_h=true
		else:
			$AnimatedSprite2D.play("Nikki_Run")
			$AnimatedSprite2D.flip_h=false
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("Nikki_Idle")
	move_and_slide()

	if global_position.y > FALL_THRESHOLD:
		die()

func die():
	get_parent().die()


func _on_button_menu_button_down():
	pass # Replace with function body.
