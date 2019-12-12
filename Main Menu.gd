extends Control


func _ready():
	global.lives = 5


func _on_Button_pressed():
	get_tree().change_scene('res://Main.tscn')


func _on_Button2_pressed():
	get_tree().quit()
