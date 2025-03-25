extends Node2D
var PlayerToVillage = false
var sign := load("res://Assets/visual/Objects/sign.png")
func _ready() -> void:
	if Global.previousScene == "village":
		$Player.position = Vector2(825,37)

func _process(_delta: float) -> void:
		if Input.is_action_just_pressed("Interact") && PlayerToVillage:
			DialogueManager.show_example_dialogue_balloon(load("res://dialogues/FarmToVillage.dialogue"),sign,"start")

func _on_to_village_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		PlayerToVillage = true
	pass # Replace with function body.


func _on_to_village_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		PlayerToVillage = true
	pass # Replace with function body.
