extends Camera3D

func get_space() -> PhysicsDirectSpaceState3D:
	return get_world_3d().direct_space_state

func interact_cast(screen_pos: Vector2):
	var q = PhysicsRayQueryParameters3D.new()
	

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			interact_cast(event.position)
