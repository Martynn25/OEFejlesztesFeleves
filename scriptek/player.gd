extends CharacterBody2D

@export var speed: float = 150.0  # Movement speed
var pd := 0
var lock = false
var ps := 0

func _ready() -> void:
	Global.set_player_reference(self)
	print(Global.IsInDialogue)
	$AudioStreamPlayer2D.autoplay = false

func _physics_process(_delta: float) -> void:
	$Label.text = str(Engine.get_frames_per_second()).pad_decimals(2)
	var direction := Vector2.ZERO
	if(!Global.IsInDialogue && !lock):
		if $Sprite2D.visible == true:
			$Sprite2D.visible = false
		direction.x = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
		direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

		# Normalize to prevent faster diagonal movement
		if direction.length() > 0:
			direction = direction.normalized()
		if (Input.is_action_pressed("ui_left")):
			$AnimatedSprite2D.play("walk_left")
			pd = 0
			if !$"AudioStreamPlayer2D".playing:
				if ps == 0:
					$AudioStreamPlayer2D.stream = load("res://Assets/Audio/GRASS - Run 8.wav")
					$AudioStreamPlayer2D.play()
					ps = 1
				else:
					$AudioStreamPlayer2D.stream = load("res://Assets/Audio/GRASS - Run 7.wav")
					$AudioStreamPlayer2D.play()
					ps = 0
		elif (Input.is_action_pressed("ui_right")):
			pd = 1
			$AnimatedSprite2D.play("walk_right")
			if !$"AudioStreamPlayer2D".playing:
				if ps == 0:
					$AudioStreamPlayer2D.stream = load("res://Assets/Audio/GRASS - Run 8.wav")
					$AudioStreamPlayer2D.play()
					ps = 1
				else:
					$AudioStreamPlayer2D.stream = load("res://Assets/Audio/GRASS - Run 7.wav")
					$AudioStreamPlayer2D.play()
					ps = 0
		elif (Input.is_action_pressed("ui_up")):
			pd = 2
			$AnimatedSprite2D.play("Walk_up")
			if !$"AudioStreamPlayer2D".playing:
				if ps == 0:
					$AudioStreamPlayer2D.stream = load("res://Assets/Audio/GRASS - Run 8.wav")
					$AudioStreamPlayer2D.play()
					ps = 1
				else:
					$AudioStreamPlayer2D.stream = load("res://Assets/Audio/GRASS - Run 7.wav")
					$AudioStreamPlayer2D.play()
					ps = 0
		elif (Input.is_action_pressed("ui_down")):
			pd = 3
			$AnimatedSprite2D.play("walk_down")
			if !$"AudioStreamPlayer2D".playing:
				if ps == 0:
					$AudioStreamPlayer2D.stream = load("res://Assets/Audio/GRASS - Run 8.wav")
					$AudioStreamPlayer2D.play()
					ps = 1
				else:
					$AudioStreamPlayer2D.stream = load("res://Assets/Audio/GRASS - Run 7.wav")
					$AudioStreamPlayer2D.play()
					ps = 0
		else:
			if(pd == 1):
				$AnimatedSprite2D.play("default_right")
			elif pd == 0:	
				$AnimatedSprite2D.play("default_left")
			elif pd == 2:
				$AnimatedSprite2D.play("default_up")
			elif pd == 3:
				$AnimatedSprite2D.play("default_down")
	else:
		SetNPCPortrait(Global.NpcRescource)
		if(pd == 1):
			$AnimatedSprite2D.play("default_right")
		elif pd == 0:	
			$AnimatedSprite2D.play("default_left")
		elif pd == 2:
			$AnimatedSprite2D.play("default_up")
		elif pd == 3:
			$AnimatedSprite2D.play("default_down")
		
	# Apply movement
	velocity = direction * speed
	move_and_slide()
func SetNPCPortrait(TextureRecource : Resource):
	$Sprite2D.texture = TextureRecource
	$Sprite2D.visible = true
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("INVENTORY"):
		$CanvasLayer.visible = !$CanvasLayer.visible
		get_tree().paused = !get_tree().paused
		lock = true
		print("inv")
