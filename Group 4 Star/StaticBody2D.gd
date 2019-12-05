extends StaticBody2D

var lives

func _ready():
	lives = 4

func _on_boom_body_entered(body):
	lives = 0

func _on_damage_body_entered(body):
	lives -= 1
