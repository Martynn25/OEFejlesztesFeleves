extends Node2D
var PlayerToVillage = false
func _ready() -> void:
	if Global.previousScene == "village":
		$Player.position = Vector2(825,37)
	if Global.previousScene == "haz":
		$Player.position = Vector2(777,37)

func _process(_delta: float) -> void:
		if Input.is_action_just_pressed("Interact") && PlayerToVillage:
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/FarmToVillage.dialogue"),"start")

func _on_to_village_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		PlayerToVillage = true
	pass # Replace with function body.


func _on_to_village_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		PlayerToVillage = true
	pass # Replace with function body.


func _on_haz_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		get_tree().change_scene_to_file("res://scenes/MainHaz.tscn")
	pass # Replace with function body.
