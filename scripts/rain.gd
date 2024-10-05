extends Sprite2D

func _process(_delta: float) -> void:
	offset.y = move_toward(offset.y,4000, 15)
	offset.x = move_toward(offset.x,-444, 5)

	if offset.y == 4000:
		offset.y = -500

	if offset.x == -100:
		offset.x = 100
