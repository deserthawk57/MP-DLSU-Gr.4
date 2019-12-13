extends KinematicBody2D

var User_interface = preload ("res://User_Interface.tscn")
var velocity = Vector2()
var speed = 200

signal rocket_die

onready var effects_animation = $EffectsAnimation

#health
var health = 4
var damaged

func _ready():
	get_node('/root/Main/UI/Panel').connect('rocket_go',self,'rotation_dir')
	get_node('HUDCanvasLayer').update(4)

func hurt(amount = 1):
	health -= amount
	get_node("HUDCanvasLayer").update(health)
	 
func boom(amount = 4):
	health -= amount
	get_node("HUDCanvasLayer").update(health)
	
func rotation_dir(dir):
	
	rotation = deg2rad(int(dir)-90)
	velocity = Vector2(0,-speed).rotated(rotation)
	set_physics_process(true)

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info:
		emit_signal('rocket_die')
		set_physics_process(false)
	