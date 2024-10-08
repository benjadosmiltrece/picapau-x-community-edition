extends AnimatedSprite2D
@onready var animated_sprite_2d: AnimatedSprite2D = $"."
@onready var vignette: ColorRect = $"../../vignette"

func _ready() -> void:
	animated_sprite_2d.play("default")
	vignette.transition = false

func _process(delta: float) -> void:
	if animated_sprite_2d.animation_finished:
		animated_sprite_2d.stop
	if Input.is_action_just_pressed("ui_accept"):
		animated_sprite_2d.play("default")
