extends Marker2D

var IsPlayerInside = false
var CropReady = false
var Planted = false
@export var CropType := ""

func _ready() -> void:
	IsPlayerInside = false
	CropReady = false
	Planted = false
	$selectionbox.visible = false
	$Crop.visible = false
	$Finish.visible = false



func _process(_delta: float) -> void:
	if IsPlayerInside:
		# Show selection box only if not planted
		if (!Planted and !$selectionbox.visible) || (CropReady and !$selectionbox.visible):
			$selectionbox.visible = true
			$selectionbox.play("default")

		# Planting logic
		if Input.is_action_just_pressed("Interact") and !Planted:
			Planted = true
			$Crop.visible = true
			$Crop.play("pumpkin")
			$InventoryItem.Item_name = "pumpkin"
			$InventoryItem.Item_type = "crop"
			$InventoryItem.Item_price = 1
			$InventoryItem.Item_texture ="pumpkin"
			print("Crop planted")

		# Harvesting logic
		elif CropReady and Input.is_action_just_pressed("Interact"):
			print("Crop harvested")
			CropReady = false
			Planted = false
			$InventoryItem.Item_give()
			$Crop.visible = false
			$Finish.visible = false

	else:
		$selectionbox.visible = false
	if Planted:
		$StaticBody2D/CollisionShape2D.disabled = false
	else:
		$StaticBody2D/CollisionShape2D.disabled = true # Hide selection box when leaving area

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body is CharacterBody2D):
		IsPlayerInside = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body is CharacterBody2D):
		IsPlayerInside = false

func _on_crop_animation_finished() -> void:
	CropReady = true
	$Finish.visible = true
	print("Crop is ready for harvest")
