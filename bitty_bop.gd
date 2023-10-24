extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var isBeingDragged = false

func dropped():
	isBeingDragged = false
	
func picked_up():
	isBeingDragged = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	handle_animations()

	move_and_slide()

func handle_animations():
	if (isBeingDragged):
		$elebitguy/AnimationPlayer.play("d_twist")
	elif (velocity.y < 0):
		$elebitguy/AnimationPlayer.play("fall")
	elif (velocity.y > 0):
		$elebitguy/AnimationPlayer.play("rise")
	else:
		$elebitguy/AnimationPlayer.play("d_worm")
	
func set_linear_velocity(vel):
	velocity = vel
	
