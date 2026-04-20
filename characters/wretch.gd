extends Node

@export var speaker_color:Color
@export var speaker_portrait:Texture2D

func open_dialogue():
	var p = Root.get_dialogue_panel(self)
	p.clear()
	p.speaker_color = speaker_color
	p.set_speaker_portrait(speaker_portrait)
	p.visible = true
	await p.add_description_box(
"You see a man standing on the platform, weak blaze surrounds his clothes and his body."
	).done_showing
	await p.add_description_box(
"Yet, he is not in pain. He is shivering as if he is cold, but you can see no signs of freezing. He is staring at you with a blank expression, but his eyes are full of sorrow while an optimistic smile decoratrs his face."
	).done_showing

	await p.add_speech_box(
"Oh sir! I am in luck! It is so cold here, I am freezing! Could you help me out? I need... to burn... an...  anything!"
	).done_showing

	var answer = await p.add_question_box({
		"1": "Sir, you are burning alive! Are you sure you are alright?"
	})	

	await p.add_speech_box(
"Me? Oh, yes-yes, I am ok for now. It is you who seem to be turning into a popsicle! How are you able to speak when you are THAT cold?"
	).done_showing


	answer = await p.add_question_box({
		"1": "Would you know how both of us ended up here?",
		"2": "How can I help you? [Proceed]"
	})
	if answer == "1":
		await p.add_speech_box("Oh, I do! I burned everything else. This is the only place that can still warm me up.").done_showing
		answer = await p.add_question_box({
		"2": "How can I help you? [Proceed]"
		})
		#TODO this looks stypid
		await p.add_speech_box("I need anything! Quick! Wood, coal, paper... Anything!").done_showing
	else:
		await p.add_speech_box("I need anything! Quick! Wood, coal, paper... Anything!").done_showing


	answer = await p.add_question_box({
		"1": "I only have a letter from my lover..."
	})
	await p.add_speech_box("Amazing! A good gentleman shouldn't keep anything that connects him to sin in this place. In general, too may I add. Burning bridges to your worst self is the way to go! Just look at me and think for yourself!").done_showing
	
	answer = await p.add_question_box({
		"1": "Have this letter, I hope it will help you.",
		"2": "No, I can't surrender it."
	})	

	if answer == "1":
		Root.remove_from_inventory("Love Letter")
		var root = Root.get_root(self)
		root.create_inventory_panel()
		await p.add_description_box("The love letter is gone. It is being fed to a fire which makes this man extatic. He burns in flames and his flesh turns into ashes and fade away.").done_showing

	elif answer == "2":
		await p.add_speech_box("Oh sir! But I will freeze without it! Fine I heve to... have to... find something...").done_showing
		await p.add_description_box("The man runs off in the fog. You can see the blaze go dimmer and dimmer until it completely dissapears.").done_showing

func _gui_input(ev: InputEvent):
	if ev is InputEventMouseButton and ev.pressed:
		open_dialogue()
