extends Node

const RngGd = "res://NoRepeatRNG.gd"
onready var obstacle_asteroid = preload("res://asteroid.tscn")
onready var obstacle_star = preload("res://star.tscn")
onready var obstacle_blackhole = preload("res://BlackHole.tscn")
var difficulty = global.difficulty

var spawn = 15
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
		var obstacle2 = obstacle_star.instance()
		var obstacle3 = obstacle_blackhole.instance()
		var pos = Vector2()
		var x = int(rand_range(10,1010))
		preload("NoRepeatRNG.gd").new(x)
		pos.x = x
		pos.y = ((x-525)*(x-525))/750 + 75
		if difficulty < 3:
			obstacle1.set_position(pos)
			get_node("container").add_child(obstacle1)
		elif difficulty >= 3 and difficulty <= 5:
			var z = int(rand_range(1,11))
			if z == 1:
				obstacle2.set_position(pos)
				get_node("container").add_child(obstacle2)
			else:
				obstacle1.set_position(pos)
				get_node("container").add_child(obstacle1)
		elif difficulty > 6:
			var z = int(rand_range(1,11))
			if z == 1:
				obstacle2.set_position(pos)
				get_node("container").add_child(obstacle2)
			elif z == 2:
				obstacle3.set_position(pos)
				get_node("container").add_child(obstacle3)
			else:
				obstacle1.set_position(pos)
				get_node("container").add_child(obstacle1)
		spawn -= 1
		var y = x
