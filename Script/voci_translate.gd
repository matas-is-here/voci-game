extends Control


func _ready() -> void:
	$CountLabel.text = str(vars.count) + "/" + str(vars.max_count)
	$Next.visible = false
	shuffle_words()
	new_words()
	
func shuffle_words():
	vars.this_word_int = 0
	vars.shuffled_keys = vars.words.keys()
	vars.shuffled_keys.shuffle()

func new_words():
	if (vars.this_word_int >= len(vars.keys)):
		shuffle_words()
	vars.ger_word = vars.shuffled_keys[vars.this_word_int]
	vars.this_word_int += 1
	
	if (vars.is_english == true):
		vars.right_word = vars.words[vars.ger_word]
		vars.trans_word = vars.ger_word
		
	elif (vars.is_english == false):
		vars.right_word = vars.ger_word
		vars.trans_word = vars.words[vars.ger_word]
		
	$WordLabel.text = vars.trans_word



func _on_check_pressed():
	var text = $LineEdit.text
	
	if (text != ""):
		if (text == vars.right_word):
			if (vars.count < vars.max_count):
				$Next.text = "Corect, next!"
				$TextLabel.text = "Nice!"
				$WordLabel.text = "Next!"
				vars.right = true
				vars.mistakes = 0
			else:
				get_tree().change_scene_to_file("res://Sceens/end_screen.tscn")
				vars.mistakes = 0
		else:
			if (vars.mistakes < vars.max_mistakes):
				vars.mistakes += 1
				$Next.text = "Again!"
				$TextLabel.text = "Tipp! the first letter is " + vars.right_word[0]
				$WordLabel.text = "Again?"
				vars.right = false
			else:
				$Next.text = "Next! 😞"
				$TextLabel.text = "The anwser is " + vars.right_word
				$WordLabel.text = "You got this!"
				vars.mistakes = 0
				vars.right = true
				vars.count -= 2
		$Check.disabled = true
		$Next.visible = true
				
				
		$LineEdit.clear()
		$LineEdit.editable = false

# new again


func _on_next_pressed() -> void:
	$LineEdit.editable = true
	$Check.disabled = false
	$Next.visible = false
	if (vars.right == true):
		new_words()
		vars.count += 1
		if (vars.count < 1):
			vars.count = 1
		
		$CountLabel.text = str(vars.count) + "/" + str(vars.max_count)
	else:
		$WordLabel.text = vars.trans_word
		
		
	if (vars.is_english == true):
		$TextLabel.text = "Translate to English:"
		
	elif (vars.is_english == false):
		$TextLabel.text = "Translate to German:"
