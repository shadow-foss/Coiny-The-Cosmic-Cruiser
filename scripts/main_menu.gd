extends Control


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scene/game.tscn") # loads the game scene when start  button is pressed



func _on_quit_button_pressed(): #quits when quit button is pressed
	get_tree().quit()
