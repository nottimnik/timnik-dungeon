extends KinematicBody2D

var vector = Vector2.ZERO

#Basic Player Movement

func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	
	#move the player left or right if the right or the left key is pressed
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	#checks if the user pressed any key by checking if the input_vector is changed or not
	if input_vector != Vector2.ZERO:
		vector = input_vector
	#if the user didn't pressed any key then we don't update the vector
	else:
		vector = Vector2.ZERO
		
	move_and_collide(vector) #move the player
