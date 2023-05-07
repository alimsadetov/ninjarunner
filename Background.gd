extends ParallaxBackground

var backspeed = 400

func _physics_process(delta):
	backspeed = 400 + (Global.Score / 2)
	scroll_base_offset -= Vector2(backspeed, 0) * delta
