extends CharacterBody2D
class_name Characters

var max_speed = 500
var SPEED = 5
const acceleration = 40
const JUMP_VELOCITY = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Gravity(delta):
	# Add the gravity.
	if not is_on_floor():
	
		velocity.y += gravity * delta
		
