extends Node2D
var PlayertoFarmIn := false 
#func _ready() -> void:
	#var children =  get_children()
	#var childrenchild = []
	#for child in children:
		#childrenchild.append(child.get_children())
	#var childrenchildchildren = []
	#for child in childrenchild:
		#childrenchildchildren.append(child.get_children())
	#print(children.size()+childrenchild.size()+childrenchildchildren.size())
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Interact") && PlayertoFarmIn:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogues/VillageToFarm.dialogue"),"start")

func _on_back_to_farm_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		PlayertoFarmIn = true
	pass # Replace with function body.


func _on_back_to_farm_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		PlayertoFarmIn = false
	pass # Replace with function body.
