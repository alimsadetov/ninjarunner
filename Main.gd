extends Node2D

var obstacle = preload("res://Obstacle.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_hit():
	$Menu.show_gameover() # Replace with function body.


func _on_SpawnTimer_timeout():
	var obs = obstacle.instance()
	obs.position = Vector2(1100, 480)
	obs.scale.x = 1.5
	obs.scale.y = 1.5
	obs.z_index = 3
	add_child(obs)
	#$Background/ParallaxLayer4.add_child(obs)
