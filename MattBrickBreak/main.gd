extends Node2D


var level
var lives
var score


# Called when the node enters the scene tree for the first time.
func _ready():
	lives = 3
	level = 1
	score = 0
	get_node("UI/Victory").hide()
	get_node("UI/Defeat").hide()
	get_node("UI/Total Score").hide()
	#setup for loading multiple levels
func levelup():
	print("LEVELUP!")
	get_node("Bricks" + str(level)).queue_free()
	level += 1
	var Bricks = load("res://Bricks" + str(level) + ".tscn")
	if Bricks == null:
		get_node("UI/Victory").show()
		get_node("Paddle").queue_free()
		return
	var NewBricks = Bricks.instance()
	add_child(NewBricks)
	
func lifelost():
	lives -= 1
	get_node("UI/Lives").text = "Lives : " + str(lives)
	if lives == 0:
		get_node("UI/Defeat").show()
		get_node("UI/Total Score").text = "TOTAL SCORE: " + str(score)
		get_node("UI/Total Score").show()

func scoreup():
	score += 50
	get_node("UI/Score").text = "SCORE : " + str(score)


