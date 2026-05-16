extends Control

func _on_5_pressed() -> void:
	vars.max_count = 5
	
	$HScrollBar.value = float(vars.max_count)
	$MaxCountLabel.text = str(vars.max_count)

func _on_10_pressed() -> void:
	vars.max_count = 10
	
	$HScrollBar.value = float(vars.max_count)
	$MaxCountLabel.text = str(vars.max_count)

func _on_all_pressed() -> void:
	vars.max_count = vars.get_word_len()
	
	$HScrollBar.value = float(vars.max_count)
	$MaxCountLabel.text = str(vars.max_count)
	
	


func _on_start_pressed() -> void:
	vars.max_count = int($MaxCountLabel.text)
	get_tree().change_scene_to_file("res://Sceens/voci_translate.tscn")
	


func _on_from_to_pressed() -> void:
	if (vars.is_english == true):
		vars.is_english = false
		$FromTo.text = "English -> German"
	elif (vars.is_english == false):
		vars.is_english = true
		$FromTo.text = "German -> English"
		



func _on_h_scroll_bar_scrolling() -> void:
	vars.max_count = int($HScrollBar.value)
	$MaxCountLabel.text = str(vars.max_count)
	
func _ready() -> void:
	
	$HScrollBar.value = vars.default_count_set
	
	vars.max_count = int($HScrollBar.value)
	$MaxCountLabel.text = str(vars.max_count)
