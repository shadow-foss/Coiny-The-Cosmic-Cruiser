extends Control


func _process(delta):
	if Input.is_action_just_pressed("pause_resume"): # when the escape key is pressed it calls pause func
		pause()

func _on_resume_button_pressed():
	pause()#calls pause menu func when 

func pause(): # func for pause_resume
	if get_tree().paused == true:
		hide()#hides the pause menu
		get_tree().paused = false #sets that game is not paused
	elif get_tree().paused == false: 
		show()#shows the pause menu
		get_tree().paused = true# sets that game is paused


func _on_quit_button_pressed():
	get_tree().quit()
