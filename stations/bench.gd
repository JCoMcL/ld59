extends Node

func _gui_input(ev: InputEvent):
	if ev is InputEventMouseButton and ev.pressed:
		# Get the current train and its route
		var root = Root.get_root(self)
		root.wait_for_train()
