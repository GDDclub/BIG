class_name InputManager

var x
var y
var normalized
var raw


func update(delta):
	
	x = Input.get_axis("walk_left", "walk_right")
	y = Input.get_axis("walk_up", "walk_down")
	raw = Vector2(x, y)
	normalized = raw.normalized()
	
