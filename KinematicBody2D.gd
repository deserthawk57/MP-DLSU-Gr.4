extends KinematicBody2D

var rocket = preload ("res://User_Interface.tscn")
var velocity = Vector2()
var speed = 200

signal rocket_die
 
onready var effects_animation = $EffectsAnimation
onready var damage_timer = $DamageTimer

#health
var health = 4
var damaged

func _ready():
	get_node('/root/Main/UI/Panel').connect('rocket_go',self,'rotation_dir')
	get_node('HUDCanvasLayer').update(4)

func hurt(amount = 1):
	if damage_timer.is_stopped():
		damage_timer.start()
		health -= amount
		get_node("HUDCanvasLayer").update(health)
		effects_animation.play("Damage")
		effects_animation.queue("Flash")
	 
func boom(amount = 4):
	health -= amount
	get_node("HUDCanvasLayer").update(health)
#	$KinematicBody2D.set_position(Vector2(0,-15))
	set_physics_process(false)
	
func rotation_dir(dir):
	
	rotation = deg2rad(int(dir)-90)
	velocity = Vector2(0,-speed).rotated(rotation)
	set_physics_process(true)

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		emit_signal('rocket_die')
		velocity = Vector2(0,0)
		set_physics_process(false)
func _on_DamageTimer_timeout():
	effects_animation.play("Rest")
