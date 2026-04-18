@tool
class_name  BackgroundImage
extends TextureRect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var p:Control = get_parent()
	if p:
		var initial_size = texture.get_size()
		if initial_size == Vector2.ZERO:
			return
		size = initial_size
		position = Vector2.ZERO
		var scale_x = p.size.x / initial_size.x
		var scale_y = p.size.y / initial_size.y
		var s = max(scale_x, scale_y)
		scale = Vector2(s, s)
