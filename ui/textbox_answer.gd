@tool
class_name TextBoxAnswer
extends Panel

# Signal emitted when this answer is chosen, passing the next discussion id
signal answer_chosen(next_id)

# The id of the next discussion to go to
var next_id = null

# Reference to the label node
@onready var label = $MarginContainer/Label

# Track if this answer is currently highlighted
var is_highlighted = false

func _ready():
	# Enable mouse filter for interaction
	mouse_filter = MOUSE_FILTER_PASS
	# Set default style
	_update_highlight()

func set_next_id(id):
	next_id = id

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		_highlight()
		emit_signal("answer_chosen", next_id)

func _highlight():
	is_highlighted = true
	_update_highlight()

func _unhighlight():
	is_highlighted = false
	_update_highlight()

func _update_highlight():
	if is_highlighted:
		self.modulate = Color(1, 1, 0.7) # Highlight color
	else:
		self.modulate = Color(1, 1, 1) # Normal color
