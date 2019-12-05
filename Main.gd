extends Node2D

var lives = global.lives
var start_pos = Vector2(500,450)
func _ready():
	get_node('/root/Main/Rocket/KinematicBody2D').connect('die',self,"restart")
	$Rocket.set_position(start_pos)
	

func restart():
	$Rocket.set_position(start_pos)
	
