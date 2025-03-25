extends Node
var IsInDialogue = false
var Interact := []
var previousScene =""
# Called when the node enters the scene tree for the first time.
func _ready():
	var InteractArray = InputMap.action_get_events("Interact")
	Interact.append(InteractArray[0].as_text().rstrip(" (Physical)"))
	Interact.append(InteractArray[1].as_text())
	print(Interact)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
