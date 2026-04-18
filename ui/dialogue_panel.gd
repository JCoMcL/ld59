@tool
extends Control

@export var width = 200
@export var width_ratio = 0.4

@onready var timeline = $"ScrollContainer/VBoxContainer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = timeline.get_child_count() > 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	size.x = min(width, get_parent().size.x * width_ratio)
	position.x = get_parent().size.x - size.x

func show_text(s:String):
	visible = true
	$Label.text = s

const textbox_scn = preload("res://ui/textbox.tscn")
func add_description_box(s:String):
	var tbox = textbox_scn.instantiate()
	tbox.text = "[i]%s[/i]" % s
	timeline.add_child(tbox)
	
