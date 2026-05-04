extends Camera3D

@onready var initial_rotation = rotation
func _ready() -> void:
	Root.set_camera(self)

var sensitivity = 0.2
func set_rotation_offset(v:Vector2):
	rotation.y = initial_rotation.y - v.x * sensitivity
	rotation.x = initial_rotation.x - v.y * sensitivity

func _unhandled_input(ev: InputEvent) -> void:
	if ev is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		pass
