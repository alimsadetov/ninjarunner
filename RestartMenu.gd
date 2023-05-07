extends CanvasLayer

signal gameover

func show_gameover():
	Global.js_show_ad()
	$RestartButton.show()
	$Record.show()
	



func _on_RestartButton_pressed():
	emit_signal("gameover")
	get_tree().reload_current_scene()
	get_tree().paused = false
	$RestartButton.hide()
	$Record.show()
	Global.Score = 0

