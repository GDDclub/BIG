class_name InputManager

var x = 0
var raw = Vector2.ZERO

func update_input():
	# Yatay eksen için giriş al
	x = Input.get_axis("walk_left", "walk_right")
	raw = Vector2(x, 0)  # Yatay eksende hareket
