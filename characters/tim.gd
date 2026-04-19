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
"A big-cash class unit is staring at you with an opportunistic spark in his eye. An imprint of a smile that exposes his gold teeth is stuck with him forever."
	).done_showing
    await p.add_description_box(
"His oblique is covered in all manner of gems and jewels he probably acquired by performing a merit of a questionable character."
    ).done_showing
    await p.add_speech_box("Tim Buttlerkson, at your service, kind sir!").done_showing
    await p.add_description_box(
"He speaks so quickly his sentences feel like singular words."
    ).done_showing
    await p.add_speech_box("Pleasure to meet you!").done_showing
    await p.add_description_box(
"His arm is approaching you at an unbelievable speed, and your hand is shaking his before you could even react."
    ).done_showing

    var answer = await p.add_question_box({
        "1": "...And good day to you, sir. To whom do I owe such an honor?"
    })	

    await p.add_speech_box("Why, of course, as I already mentioned, I am Tim Buttlerkson, an entrepreneur from Royal Pleasure Services!").done_showing
    await p.add_description_box(
"He actually did already mention his name. Not just your muscle, but your memory can't outpace this behemoth of capital."
    ).done_showing
    await p.add_speech_box("May I interest you in purchasing an amount of luxurious premium metal? I am talking about PURE, HIGH-CARAT, and SACRAMENT G-O-L-D!").done_showing
    await p.add_description_box(
"You try to open your mouth, but the flood of words and epithets crush any initiative you attempt to preserve."
    ).done_showing
    await p.add_speech_box("It is a SUBLIME investment and a PERFECT gift! Maybe for your poor grandma! Imagine all the teeth she can forge for herself from one bar! She will be grateful to you until the sunset of the empires! Or maybe... for your lover? She would be delighted with such an exquisite and sophisticated choice...").done_showing
    await p.add_description_box(
"Cold sweat breaks on your spine. It bleeds down as you regain your memories."
    ).done_showing
    await p.add_description_box(
"A lover? You do* have a lover. Who do you think wrote that letter you keep so close to your heart?"
    ).done_showing


    answer = await p.add_question_box({
        "1": "A lover... I..."
    })	

    await p.add_speech_box("I see I am correct.").done_showing
    await p.add_description_box(
"His face is consumed by hunger. He got you where he wants you."
    ).done_showing
    await p.add_speech_box("Your wife won't be pleased when she finds out, sir. But between the two of us - you should let her be. This whole 'marriage' concept is so old, so archaic, so unbound to the modern reality.").done_showing
    await p.add_speech_box("It is not your fault you are like this; everything this society ever taught us is to let go, forgive, and accept. Only the ones who understand that can get anything from those who obey.").done_showing
    await p.add_speech_box("Now that we established that, would you like to buy a whole bar of gold for the lover of your dreams?").done_showing

    answer = await p.add_question_box({
        "1": "Even if I wanted to, I have nothing to pay with."
    })	
    await p.add_speech_box("- Oh, don't problem. Everyone has something precious. Have you met my good friend Wellington? I got his beer.").done_showing
    await p.add_description_box(
"Tim slaps a pocket on his suit full of liquid. A small droplet of it jumps out of the pocket."
    ).done_showing 
    await p.add_speech_box("As for you, young gentleman, I see a shiny necklace. No real value, but for the love of the trade, I will give off a full bar of gold for your cheap piece of metal.").done_showing
    await p.add_description_box("The necklace feels especially cold on your chest. You take it in your arm to investigate it but realize it was not its physical sensation that made you feel cold, but something else troubling you.").done_showing
    await p.add_description_box(
"You open up the necklace.It has an image of a young lady, smiling innocently on the left side and a scribble 'For my dear husband' on the right side."
    ).done_showing 

    answer = await p.add_question_box({
        "1": "This necklace... it is from my wife."
    })	   
    await p.add_description_box(
"Tim's voice sounds more calculating and strict."
    ).done_showing 
    await p.add_speech_box("The more reason to get rid of it. Don't you want to forget her and keep on going with your real life?").done_showing
    await p.add_description_box(
"He takes a pause as if waiting even for a moment is taxing on him."
    ).done_showing 
    await p.add_speech_box("What is your verdict, sir? Deal?").done_showing
	
    answer = await p.add_question_box({
		"1": "Deal.",
		"2": "No, I can not do this."
	})	

    if answer == "1":
        await p.add_description_box("The necklace is gone. It is a part of you no longer. A very light piece of yellow metal appears in your arms. You hit it gently with your fist, and an echo is heard from within the encasement. It is hollow.").done_showing
        await p.add_description_box("You lift your eyes to find Tim, but he is no longer here. You can not do anything about it. A deal is a deal.").done_showing
    elif answer == "2":
        await p.add_speech_box("A shame to say the least; I hoped you would be a bit more open-minded and, frankly, a bit more intelligent.").done_showing
        await p.add_description_box("Tim walks off. He walks down the station but does so for a very long time until his silhouette almost disappears from on the horizon.").done_showing
        await p.add_description_box("You try to follow him but reach the end of the platform a few meters away while his figure disappears completely.").done_showing

func _gui_input(ev: InputEvent):
    if ev is InputEventMouseButton and ev.pressed:
        open_dialogue()
