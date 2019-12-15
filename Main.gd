extends Node2D

var start_pos = Vector2(500,400)
var rocket

func _ready():
	rocket = get_node('/root/Main/KinematicBody2D')
	rocket.connect('rocket_die',self,"restart")
	rocket.set_position(start_pos)

func restart():
	rocket.set_position(start_pos)
	score(global.angle,global.angle_type)
	global.difficulty +=1
	get_node('/root/Main/UI/Panel/Difficulty').text = 'Difficulty: ' + str(global.difficulty)
	var last_round = get_node("Spawner_obstacle")
	remove_child(last_round)
	last_round.call_deferred("free")
	var next_round = preload("Spawner_obstacle.tscn").instance()
	add_child(next_round)
	

func score(angle,angle_type):
	
	if (int(angle) <= 90 and angle_type == 'acute') or (int(angle) >= 90 and angle_type == 'obtuse'):
		#if correct in both angle and angle type
		global.score += 1000 + (1000 * global.difficulty/10)
	elif (int (angle) < 90 and (angle_type == 'obtuse' or angle_type == null)) or (int(angle) > 90 and (angle_type == 'acute' or angle_type == null)):
		#if correct angle but wrong angle type
		global.score += 500 + (1000 * global.difficulty/10)
	else:
		return
	print(global.score)
	get_node('/root/Main/UI/Panel/Score').text = 'Score: ' + str(global.score)
	