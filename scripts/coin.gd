extends Area2D

signal coin_collected(deleted) #creates a signal that coin has been collectted

@onready var sprite = $Coin #creates a var and assigns the sprite node

func _physics_process(delta):
	position.x -= 125 * delta
func _on_body_entered(body):
	queue_free() #deletes the node, since its in the signal of area2d body entered
	#if player collides the coin is deleted 
	emit_signal("coin_collected",0) #sends the signal which we created usedto assign score in game scene

func flash(): #creating a new func called falsh
	sprite.material.set_shader_parameter("flash_modifier", 0.55) #increas the value makes it more opaque
	await get_tree().create_timer(0.3).timeout #creates the timer its the value of time between each blink
	sprite.material.set_shader_parameter("flash_modifier", 0)

func _on_timer_timeout():# this is time out signal of timer node in coin scene adjust the value to 
	#change how many times flash function is called 
	flash()


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	emit_signal("coin_collected",1)
