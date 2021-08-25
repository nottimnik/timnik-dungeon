extends KinematicBody2D

const MAX_SPEED = 100 #The MAX_SPEED that the player can have
const ACCELERATION = 10 #The ACCELERATION that the player can have 
const FRICTION = 10 #The FRICTION that the player can have

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
		vector += input_vector * ACCELERATION * delta
		vector = vector.clamped(MAX_SPEED * delta) #Makes sure that the acceleration doesn't go pass the max speed
	
	#if the user didn't pressed any key then we don't update the vector
	#and make the player stop
	else:
		vector = vector.move_toward(Vector2.ZERO, FRICTION * delta) #apply friction to the player when he stops
		
	move_and_collide(vector) #move the player
