extends Control


# Called when the node enters the scene tree for the first time.


func _on_desert_button_pressed():
	get_tree().change_scene_to_file("res://scene/desert.tscn")


func _on_forest_button_pressed():
	get_tree().change_scene_to_file('res://scene/grassland.tscn')
