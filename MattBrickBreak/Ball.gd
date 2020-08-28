extends RigidBody2D

var speedup = 6
var maxspeed = 370

func _ready():
	position = get_parent().get_node("Paddle/Anchor").global_position - Vector2(0,20)
	friction = 0
	bounce = 1
	gravity_scale = 0
	
	mode = MODE_CHARACTER
	linear_damp = 0
	contact_monitor = true
	
	add_to_group("ball")
	contacts_reported = get_tree().get_nodes_in_group("brickos").size()
	

func _process(delta):
	if position.y > get_viewport_rect().end.y:
		queue_free()
		get_parent().lifelost()


func _on_Ball_body_entered(body):
	print(contacts_reported)
	if body.is_in_group("brickos"):
		body.queue_free()
		get_parent().scoreup()
		contacts_reported -= 1
		if contacts_reported == 0:
			queue_free()
			get_parent().levelup()
		
	if body.get_name() == "Paddle":
		var speed = linear_velocity.length()
		var direction = position - get_parent().get_node("Paddle/Anchor").global_position
		linear_velocity = direction.normalized()*min(speed+speedup,maxspeed)
		

