extends StaticBody2D
var IsPLayerInRange = false
@export var dialogue_recource = load("res://dialogues/tutorial1.dialogue")
@export var TextureRecource = load("res://Assets/visual/sign.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.sprite_frames = TextureRecource
	pass


# Called every frame. 'delta' is the elapsed time since ogthe previous frame.
func _process(delta: float) -> void:
	if(IsPLayerInRange && Input.is_action_pressed("Interact")):
		startDialog()


func startDialog()->void:
	print("talk")
	DialogueManager.show_example_dialogue_balloon(dialogue_recource,"Start")
	#player.IsInDialogue = true
	



func _on_np_c_sign_range_body_entered(body: Node2D) -> void:
	IsPLayerInRange = true
	print("true")
	pass # Replace with function body.


func _on_np_c_sign_range_body_exited(body: Node2D) -> void:
	IsPLayerInRange = false
	print("false")
	pass # Replace with function body.
