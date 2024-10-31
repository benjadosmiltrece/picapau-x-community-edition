extends Control
@onready var playButton: Button = $play/VBoxContainer/play
@onready var animated_sprite_2d: AnimatedSprite2D = $loading/MarginContainer/AnimatedSprite2D


func _ready() -> void:
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play("RESET")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func Esc():
	if Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()

func _on_resume_button_pressed():
	resume()

func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	playButton.set("disabled", false)
	animated_sprite_2d.fade_in = false
	get_tree().change_scene_to_file("res://worlds/main_menu.tscn")

func _process(_delta: float) -> void:
	Esc()
