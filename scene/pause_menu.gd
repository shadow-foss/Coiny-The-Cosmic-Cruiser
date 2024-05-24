extends Control
@onready var game_scene = $"../../"

func _on_resume_button_pressed():
	game_scene.pause() #calls pause func from game script


func _on_quit_button_pressed():
	get_tree().quit() #quits when quit button is pressed
