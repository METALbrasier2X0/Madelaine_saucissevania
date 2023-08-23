extends Characters


func _physics_process(delta):
# Call global gravity value.
	Gravity(delta)
	move_and_slide()
	

