@tool
extends Control

@export var height = 200
@export var height_ratio = 0.4


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	size.y = min(height, get_parent().size.y * height_ratio)
	position.y = get_parent().size.y - size.y

func show_text(s:String):
	visible = true
	$Label.text = s
