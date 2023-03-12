extends Label

# warning-ignore:unused_argument
func _process(delta):
	text = String(Global.Score)


func _on_ScoreTimer_timeout():
	Global.Score += 1
