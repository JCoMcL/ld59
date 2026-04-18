@tool
class_name TextBox
extends Control

signal done_showing

@export var text:String:
	set(s):
		text=s
		if not is_node_ready():
			await ready
		get_label().text = s
		get_label().visible_characters = 0

func get_label()->RichTextLabel:
	return get_child(0).get_child(0)

var text_reveal_cumer = Cumer.new(40)
func _ready() -> void:
	text=text

func _process(delta: float) -> void:
	if get_label().visible_characters < text.length():
		text_reveal_cumer.add(delta)
		get_label().visible_characters = text_reveal_cumer.i
		if get_label().visible_characters >= text.length():
			done_showing.emit()


	var n = get_label()
	if n is RichTextLabel:
		custom_minimum_size.y = n.size.y
