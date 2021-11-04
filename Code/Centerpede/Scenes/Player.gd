extends KinematicBody2D



func _process(delta_time):
	if Input.is_action_pressed("move_up"):
		print("Move up")
	if Input.is_action_pressed("move_down"):
		print("Move Down")
	if Input.is_action_pressed("move_left"):
		print("Left")
	if Input.is_action_pressed("move_right"):
		print("Right")
