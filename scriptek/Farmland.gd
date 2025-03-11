extends Marker2D

var IsPlayerInside = false
var CropReady = false
var Planted = false

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
		if !Planted and !$selectionbox.visible:
			$selectionbox.visible = true
			$selectionbox.play("default")

		# Planting logic
		if Input.is_action_just_pressed("Interact") and !Planted:
			Planted = true
			$Crop.visible = true
			$Crop.play("Pumpkin")
			print("Crop planted")

		# Harvesting logic
		elif CropReady and Input.is_action_just_pressed("Interact"):
			print("Crop harvested")
			CropReady = false
			Planted = false
			$Crop.visible = false
			$Finish.visible = false

	else:
		$selectionbox.visible = false  # Hide selection box when leaving area

func _on_area_2d_body_entered(_body: CharacterBody2D) -> void:
	IsPlayerInside = true

func _on_area_2d_body_exited(_body: CharacterBody2D) -> void:
	IsPlayerInside = false

func _on_crop_animation_finished() -> void:
	CropReady = true
	$Finish.visible = true
	print("Crop is ready for harvest")
