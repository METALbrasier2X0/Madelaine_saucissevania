extends Characters
@onready var invulerability_timer = $InvulerabilityTimer
var air_jump = false


func _on_hurtbox_body_entered(body):
	handle_getting_hit()

func _physics_process(delta):
# Call global gravity value.
	Gravity(delta)
	var is_jump_interupted: = Input.is_action_just_released("jump") and velocity.y < 0.0


# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		SPEED = 300
		max_speed = 300
		velocity.y = JUMP_VELOCITY
		
	if not is_on_floor() and air_jump == false  and is_jump_interupted:
		velocity.y = -50


	if Input.is_action_just_pressed("jump") and air_jump == false  and not is_on_floor():
		SPEED = 300
		max_speed = 300
		velocity.y = JUMP_VELOCITY
		air_jump = true

	if is_on_floor():
		air_jump = false
		max_speed = 500

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	
	if Input.is_action_pressed("sprint"):
		SPEED = 800
		max_speed = 800
	if Input.is_action_just_released("sprint"): 
		max_speed = 500
		
	if direction:
		if SPEED < max_speed:	
			SPEED = SPEED + acceleration
			velocity.x = direction * SPEED 
		else:
			velocity.x = direction * SPEED 
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		SPEED = 1
		
	move_and_slide()
	

func handle_getting_hit():
	if invulerability_timer.is_stopped():		
		invulerability_timer.start()
		velocity.y = -300
		velocity.x = -200
	
	
