extends Node

var blank_score = 0
#@onready var score_label = $scoreLabel

func add_blank():
	blank_score += 1
	#score_label.text = "Score " + str(blank_score)
	
	
