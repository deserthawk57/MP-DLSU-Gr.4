extends StaticBody2D

var lives

func _ready():
	lives = 4


func _on_damage_area_entered(area):
	lives -= 1

func _on_boom_area_entered(area):
	lives = 0