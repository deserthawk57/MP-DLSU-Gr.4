extends Panel

var angle_type

signal rocket_go

func _ready():
	pass # Replace with function body. If it's better.

#plan to change angle type to integer

func _on_Acute_Button_pressed():
	angle_type = 'acute' 
	$Angle_Type_Label.text = 'Angle Type: Acute'

func _on_Obtuse_Button_pressed():
	angle_type = 'obtuse'
	$Angle_Type_Label.text = 'Angle Type: Obtuse'

func _on_Confirm_Button_pressed():
	global.angle = $Angle_Input.text
	
	if int(global.angle) < 0 or int (global.angle) > 180: # error handling for negative numbers and higher than 180
		print ('The number you have typed is not valid')
		$ErrorDialog.popup()
#		while $ErrorDialog.visible:
#			if $ErrorDialog.visible == false:
				#break
		return
	get_node('/root/Main/KinematicBody2D/Sprite').rotation_degrees = 0
	print(angle_type)
	print(global.angle)
	emit_signal('rocket_go',global.angle)

func _on_Angle_Input_text_changed(text): # function for changing angle of rocket sprite
	global.angle = text
	if int(global.angle) < 0 or int (global.angle) > 180 or global.angle == '':
		get_node('/root/Main/KinematicBody2D/Sprite').rotation_degrees = 0 #rotation degrees from Rocket sprite in rocket scene
	else:
		get_node('/root/Main/KinematicBody2D/Sprite').rotation_degrees = int(text) - 90

func _on_Exit_Button_pressed():
	get_tree().change_scene('res://Main Menu.tscn') # goes back to main menu
