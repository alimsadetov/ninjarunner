extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_Detection_body_entered(body):
	if body.is_in_group("Player"):
		Global.Score += 10
	



func _on_Obstacle_body_entered(body):
	if body.has_method("Player_hit"):
		body.Player_hit()
