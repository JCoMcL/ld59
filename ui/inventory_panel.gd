@tool
class_name InventoryPanel
extends Control

func _ready() -> void:
	visible = false

func create_inventory_panel(items:Array):
	visible = true
	var grid := $GridContainer
	for child in grid.get_children():
		child.queue_free()
	for item in items:
		var tex = TextureRect.new()
		tex.texture = item["image"]
		tex.set_custom_minimum_size(Vector2(200, 200))
		tex.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		tex.expand_mode = TextureRect.EXPAND_FIT_WIDTH
		tex.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		tex.size_flags_vertical = Control.SIZE_EXPAND_FILL
		var label = Label.new()
		label.text = item["name"]
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		var vbox = VBoxContainer.new()
		vbox.add_child(tex)
		vbox.add_child(label)
		grid.add_child(vbox)
