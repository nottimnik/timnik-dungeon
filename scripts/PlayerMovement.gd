extends KinematicBody2D

#Basic Player Movement

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"): #if the right key is pressed
		position.x += 10 #we move the player to the right
		
	elif Input.is_action_pressed("ui_left"): #if the left key is pressed
		position.x -= 10 #we move the player to the left
		
	elif Input.is_action_pressed("ui_up"): #if the up key is pressed
		position.y -= 10 #we move the player up

	elif Input.is_action_pressed("ui_down"): #if the down key is pressed
		position.y += 10 #we move the player down
