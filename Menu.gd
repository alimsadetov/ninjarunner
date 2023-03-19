extends CanvasLayer

signal gameover

func show_gameover():
	$RestartButton.show()
	



func _on_RestartButton_pressed():
	emit_signal("gameover")
	get_tree().reload_current_scene()
	$RestartButton.hide()
	Global.Score = 0
