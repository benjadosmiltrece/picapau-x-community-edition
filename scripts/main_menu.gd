extends Control
@onready var options_2: Control = $options2
@onready var creditos: Control = $creditos
@onready var boop: AudioStreamPlayer2D = $boop

var array = ["res://worlds/test01/test_01.tscn"]

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file(array.pick_random())
#---------------------------------------------------------------------------------------------------
func _on_options_pressed() -> void:
		options_2.visible = not options_2.visible
		if creditos.visible == true:
			creditos.visible = not creditos.visible
#---------------------------------------------------------------------------------------------------
func _on_exit_pressed() -> void:
	get_tree().quit();


func _on_button_pressed() -> void:
	boop.play()


func _on_asd_pressed() -> void:
	creditos.visible = not creditos.visible
	if options_2.visible == true:
		options_2.visible = not options_2.visible
