extends Node2D

var obstacle = preload("res://Obstacle.tscn")
var obstacle2 = preload("res://Obstacle2.tscn")
var obstacle3 = preload("res://Obstacle3.tscn")
var dzubito = preload("res://Dzubito.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_hit(health):
	if (health == 0):
		$RestartMenu.show_gameover() # Replace with function body.
		$Background.backspeed = 0
		get_node("Obstacle").queue_free()
		if Global.Score >= Global.Record:
			Global.save({"score": Global.Score})
			Global.Record = Global.Score
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().paused = true


func _on_SpawnTimer_timeout():
	randomize()
	var randomnumb = randf()
	print(randomnumb)
	if randomnumb<0.2:
		var obs = obstacle.instance()
		obs.position = Vector2(1400, 455)
		obs.scale.x = 2
		obs.scale.y = 2
		obs.z_index = 3
		add_child(obs)
	elif randomnumb>0.2 and randomnumb<0.4:
		var obs = obstacle2.instance()
		obs.position = Vector2(1400, 455)
		obs.scale.x = 2
		obs.scale.y = 2
		obs.z_index = 3
		add_child(obs)
	elif randomnumb>0.4 and randomnumb<0.6:
		var obs = obstacle3.instance()
		obs.position = Vector2(1400, 455)
		obs.scale.x = 2
		obs.scale.y = 2
		obs.z_index = 3
		add_child(obs)
	else:
		var obs = dzubito.instance()
		obs.position = Vector2(1400, 520)
		obs.scale.x = 1.3
		obs.scale.y = 1.3
		obs.z_index = 2
		add_child(obs)
	#$Background/ParallaxLayer4.add_child(obs)
