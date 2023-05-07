extends KinematicBody2D

onready var speed = get_parent().get_node("Background").backspeed

var health = 3
var gravity = 2000
var jumpHeight = 900
var velocity = Vector2.ZERO
var is_jumping = false

func _physics_process(delta):
	position += Vector2.LEFT * speed * delta * 1.5
	if is_on_floor():
		$AnimatedSprite.animation = 'default'
	
	#if is_jumping and is_on_floor():
		#velocity.y -= jumpHeight
	elif velocity.y < 0 and not $RayCast2D.is_colliding():
		$AnimatedSprite.animation = 'jump'
	elif velocity.y > 0 and not $RayCast2D.is_colliding(): #если velocity.y > 0 то это взлёт, если < 0 то падение
		$AnimatedSprite.animation = 'fall'
		
	
	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _on_Area2D_body_entered(body):
	if body.has_method("Player_hit"):
		randomize()
		var randomnumb = randf()
		if randomnumb < 0.5:
			if is_on_floor():
				velocity.y -= jumpHeight
				print(velocity.y)


func _on_CollisionArea_body_entered(body):
	if body.has_method("Player_hit"):
		if body.is_attacking:
			$AnimatedSprite.visible = false
		else:
			body.Player_hit()
