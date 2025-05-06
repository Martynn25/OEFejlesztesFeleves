extends Control

func _ready() -> void:
	Global.Inventory_updated.connect(_on_inventory_updated)
	_on_inventory_updated()

#update
func _on_inventory_updated():
	clear_container()
	pass
func clear_container():
	while $GridContainer.get_child_count() >0:
		var child = $GridContainer.get_child(0)
		$GridContainer.remove_child(child)
		child.queue_free()
