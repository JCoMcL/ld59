extends Control
class_name Character

@export var speaker_color:Color
@export var speaker_portrait:Texture2D

func open_dialogue():
	var p = Root.get_dialogue_panel(self)
	p.clear()
	p.speaker_color = speaker_color
	p.set_speaker_portrait(speaker_portrait)
	p.visible = true
		
	await p.add_description_box(
"A murky old man rests against a cold brick. His face reminds you of every single alcoholic human misfortune you ever saw. His teeth periodically cling to an empty bottle of cheap beer in a desperate attempt to extract a nostalgic flavor. It feels like the bottle is sucking the life out of him."
	).done_showing
	await p.add_speech_box("Ah... what did [i]you[/i] do?").done_showing
	await p.add_description_box(
"A torn voice reaches you through his mouth; the rest of his body appears almost immobile."
	).done_showing
	var answer = await p.add_question_box({
		"1": "Fell asleep.",
		"2": "Something terrible."
	})	
	if answer == "1":
		await p.add_speech_box("Don't want to tell me? I guessh' one can keep secrets around here.").done_showing
	elif answer == "2":
		await p.add_speech_box("Oh I know, we all did. Feel yourshelf at home ye bastart.").done_showing
		await p.add_description_box("He chuckles").done_showing

	answer = await p.add_question_box({
		"1": "Who are you?"
	})
	await p.add_speech_box("I forgot. I didn't, however, forget the last thing I had before I got here. A juicy and crusty beef Wellington. Call me that, I guesh'.").done_showing

	answer = await p.add_question_box({
		"1": "Why can't you remember your name?",
		"2": "Where are we? [Proceed]"
	})
	if answer == "1":
		await p.add_speech_box("It was not important for the past years, I guess. Maybe I didn't like it.").done_showing
		answer = await p.add_question_box({
		"2": "Where are we? [Proceed]"
		})
		#TODO this looks stypid
		await p.add_speech_box("Can't ye read, good sir? *A vicious smile carves itself on his face* We are at the...").done_showing
		await p.add_description_box("He squints at a sign.").done_showing
		await p.add_speech_box("Lerindistreligterlim train station!").done_showing
		await p.add_description_box("Painful laughter escapes his lungs.").done_showing
		await p.add_speech_box("Well, to correct my statement—it is indeed just a train station. It is no place; Lerindistreligterlim does not exist. It is all just dense fog beyond the exit.").done_showing

	else:
		await p.add_speech_box("Can't ye read, good sir? *A vicious smile carves itself on his face* We are at the...").done_showing
		await p.add_description_box("He squints at a sign.").done_showing
		await p.add_speech_box("Lerindistreligterlim train station!").done_showing
		await p.add_description_box("Painful laughter escapes his lungs.").done_showing
		await p.add_speech_box("Well, to correct my statement—it is indeed just a train station. It is no place; Lerindistreligterlim does not exist. It is all just dense fog beyond the exit.").done_showing


	answer = await p.add_question_box({
		"1": "What's beyond the fog?",
		"2": "How do we leave? [Proceed]"
	})
	if answer == "1":
		await p.add_speech_box("Death. At least, I think it is death. Had a bunch of folks try there, but they couldn't come back to testify. Could be God, but for us two, it won't matter. God hates those who come uninvited. Ye must deserve an invitation. That's what my pastor told me, at the very least. He must've earned his invite before he hanged himself.").done_showing
		answer = await p.add_question_box({
		"2": "How do we leave? [Proceed]"
		})
		#TODO this looks stypid
		await p.add_speech_box("There is no 'we', laddie. I LOVE it here. No piggie punching my kidneys, no kinky beautiful gal crushing my heart to pieces. This place is where I belong! And this is my home as I would love to know it. And you, gentleman, are my guest, and that's how I love to feel it.").done_showing
	else:
		await p.add_speech_box("There is no 'we', laddie. I LOVE it here. No piggie punching my kidneys, no kinky beautiful gal crushing my heart to pieces. This place is where I belong! And this is my home as I would love to know it. And you, gentleman, are my guest, and that's how I love to feel it.").done_showing


	answer = await p.add_question_box({
		"1": "How do I leave then?"
	})
	await p.add_speech_box("You see the train? It leaves and comes back eventually. It goes around some stations. It comes in and leaves every day, so you got to wait it out on a bench. Funny part though—I am sure there are just four stations, so you are not getting anywhere anyway.").done_showing
	await p.add_description_box("He gives you a hopeful gaze.").done_showing 
	await p.add_speech_box("So, I would suggest you stay here. I got another clear bottle, and we could be bottle buds!").done_showing
	await p.add_description_box("The expression on his face is desperately trying to communicate positivity and carelessness, but you feel the unnatural insanity bleeding through it. This man will not help you any longer, nor can you truly help him.").done_showing

	answer = await p.add_question_box({
		"1": "I am sorry, I must go.",
		"2": "You don't look like a man of a trustworthy character, I will make my way."
	})	
	if answer == "1":
		await p.add_speech_box("I wish I could stop you. Get lost then.").done_showing
	elif answer == "2":
		await p.add_description_box("A genuine smile sparks on the man's face.").done_showing
		await p.add_speech_box("I wasn't called that for many, many years. You telling me you are a saint? In this place?").done_showing
		await p.add_description_box("He points at you and laughs hysterically.").done_showing
		await p.add_speech_box("Well, I don't know, laddie. Luck be with you, then.").done_showing

	answer = await p.add_question_box({
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
