extends Marker2D
var IsPlayerInside = false
var CropReady = false
var Planted = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if IsPlayerInside && $selectionbox.visible!=true:
		$selectionbox.visible=true
		$selectionbox.play("default")
		print("set")
		if(Input.is_action_pressed("Interact")):
			$Crop.visible=true
			$Crop.play("Pumpkin")
			print("interacted")
	elif(!IsPlayerInside &&  $selectionbox.visible==true):
		$selectionbox.visible=false
		print("set!")
	if IsPlayerInside && !CropReady:
		if(Input.is_action_just_pressed("Interact")):
			$Crop.visible=true
			Planted = true
			$Crop.play("Pumpkin")
			print("interacted")
	elif(!CropReady && !Planted):
		$Crop.visible = false

	pass
	if CropReady:
		$Finish.visible=true
		if Input.is_action_just_pressed("Interact"):
			print("harvested")
			CropReady = false
			$Crop.visible=false
	else:
		$Finish.visible=false


func _on_area_2d_body_entered(_body: Node2D) -> void:
	IsPlayerInside = true
	pass # Replace with function body.


func _on_area_2d_body_exited(_body: Node2D) -> void:
	IsPlayerInside = false
	pass # Replace with function body.


func _on_crop_animation_finished() -> void:
	print(CropReady)
	CropReady = true
	pass # Replace with function body.
