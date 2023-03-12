extends KinematicBody2D

func _on_Detection_body_entered(body):
	if body.is_in_group("Player"):
		Global.Score += 50
