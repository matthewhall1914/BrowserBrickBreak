extends KinematicBody2D
	
func _process(delta):
	
	position = Vector2(get_viewport().get_mouse_position().x, 700)

	

func _input(event):
	#UI if you have the time
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		var ballcount = get_tree().get_nodes_in_group("ball")
	#As long as a ball exists, another shall not come to be.
		while ballcount != []:
			return
		var Ball = load("res://Ball.tscn")
		var newBall = Ball.instance()
		get_parent().add_child(newBall)
