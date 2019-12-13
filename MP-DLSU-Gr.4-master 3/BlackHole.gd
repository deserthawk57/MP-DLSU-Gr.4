extends Area2D

func _process(delta):
	rotation += 0.5 * delta


func _on_Area2D_body_entered(body):
	if body.has_method("hurt"):
		body.hurt()
