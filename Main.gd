extends Node2D

var start_pos = Vector2(0,-15)
var rocket

func _ready():
	rocket = get_node('/root/Main/KinematicBody2D/Sprite')
	rocket.connect('rocket_die',self,"restart")
	rocket.set_position(start_pos)

func restart():
	
	rocket.set_position(start_pos)

	

