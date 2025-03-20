extends CharacterBody2D

@export var speed: float = 150.0  # Movement speed
var pd := 0
func _ready() -> void:
	print(Global.IsInDialogue)

func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO
	if(!Global.IsInDialogue):
		direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		
		# Normalize to prevent faster diagonal movement
		if direction.length() > 0:
			direction = direction.normalized()
		if (Input.is_action_pressed("ui_left")):
			$AnimatedSprite2D.play("walk_left")
			pd = 0
			print(pd)
		elif (Input.is_action_pressed("ui_right")):
			pd = 1
			print(pd)
			$AnimatedSprite2D.play("walk_right")
		elif (Input.is_action_pressed("ui_up")):
			pd=1
			print(pd)
			$AnimatedSprite2D.play("walk_right")
		elif (Input.is_action_pressed("ui_down")):
			pd = 0
			print(pd)
			$AnimatedSprite2D.play("walk_left")
		else:
			if(pd == 1):
				#print("idle")
				$AnimatedSprite2D.play("default_right")
			else:
				#print("idle")
				$AnimatedSprite2D.play("default_left")
	else:
		if(pd == 1):
			print("idle")
			$AnimatedSprite2D.play("default_right")
		else:
			#print(pd)
			$AnimatedSprite2D.play("default_left")
	# Apply movement
	velocity = direction * speed
	move_and_slide()
