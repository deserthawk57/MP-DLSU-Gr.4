extends Node2D

var start_pos = Vector2(500,400)
var rocket

func _ready():
	rocket = get_node('/root/Main/KinematicBody2D')
	rocket.connect('rocket_die',self,"restart")
	rocket.set_position(start_pos)

func restart():
	print('hi')
	rocket.set_position(start_pos)

	

