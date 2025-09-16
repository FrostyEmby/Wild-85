extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/the_one_room.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menus/options_menu/master_options_menu_with_tabs.tscn")


func _on_credits_pressed() -> void:
	pass # Replace with function body.
