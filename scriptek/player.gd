extends CharacterBody2D

@export var speed: float = 150.0  # Movement speed
var pd := 0
var lock = false
func _ready() -> void:
	Global.set_player_reference(self)
	print(Global.IsInDialogue)

func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO
	if(!Global.IsInDialogue && !lock):
		direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
		# Normalize to prevent faster diagonal movement
		if direction.length() > 0:
			direction = direction.normalized()
		if (Input.is_action_pressed("ui_left")):
			$AnimatedSprite2D.play("walk_left")
			pd = 0
		elif (Input.is_action_pressed("ui_right")):
			pd = 1
			$AnimatedSprite2D.play("walk_right")
		elif (Input.is_action_pressed("ui_up")):
			pd=1
			$AnimatedSprite2D.play("walk_right")
		elif (Input.is_action_pressed("ui_down")):
			pd = 0
			$AnimatedSprite2D.play("walk_left")
		else:
			if(pd == 1):
				$AnimatedSprite2D.play("default_right")
			else:
				$AnimatedSprite2D.play("default_left")
	else:
		if(pd == 1):
			#print("idle")
			$AnimatedSprite2D.play("default_right")
		else:	
			$AnimatedSprite2D.play("default_left")
	if(!$CanvasLayer.visible && Input.is_action_just_pressed("INVENTORY")):
		$CanvasLayer.visible = true
		lock = true
		print("inv")
	elif($CanvasLayer.visible && Input.is_action_just_pressed("INVENTORY")):
		$CanvasLayer.visible = false
		lock = false
		print("no inv")
	# Apply movement
	velocity = direction * speed
	move_and_slide()
