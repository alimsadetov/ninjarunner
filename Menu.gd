extends CanvasLayer

signal gameover

func show_gameover():
	$RestartButton.show()
	



func _on_RestartButton_pressed():
	emit_signal("gameover")
	get_tree().reload_current_scene()
	get_tree().paused = false
	$RestartButton.hide()
	Global.Score = 0
