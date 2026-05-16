extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceens/adjust_max_count.tscn")


func _on_other_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceens/game_menu.tscn")


func _on_exit_pressed() -> void:
	get_tree().quit()
