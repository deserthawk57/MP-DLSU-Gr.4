extends CanvasLayer

var heart_full_tex = preload("res://assets/heart(new).png")
var heart_empty_tex = preload("res://assets/heart(empty).png")

func update(hearts):  
	 
	for i in range(0, get_node("HBoxContainer").get_children().size()):
		var heart = get_node("HBoxContainer").get_node("Heart_" + str(i))
		if (i+1) > hearts: heart.texture = heart_empty_tex 
		else: heart.texture = heart_full_tex
