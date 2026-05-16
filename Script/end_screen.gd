extends Control

func _ready():
	vars.mistakes = 0
	vars.count = 1

func _on_home_pressed() -> void:
	get_tree().change_scene_to_file("res://Sceens/main_menu.tscn")
