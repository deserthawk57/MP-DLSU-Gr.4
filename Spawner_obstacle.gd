extends Node

onready var obstacle_asteroid = preload("res://asteroid.tscn")
var spawn = 10
var rand

func _ready():
	spawn()
	pass 

func spawn():
	randomize()
	rand = rand_range(0,100)
	while spawn > 0:
		var obstacle1 = obstacle_asteroid.instance()
		var pos = Vector2()
		pos.y = rand_range(50, 400)
		pos.x = rand_range(100, 900)
		obstacle1.set_position(pos)
		get_node("container").add_child(obstacle1)
		spawn -= 1
	