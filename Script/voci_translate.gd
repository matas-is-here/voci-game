extends Control


func _ready() -> void:
	if (vars.is_english == true):
		$TextLabel.text = "Translate to English:"
	elif (vars.is_english == true):
		$TextLabel.text = "Translate to German:"
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
		$WordLabel.text = vars.ger_word
	elif (vars.is_english == false):
		$WordLabel.text = vars.words[vars.ger_word]
	



func _on_check_pressed():
	var text = $LineEdit.text
	
	if (text != ""):
		if (text == vars.words[vars.ger_word] and vars.is_english == true) or (text == vars.ger_word and vars.is_english == false):
			if (vars.count < vars.max_count):
				$Next.text = "Corect, next!"
				vars.right = true
				vars.mistakes = 0
			else:
				get_tree().change_scene_to_file("res://Sceens/end_screen.tscn")
				vars.mistakes = 0
		else:
			if (vars.mistakes <vars.max_mistakes):
				vars.mistakes += 1
				$Next.text = "Again!"
				vars.right = false
			else:
				$Next.text = "Wrong 😞! Next!"
				vars.mistakes = 0
				vars.right = true
				vars.count -= 2
		$Check.disabled = true
		$Next.visible = true
				
				
		$LineEdit.clear()
		$LineEdit.editable = false

	


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
		
