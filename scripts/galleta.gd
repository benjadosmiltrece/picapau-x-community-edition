extends MeshInstance3D
# test
var toggle = true
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.y = rng.randf_range(0.0, 0.2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if toggle:
		position.y += rng.randf_range(0.0, 0.2) * delta
		if position.y >= 1.1:
			toggle = false
	if toggle == false:
		position.y -= rng.randf_range(0.0, 0.2) * delta
		if position.y <= 0.9:
			toggle = true
