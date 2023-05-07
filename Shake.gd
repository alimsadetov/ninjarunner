extends Node2D

var shakestrength = 1
var randomshakestrength = 100

onready var shakedecay = 5
onready var camera = $Camera
onready var rand = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	rand.randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	shakestrength = lerp(shakestrength, 0, shakedecay * delta)
	camera.offset = get_random_offset()
	
func get_random_offset() -> Vector2:
	return Vector2(
		rand.randf_range(-shakestrength, shakestrength),
		rand.randf_range(-shakestrength, shakestrength)
	)
	


func _on_Player_hit(health):
	apply_shake()
	
func apply_shake():
	shakestrength = randomshakestrength
