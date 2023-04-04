extends KinematicBody2D

signal hit

onready var running = $AnimationPlayer

var hearts_1 = preload("res://1.png")
var hearts_2 = preload("res://2.png")

var health = 3
var gravity = 1000
var jumpHeight = 600
var velocity = Vector2.ZERO
var is_attacking = false

func _physics_process(delta):
	if is_on_floor():
		play_animation("Running")
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y -= jumpHeight
	elif velocity.y < 0 and not $RayCast2D.is_colliding():
		play_animation('Jumping')
	elif velocity.y > 0 and not $RayCast2D.is_colliding(): #если velocity.y > 0 то это взлёт, если < 0 то падение
		play_animation("Falling")
	if Input.is_action_pressed("atack"):
		if is_attacking==false:
			is_attacking=true
			yield(get_tree().create_timer(0.8), "timeout")
			is_attacking=false
		
	
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	
	

func Player_hit():
	health -= 1
	emit_signal('hit', health)
	if health == 2:
		get_node("..").get_node("Hearts").set_texture(hearts_2)
	if health == 1:
		get_node("..").get_node("Hearts").set_texture(hearts_1)
	if health == 0:
		get_node("..").get_node("Hearts").visible = false
		queue_free()
	

func play_animation(animationName):
	if is_attacking:
		running.play("Atack")
	else:
		running.play(animationName)

