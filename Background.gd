extends ParallaxBackground

var backspeed = 250

func _physics_process(delta):
	scroll_base_offset -= Vector2(backspeed, 0) * delta
