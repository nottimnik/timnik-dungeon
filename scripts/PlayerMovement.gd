extends KinematicBody2D

const MAX_SPEED = 100 #The MAX_SPEED that the player can have
const ACCELERATION = 500 #The ACCELERATION that the player can have 
const FRICTION = 500 #The FRICTION that the player can have

var vector = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

#Basic Player Movement

func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	
	#move the player left or right if the right or the left key is pressed
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	#checks if the user pressed any key by checking if the input_vector is changed or not
	if input_vector != Vector2.ZERO:
		
		#if the input will be positive that means that the player is going to the right direction
		if input_vector.x > 0:
			sprite.flip_h = false #flips the sprite to the right
			animationPlayer.play("Run")
			
		#else the player is going to the left direction
		else:
			sprite.flip_h = true #flipts the sprite to the left
			animationPlayer.play("Run")
		
		vector = vector.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	
	#if the user didn't pressed any key then we don't update the vector
	#and make the player stop
	else:
		animationPlayer.play("Idle")
		vector = vector.move_toward(Vector2.ZERO, FRICTION * delta) #apply friction to the player when he stops
		
	vector = move_and_slide(vector) #move the player
