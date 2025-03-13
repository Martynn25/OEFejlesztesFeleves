extends StaticBody2D
var IsPLayerInRange = false
@export_group("NPC properties")
@export var dialogue_recource : Resource
@export var TextureRecource : Resource
var Player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.sprite_frames = TextureRecource
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended.bind(dialogue_recource))
	pass


# Called every frame. 'delta' is the elapsed time since ogthe previous frame.
func _process(delta: float) -> void:
	if(IsPLayerInRange && Input.is_action_just_pressed("Interact")):
		startDialogue()

func _on_dialogue_ended():
	print("unlocked")


func startDialogue()->void:
	print("talk"+ dialogue_recource.to_string())
	DialogueManager.show_example_dialogue_balloon(dialogue_recource,"Start")
	print("locked")
	
	#player.IsInDialogue = true
	



func _on_np_c_sign_range_body_entered(body: CharacterBody2D) -> void:
	IsPLayerInRange = true
	Player = body
	
	print("true")
	pass # Replace with function body.


func _on_np_c_sign_range_body_exited(body: CharacterBody2D) -> void:
	IsPLayerInRange = false
	print("false")
	pass # Replace with function body.
