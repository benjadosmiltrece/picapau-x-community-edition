extends AnimatedSprite2D
var fade_in = false
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


func _ready() -> void:
	play("default")
	
func _process(_delta: float) -> void:
	if fade_in:
		animation_player.play("fade_in")
	else:
		animation_player.stop()
