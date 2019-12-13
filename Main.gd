extends Node2D

var lives = global.lives
var start_pos = Vector2(0,-15)
var rocket
var reload_obstacles = load('res://Spawner_obstacle.gd').new()

func _ready():
	rocket = get_node('/root/Main/Rocket/KinematicBody2D')
	rocket.connect('rocket_die',self,"restart")
	#$Rocket.set_position(start_pos)
	rocket.set_position(start_pos)
	 
	

func restart():
	
	#$Rocket.set_position(start_pos)
	rocket.set_position(start_pos)
	global.difficulty +=1
	var last_round = get_node("Spawner_obstacle")
	remove_child(last_round)
	last_round.call_deferred("free")
	var next_round = preload("Spawner_obstacle.tscn").instance()
	add_child(next_round)