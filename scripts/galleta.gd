extends MeshInstance3D

var toggle = true
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if toggle:
		position.y += rng.randf_range(0.0, 0.02) + delta / position.y / 2
		if position.y >= 1.5:
			toggle = false
	if toggle == false:
		position.y -= rng.randf_range(0.0, 0.02) + delta / position.y / 2
		if position.y <= 0.5:
			toggle = true
