extends Control

@onready var rich_text_label: RichTextLabel = $sliders/VBoxContainer/RichTextLabel
var Volumen

# Back button
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://worlds/main_menu.tscn")

# Volume bar
func _on_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	if value == -100:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -1000)
	rich_text_label.text = 'Volumen: ' + str(value + 100) + '%'

func _ready() -> void:
	rich_text_label.text = 'Volumen: ' + str(AudioServer.get_bus_index("Master") + 100) + '%'
