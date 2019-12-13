extends Node2D

func _process(delta):
	rotation += 0.5 * delta

func _on_damage_body_entered(body):
	if body.has_method("hurt"):
		body.hurt()
	

func _on_boom_body_entered(body):
	if body.has_method("boom"):
		body.boom()
