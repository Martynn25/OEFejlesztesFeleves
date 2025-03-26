extends Node2D
@export var animation := true

func _ready() -> void:
	if animation:
		$AnimatedSprite2D.play("SeaGrass")
	else:
		$AnimatedSprite2D.play("SeaRock")
