@tool
extends Control

@export var text:String:
	set(s):
		text=s
		if is_node_ready():
			get_label().text = s
	get():
		return get_label().text

func get_label()->RichTextLabel: 
	return get_child(0).get_child(0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var n = get_label()
	if n is RichTextLabel:
		custom_minimum_size.y = n.size.y
