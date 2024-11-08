extends AnimatedSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"."
@onready var vignette: ColorRect = $"../../vignette"
var list = ["res://worlds/test01/test_01.tscn"]
var random_index = randi() % list.size()
var scene_path = list[random_index]


func _process(_delta: float) -> void:
	if vignette.transition == false:
		animated_sprite_2d.play("default")
	
func _on_animation_finished() -> void:
	# Change scene
	get_tree().change_scene_to_file(scene_path)
	# Remove the item from the list
	list.erase(random_index)
