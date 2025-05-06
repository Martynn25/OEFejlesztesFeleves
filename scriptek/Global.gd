extends Node
var IsInDialogue = false
var Interact := []
var inv_inp := []
var previousScene =""
var Money := 100
var Inventory := []
var Hotbar := 5
var NpcRescource : Resource
signal Inventory_updated
var Player :Node = null
var volume := 0.002
# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.physics_jitter_fix = 1.0
	$"music".play()
	var InteractArray = InputMap.action_get_events("Interact")
	Interact.append(InteractArray[0].as_text().rstrip(" (Physical)"))
	Interact.append(InteractArray[1].as_text())
	print(Interact)
	
	var InvINpArr = InputMap.action_get_events("INVENTORY")
	inv_inp.append(InvINpArr[0].as_text().rstrip(" (Physical)"))
	inv_inp.append(InvINpArr[1].as_text())
	print(inv_inp)
	
	Inventory.resize(15)

func _process(delta: float) -> void:
	$music.volume_db = volume

func add_item(item):
	for i in range(Inventory.size()):
		if Inventory[i] != null && Inventory[i]["name"] == item["name"]:
			Inventory[i]["quantity"] += item["quantity"]
			Inventory_updated.emit()
			print("added")
			return true
		elif Inventory[i] == null:
			Inventory[i] = item
			Inventory_updated.emit()
			print("added")
			return true
		print("failed")
		return false
func remove_item(item):
	for i in range(Inventory.size()):
		if Inventory[i] != null && Inventory[i]["name"] == item["name"]:
			Inventory[i]["quantity"] -= item["quantity"]
			if Inventory[i]["quantity"] == 0:
				Inventory[i]= null
			Inventory_updated.emit()
			return true
		elif Inventory[i] == null:
			return false
		return false

func Change_Inv_Size(size : int, item : Node):
	remove_item(item)
	Inventory.resize(size)
	Inventory_updated.emit()

func set_player_reference(player):
	Player = player

func _mod_money(amount : int):
	Money += amount

func Volume_to_Slide(val):
	return db_to_linear(val)

func Slide_to_Volume(val):
	return linear_to_db(val)


func _on_music_finished() -> void:
	$"music".play()
	pass # Replace with function body.
