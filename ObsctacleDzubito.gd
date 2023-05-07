extends Area2D

onready var speed = get_parent().get_node("Background").backspeed

var jumpHeight = 600
var velocity = Vector2.ZERO

func _physics_process(delta):
	position += Vector2.LEFT * speed * delta * 1.5

func _on_ObsctacleDzubito_body_entered(body):
	if body.has_method("Player_hit"):
		if (body.Player_hit()==false):
			$AnimatedSprite.visible = false
		


func _on_Area2D_body_entered(body):
	if body.has_method("Player_hit"):
		$AnimatedSprite.animation = "jump"
		
