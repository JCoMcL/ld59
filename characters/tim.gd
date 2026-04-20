extends Control

@export var speaker_color:Color
@export var speaker_portrait:Texture2D

func open_dialogue():
	var p = Root.get_dialogue_panel(self)
	p.clear()
	p.speaker_color = speaker_color
	p.set_speaker_portrait(speaker_portrait)
	p.visible = true
	await p.add_description_box(
"A high-class man is staring at you with an opportunistic spark in his eye. The imprint of a smile exposing his gold teeth is stuck on his face forever."
	).done_showing
	await p.add_description_box(
"His oblique is covered in all manner of gems and jewels he probably acquired by performing a merit of a questionable character."
	).done_showing
	await p.add_speech_box("Tim Buttlerkson, at your service, kind sir!").done_showing
	await p.add_description_box(
"He speaks so quickly, his sentences feel like single words."
	).done_showing
	await p.add_speech_box("Pleasure to meet you!").done_showing
	await p.add_description_box(
"His arm approaches you at an unbelievable speed, and your hand is shaking his before you can even react."
	).done_showing

	var answer = await p.add_question_box({
		"1": "...And good day to you, sir. To whom do I owe such an honor?"
	})	

	await p.add_speech_box("Why, of course, as I already mentioned, I am Tim Buttlerkson, an entrepreneur from Royal Pleasure Services!").done_showing
	await p.add_description_box(
"He actually did already mention his name. Not just your muscles, but your memory can't outpace this behemoth of capital."
	).done_showing
	await p.add_speech_box("May I interest you in purchasing some luxurious premium metal? I am talking about PURE, HIGH-CARAT, and SACRAMENT G-O-L-D!").done_showing
	await p.add_description_box(
"You try to open your mouth, but the flood of words and epithets crushes any initiative you attempt to preserve."
	).done_showing
	await p.add_speech_box("It is a SUBLIME investment and a PERFECT gift! Maybe for your poor grandma! Imagine all the teeth she could forge for herself from one bar! She would be grateful to you until the sunset of the empires! Or maybe... for your lover? She would be delighted with such an exquisite and sophisticated choice...").done_showing
	await p.add_description_box(
"Cold sweat breaks out on your spine. It drips down as you regain your memories."
	).done_showing
	await p.add_description_box(
"A lover? You do have a lover. Who do you think wrote that letter you keep so close to your heart?"
	).done_showing


	answer = await p.add_question_box({
		"1": "A lover... I..."
	})	

	await p.add_speech_box("I see I am correct.").done_showing
	await p.add_description_box(
"His face is consumed by hunger. He has you where he wants you."
	).done_showing
	await p.add_speech_box("Your wife won't be pleased when she finds out, sir. But between the two of us—you should let her be. This whole 'marriage' concept is so old, so archaic, so unbound to modern reality.").done_showing
	await p.add_speech_box("It's not your fault you are like this; everything this society ever taught us is to let go, forgive, and accept. Only those who understand that can get anything from those who obey.").done_showing
	await p.add_speech_box("Now that we've established that, would you like to buy a whole bar of gold for the lover of your dreams?").done_showing

	answer = await p.add_question_box({
		"1": "Even if I wanted to, I have nothing to pay with."
	})	
	await p.add_speech_box("- Oh, don't worry. Everyone has something precious. Have you met my good friend Wellington? I got his beer.").done_showing
	await p.add_description_box(
"Tim slaps a pocket on his suit, full of liquid. A small droplet jumps out."
	).done_showing 
	await p.add_speech_box("As for you, young gentleman, I see a shiny necklace. No real value, but for the love of the trade, I will give you a full bar of gold for your cheap piece of metal.").done_showing
	await p.add_description_box("The necklace feels especially cold on your chest. You take it in your hand to investigate it, but realize it was not its physical sensation that made you feel cold, but something else troubling you.").done_showing
	await p.add_description_box(
"You open up the necklace. It has an image of a young lady, smiling innocently on the left side, and a scribble: 'For my dear husband' on the right side."
	).done_showing 

	answer = await p.add_question_box({
		"1": "This necklace... it is from my wife."
	})	   
	await p.add_description_box(
"Tim's voice sounds more calculating and strict."
	).done_showing 
	await p.add_speech_box("The more reason to get rid of it. Don't you want to forget her and keep on going with your real life?").done_showing
	await p.add_description_box(
"He takes a pause, as if waiting even for a moment is taxing on him."
	).done_showing 
	await p.add_speech_box("What is your verdict, sir? Deal?").done_showing
	
	answer = await p.add_question_box({
		"1": "Deal.",
		"2": "No, I can not do this."
	})	

	if answer == "1":
		Root.remove_from_inventory("Locket")
		Root.add_item_to_inventory("Fake Gold", preload("res://ui/gold.png"))
		var root = Root.get_root(self)
		root.create_inventory_panel()
		await p.add_description_box("The necklace is gone. It is no longer a part of you. A very light piece of yellow metal appears in your arms. You hit it gently with your fist, and an echo is heard from within the encasement. It is hollow.").done_showing
		await p.add_description_box("You lift your eyes to find Tim, but he is no longer here. You cannot do anything about it. A deal is a deal.").done_showing

	elif answer == "2":
		await p.add_speech_box("A shame, to say the least; I hoped you would be a bit more open-minded and, frankly, a bit more intelligent.").done_showing
		await p.add_description_box("Tim walks off. He walks down the station for a very long time until his silhouette almost disappears on the horizon.").done_showing
		await p.add_description_box("You try to follow him, but reach the end of the platform a few meters away while his figure disappears completely.").done_showing


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
		p.queue_free()
	queue_free()

func _gui_input(ev: InputEvent):
	if ev is InputEventMouseButton and ev.pressed:
		open_dialogue()
