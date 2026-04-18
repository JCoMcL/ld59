extends TextureRect

@export var speaker_color:Color
@export var speaker_portrait:Texture2D

func open_dialogue():
	var p = Root.get_dialogue_panel(self)
	print(p)
	p.clear()
	p.speaker_color = speaker_color
	p.set_speaker_portrait(speaker_portrait)
	await p.add_description_box(
"A murky old man rests against a cold brick. His face reminds you of an every single alcoholic human misfortune you ever saw. His teeth are pereodically clinging on an empty bottle of cheap beer in a desperate attempt to extract a nostalgic flavor. It feels like the bottle sucks his life out."
	).done_showing
	await p.add_description_box(
"A torn-off voice is reaching you through his mouth, the rest of his body appears almost immobile."
	).done_showing
	await p.add_speech_box("Ah... what did [i]you[/i] do?").done_showing


func _gui_input(ev: InputEvent):
	if ev is InputEventMouseButton and ev.pressed:
		open_dialogue()
