extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/menus/credits.tscn")
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit(0)
	pass # Replace with function body.


func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/Home.tscn")
	pass # Replace with function body.
