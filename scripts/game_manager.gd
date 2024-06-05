extends Node
@onready var inventory_label = $"../CharacterBody2D/Camera2D/inventoryLabel/Label"

var blank_score = 0
var samples = 0
var money = 0
#@onready var score_label = $scoreLabel

func add_blank():
	blank_score += 1
	#score_label.text = "Score " + str(blank_score)

func add_sample():
	samples += 1
	if samples == 10:
		inventory_label.text = "Samples: FULL"
	else:
		inventory_label.text = "Samples: " + str(samples)

func upload():
	money += samples*2
	samples = 0
	inventory_label.text = "Samples: " + str(samples)
