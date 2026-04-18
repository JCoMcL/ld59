@tool
class_name DialoguePanel
extends Control

@export var width = 200
@export var width_ratio = 0.4
@export var speaker_color: Color = Color.WHITE

@onready var timeline = $"ScrollContainer/VBoxContainer"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = timeline.get_child_count() > 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	size.x = min(width, get_parent().size.x * width_ratio)
	position.x = get_parent().size.x - size.x

func clear():
	for c in timeline.get_children():
		c.free()

func set_speaker_portrait(tex:Texture2D):
	if not tex:
		return
	%SpeakerPortrait.texture = tex
	%SpeakerPortrait.position.x = -tex.get_size().x -10 

const textbox_scn = preload("res://ui/textbox.tscn")
func add_box(s:String) -> TextBox:
	visible = true
	var tbox = textbox_scn.instantiate()
	timeline.add_child(tbox)
	tbox.text = s
	return tbox

func add_description_box(s:String) ->TextBox:
	s = "[i]%s[/i]" % s
	return add_box(s)

func add_speech_box(s:String) -> TextBox:
	s ="[color=#%s]%s[/color]" % [speaker_color.to_html(), s]
	return add_box(s)
	
