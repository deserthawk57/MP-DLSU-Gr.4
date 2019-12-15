extends Control


func _ready():
	global.difficulty = 1
	global.score= 0

func _on_Button_pressed():
	get_tree().change_scene('res://Main.tscn')


func _on_Button2_pressed():
	get_tree().quit()
