extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in find_children("Carriage*"):
		var carriages = n.find_children("", "Interactable")
		for c in carriages:
			c.interacted_with.connect(%Train.travel)
