extends Control

func _on_apply_pressed() -> void:
	Global.volume = Global.Slide_to_Volume($HSlider.value)
	get_tree().change_scene_to_file("res://scenes/menus/MainMenu.tscn")
	pass # Replace with function body.


func _on_back_pressed() -> void:
	$"HSlider".value = Global.Volume_to_Slide(Global.volume)
	get_tree().change_scene_to_file("res://scenes/menus/MainMenu.tscn")
	pass # Replace with function body.
