extends Interactable

func _on_interacted_with():
	super()
	var root = Root.get_root(self)
	root.wait_for_train()
