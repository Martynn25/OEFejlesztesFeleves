extends Node2D
var EndingRange := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for node in $".".get_children():
		node.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if EndingRange && Input.is_action_just_pressed("Interact"):
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/TutorialEnd.dialogue"),"Start")
	pass


func _on_to_main_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		EndingRange = true
	pass # Replace with function body.
