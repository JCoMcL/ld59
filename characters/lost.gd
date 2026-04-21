extends Character

func open_dialogue():
	var p = Root.get_dialogue_panel(self)
	p.clear()
	p.speaker_color = speaker_color
	p.set_speaker_portrait(speaker_portrait)
	p.visible = true
	await p.add_description_box(
"You see a lost soul. You try to interract with it but it doesn't even look at you. It just keeps staring at the wall, repeating the same phrase over and over."
	).done_showing
	await p.add_speech_box("Sit and pray... In your pray may you find remorse...").done_showing
	await p.add_description_box(
"Every moment it gets weaker until it disappears."
	).done_showing    
	var answer = await p.add_question_box({
		"1": "[CONCLUDE]"
	})
	if answer == "1":
		await fade_and_remove()

func fade_and_remove():
	var sprite = get_node_or_null("../Sprite3D")
	if sprite:
		var tween = create_tween()
		tween.tween_property(sprite, "modulate:a", 0.0, 1.0)
		tween.tween_callback(Callable(self, "_on_fade_out_finished"))
	else:
		# fallback: fade out self
		var tween = create_tween()
		tween.tween_property(self, "modulate:a", 0.0, 1.0)
		tween.tween_callback(Callable(self, "_on_fade_out_finished"))
		
func _on_fade_out_finished():
	var p = Root.get_dialogue_panel(self)
	if p:
		p.clear()
	queue_free()


func _gui_input(ev: InputEvent):
	if ev is InputEventMouseButton and ev.pressed:
		open_dialogue()
