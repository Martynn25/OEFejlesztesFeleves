extends Node2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://scenes/Places/MainFarmIsland.tscn")
		Global.previousScene = "haz"
	pass # Replace with function body.
