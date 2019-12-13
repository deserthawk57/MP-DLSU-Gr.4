extends Node

onready var obstacle_asteroid = preload("res://asteroid.tscn")
var spawn = 10
var rand
var y = 0
func _ready():
	spawn()
	pass 


func spawn():
	# ((x-h)*(x-h)) + k, LLx = 0, HLx= 1010
	randomize()
	
	while spawn > 0:
		var obstacle1 = obstacle_asteroid.instance()
		var pos = Vector2()
		var x = rand_range(10,1010)
		if x <= 10 and x <= 200:
			pos.x = x + y
		elif x <= 201 and x <= 402:
			pos.x = x + 2 * y
		elif x <= 403 and x <= 604:
			pos.x = x
		elif x <= 605 and x <= 806:
			pos.x = x - 2 * y
		else:
			pos.x = x - y
		pos.y = ((x-525)*(x-525))/750 + 75
		obstacle1.set_position(pos)
		get_node("container").add_child(obstacle1)
		spawn -= 1
		var y = x
	