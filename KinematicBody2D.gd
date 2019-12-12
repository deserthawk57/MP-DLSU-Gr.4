extends KinematicBody2D

var User_interface = preload ("res://User_Interface.tscn")
var velocity = Vector2()
var speed = 200
signal rocket_die


func _ready():
	get_node('/root/Main/UI/Panel').connect('rocket_go',self,'rotation_dir')

func rotation_dir(dir):
	
	rotation = deg2rad(int(dir)-90)
	velocity = Vector2(0,-speed).rotated(rotation)
	set_physics_process(true)
	
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)

	if collision_info:
		var collision_point = collision_info.position
		emit_signal('rocket_die')
		print(collision_info.collider)
		velocity = Vector2()
		set_physics_process(false)
		
		

#var speed = 200

#var velocity = Vector2()
#var rotation_speed = 1.5
#var rotation_dir = 0
#
#func get_input():
#    rotation_dir = 0
#    velocity = Vector2()
#    if Input.is_action_pressed('ui_right'):
#        rotation_dir += 1
#    if Input.is_action_pressed('ui_left'):
#        rotation_dir -= 1
#    if Input.is_action_pressed('ui_down'):
#        velocity = Vector2(0, speed).rotated(rotation)
#    if Input.is_action_pressed('ui_up'):
#        velocity = Vector2(0, -speed).rotated(rotation)
#
#func _physics_process(delta):
#    get_input()
#    rotation += rotation_dir * rotation_speed * delta
#    velocity = move_and_slide(velocity)