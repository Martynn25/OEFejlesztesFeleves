extends StaticBody2D
var IsPLayerInRange = false
@export_group("NPC properties")
@export var dialogue_recource : Resource
@export var TextureRecource : Resource
var Player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.sprite_frames = TextureRecource



# Called every frame. 'delta' is the elapsed time since ogthe previous frame.
func _process(_delta: float) -> void:
	if(IsPLayerInRange && Input.is_action_just_pressed("Interact") && !Global.IsInDialogue):
		startDialogue()

func _on_dialogue_ended():
	print("unlocked")


func startDialogue()->void:
	print("talk"+ dialogue_recource.to_string())
	DialogueManager.show_example_dialogue_balloon(dialogue_recource,TextureRecource,"Start")
	print("locked")



func _on_np_c_sign_range_body_entered(body: Node2D) -> void:
	if(body is CharacterBody2D):
		IsPLayerInRange = true
		Player = body
		print("true")



func _on_np_c_sign_range_body_exited(body: Node2D) -> void:
	if(body is CharacterBody2D):
		IsPLayerInRange = false
		print("false")
