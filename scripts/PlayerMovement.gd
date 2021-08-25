extends KinematicBody2D

const MAX_SPEED = 100 #The MAX_SPEED that the player can have
const ACCELERATION = 500 #The ACCELERATION that the player can have 
const FRICTION = 500 #The FRICTION that the player can have

var vector = Vector2.ZERO

#Basic Player Movement

func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	
	#move the player left or right if the right or the left key is pressed
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	#checks if the user pressed any key by checking if the input_vector is changed or not
	if input_vector != Vector2.ZERO:
		vector = vector.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	
	#if the user didn't pressed any key then we don't update the vector
	#and make the player stop
	else:
		vector = vector.move_toward(Vector2.ZERO, FRICTION * delta) #apply friction to the player when he stops
		
	vector = move_and_slide(vector) #move the player
