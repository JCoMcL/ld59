extends TextureRect

@export var speaker_color:Color
@export var speaker_portrait:Texture2D

func open_dialogue():
	var p = Root.get_dialogue_panel(self)
	p.clear()
	p.speaker_color = speaker_color
	p.set_speaker_portrait(speaker_portrait)
	p.visible = true
	await p.add_description_box(
"You approach a gate at the end of the railway and stand in front of it. An uneasy feeling consumes you."
	).done_showing
	await p.add_description_box(
"This is the end."
	).done_showing
	await p.add_description_box(
"There is no motion, but you sense the gates are staring at you."
	).done_showing
	await p.add_description_box(
"A voice comes forth. You can't hear it, but you sense it in your head."
	).done_showing
	await p.add_speech_box("Sinner, you will be judged. You went through remorse and made your decisions. It is time to evaluate them.").done_showing
	
	
	
	if Root.has_item("Fake Gold") && Root.has_item("Love Letter"):
		await p.add_speech_box(
			"The voice is laughing. It is a deep, cold, and mocking laugh. It is not a human laugh, but it is not inhuman either. It is something else, something you can't comprehend."
		).done_showing
		await p.add_description_box(
			"You feel like you are being mocked for your choices, your life, your existence—everything."
		).done_showing
		await p.add_speech_box(
			"You broke your oath of loyalty. You are a traitor. You are a liar. You are a thief. You are a cheat. You are a coward. You are a weakling. You are a fool. You are a failure. You are a disappointment. You are a disgrace. You are a burden. You are a parasite. You are a leech. You are a scum. You are a vermin. You are a pest. You are a disease."
		).done_showing
		await p.add_description_box(
			"Yet, you had the courage to face your fate. To make a decision and abandon the old. May pain never leave your heart, but you no longer dare to torture two souls. And for that..."
		).done_showing
		
		await p.add_description_box(
			"You may pass."
		).done_showing
		await p.add_description_box(
		"The gates open before you. You pass through with hesitation, but you know you have no choice. You step through the gates and find yourself in a bright light. You feel a sense of relief, but also a sense of loss. You are not sure what is waiting for you on the other side, but you know it is not the same as this place."
		).done_showing

		await p.add_description_box(
		"THE END. Ending 1/4: The Traitor."
		).done_showing
	
	elif Root.has_item("Locket") && Root.has_item("Love Letter"):
		await p.add_description_box(
			"The voice is silent for a moment."
		).done_showing
		await p.add_speech_box(
			"You were sent here to get an opportunity to confess. To see the consequences of your actions. You decided you can stay as you are—a torturer of souls. And by this, you dared to name yourself God."
		).done_showing
		await p.add_speech_box(
			"To see the results of your choices. You had the chance to be honest, but you chose to lie. You chose to betray. You chose to cheat. You chose to steal. You chose to be a coward. You chose to be a weakling. You chose to be a fool. You chose to be a failure. You chose to be a disappointment. You chose to be a disgrace. You chose to be a burden. You chose to be a parasite. You chose to be a leech. You chose to be scum. You chose to be vermin. You chose to be a pest. You chose to be a disease."
		).done_showing
		await p.add_speech_box(
			"You deserve no salvation. You deserve no mercy. You deserve no forgiveness. You deserve no redemption."
		).done_showing
		await p.add_speech_box(
			"And your punishment is to stay here, lost for eternity. To be a part of this place. To be a part of the fog. To be a part of the darkness. To be a part of the nothingness. To be a part of the void."
		).done_showing
		await p.add_description_box(
		"The gates are sealed. You are now trapped here, lost to the world and to yourself."
		).done_showing
		await p.add_description_box(
		"THE END. Ending 3/4: The Lost Being."
		).done_showing

	elif Root.has_item("Locket"):
		await p.add_description_box(
			"The voice is silent for a moment. It is as if it is trying to find the right words, the right way, the right tone to say them."
		).done_showing

		await p.add_speech_box(
			"You sinned, but with your remorse you kept your oath of loyalty. Only with truth and honesty may you cleanse your soul."
		).done_showing
		await p.add_speech_box(
			"Then, you shall be a faithful servant. You shall be a loyal friend. You shall be a true companion. You shall be a brave soul. You shall be a strong heart. You shall be a pure spirit. You shall be a noble being. You shall be a virtuous person. You shall be righteous."
		).done_showing
		await p.add_speech_box(
			"You may pass."
		).done_showing
		await p.add_description_box(
		"The gates open before you. You pass through without hesitation. You step through the gates and find yourself in a bright light. You feel a sense of relief, but also a sense of loss. You are not sure what is waiting for you on the other side, but you know it is not the same as this place."
		).done_showing	
		await p.add_description_box(
		"THE END. Ending 2/4: The Saved Soul."
		).done_showing

	else:
		await p.add_description_box(
			"The voice is silent for a moment."
		).done_showing
		await p.add_speech_box(
			"You sinned, and in your remorse you gave up everything."
		).done_showing
		await p.add_speech_box(
			"You decided to betray everything you had. You decided to betray yourself. You decided to betray your soul. You decided to betray your heart. You decided to betray your mind. You decided to betray your body. You decided to betray your existence."
		).done_showing
		await p.add_speech_box(
			"Your soul may be cleansed, but left empty. There is nowhere to come back to. There is nothing to come back to. You are lost. You are alone. You are nothing."
		).done_showing
		await p.add_speech_box(
			"There cannot be anything behind these gates for you. You are now lost for eternity. But you are lost as a man, not as a being."
		).done_showing
		await p.add_description_box(
			"The gates are sealed. You are now trapped here, lost to the world and to yourself."
		).done_showing
		await p.add_description_box(
		"THE END. Ending 3/4: The Lost Man."
		).done_showing


func _gui_input(ev: InputEvent):
	if ev is InputEventMouseButton and ev.pressed:
		open_dialogue()
