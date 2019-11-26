extends Panel

var angle_type
var angle

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
	angle = $Angle_Input.text
	if int(angle) < 0 or int (angle) > 180: # error handling for negative numbers and higher than 180
		print ('The number you have typed is not valid')
	print(angle_type)
	print(angle)



