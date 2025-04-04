extends Node
var IsInDialogue = false
var Interact := []
var inv_inp := []
var previousScene =""
var Money := 100
var Inventory := []
var Hotbar := 5
signal Inventory_updated
var Player :Node = null
# Called when the node enters the scene tree for the first time.
func _ready():
	
	var InteractArray = InputMap.action_get_events("Interact")
	Interact.append(InteractArray[0].as_text().rstrip(" (Physical)"))
	Interact.append(InteractArray[1].as_text())
	print(Interact)
	
	var InvINpArr = InputMap.action_get_events("INVENTORY")
	inv_inp.append(InvINpArr[0].as_text().rstrip(" (Physical)"))
	inv_inp.append(InvINpArr[1].as_text())
	print(inv_inp)
	
	Inventory.resize(15)

func add_item(item: Node):
	for i in range(Inventory.size()):
		if Inventory[i] != null && Inventory[i]["name"] == item["name"]:
			Inventory[i]["quantity"] += item["quantity"]
			Inventory_updated.emit()
			return true
		elif Inventory[i] == null:
			Inventory[i] = item
			Inventory_updated.emit()
			return true
		return false
func remove_item(item: Node):
	
	Inventory_updated.emit()

func Change_Inv_Size(size : int, item : Node):
	remove_item(item)
	Inventory.resize(size)
	Inventory_updated.emit()

func set_player_reference(player):
	Player = player

func _mod_money(amount : int):
	Money += amount
