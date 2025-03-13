extends Node
@export var IsInDialogue = false
var Interact : String
# Called when the node enters the scene tree for the first time.
func _ready():
	Interact = InputMap.action_get_events("Interact")[0].as_text().rstrip(" (Physical)")
	print(Interact)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
