extends Node2D

var lives = global.lives
var start_pos = Vector2(0,-15)
var rocket
func _ready():
	rocket = get_node('/root/Main/Rocket/KinematicBody2D')
	rocket.connect('rocket_die',self,"restart")
	#$Rocket.set_position(start_pos)
	rocket.set_position(start_pos)
	 
	

func restart():
	
	#$Rocket.set_position(start_pos)
	rocket.set_position(start_pos)
	
	
