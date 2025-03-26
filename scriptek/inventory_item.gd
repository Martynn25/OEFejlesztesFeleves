extends Node2D
@export_category("Item_properties")
@export var Item_type :String
@export var Item_name :String
@export var Item_price :int
@export var Item_texture : String
var scene_path:String = "res://scenes/inventory_item.tscn"
var loaded_n_paused = false
func _ready() -> void:
	if not Engine.is_editor_hint():
		if $AnimatedSprite2D.is_playing()&& !loaded_n_paused:
			$AnimatedSprite2D.pause()
		else:
			$AnimatedSprite2D.play(Item_texture)
			loaded_n_paused = true
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		if $AnimatedSprite2D.is_playing() && !loaded_n_paused:
			$AnimatedSprite2D.pause()
		else:
			$AnimatedSprite2D.play(Item_texture)
			loaded_n_paused = true
func Item_give():
	var item = {
		"quantity":1,
		"type":Item_type,
		"name":Item_name,
		"price":Item_price,
		"texture":Item_texture,
		"scenepath": scene_path
	}
	if Global.Player:
		Global.add_item(item)
