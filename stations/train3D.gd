extends Interactable

func _on_interacted_with():
	# Get the current train and its route
	var root = Root.get_root(self)
	var train_name = root.current_train
	var route = root.TRAINS[train_name]
	var current_station = root.current_station
	var idx = route.find(current_station)
	if idx != -1 and idx < route.size() - 1:
		var next_station = route[idx + 1]
		root.current_station = next_station
		root.change_scene(next_station)
	else:
		print("End of the line or station not found in route. Returning to first station.")
		root.current_station = route[0]
		root.change_scene(route[0])
