extends StaticBody2D
var IsPLayerInRange = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since ogthe previous frame.
func _process(delta: float) -> void:
	if(IsPLayerInRange && Input.is_action_pressed("Interact")):
		print("talk")
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/tutorial1.dialogue"),"Tutorial_Dialogue")
		return
	pass





func _on_np_c_sign_range_body_entered(body: Node2D) -> void:
	IsPLayerInRange = true
	print("true")
	pass # Replace with function body.


func _on_np_c_sign_range_body_exited(body: Node2D) -> void:
	IsPLayerInRange = false
	print("false")
	pass # Replace with function body.
