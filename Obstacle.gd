extends Area2D

onready var speed = get_parent().get_node("Background").backspeed

func _physics_process(delta):
	position += Vector2.LEFT * speed * delta * 1.5

func _on_Detection_body_entered(body):
	if body.is_in_group("Player"):
		Global.Score += 10
	



func _on_Obstacle_body_entered(body):
	if body.has_method("Player_hit"):
		body.Player_hit()
