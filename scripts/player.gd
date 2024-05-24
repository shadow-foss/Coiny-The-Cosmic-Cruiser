extends RigidBody2D
#speeds
#NOTE: adjusting the mass or other stuffs in rigidbody2d node could affect speed and movement
#@export exports the variable to the inspector menu 
#but the value set in code is default and can be reverted by undo in inspector
@export var speed =400 #changes movement_speed
@export var rotational_speed = 400 #changes the rotation speed when player moves

func _physics_process(delta):
	#apply torque makes the player rotate when input is pressed
	#applyforce is for movement
	#vector2 have 2 float value of x,y
	#-x-axis is left side and +x axis is right
	#NOTE: -y axis is up in godot and +y axis is down
	if Input.is_action_pressed("move_up"):
		apply_torque(rotational_speed) 
		apply_force(Vector2(0,-speed))
	if Input.is_action_pressed("move_down"):
		apply_torque(rotational_speed)
		apply_force(Vector2(0,speed))
	if Input.is_action_pressed("move_right"):
		apply_torque(rotational_speed)
		apply_force(Vector2(speed,0))
	if Input.is_action_pressed("move_left"):
		apply_torque(rotational_speed)
		apply_force(Vector2(-speed,0))
	
