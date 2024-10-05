extends PanelContainer

func _process(_delta: float) -> void:
	set_position(Vector2(get_viewport().size.x, get_viewport().size.y))
