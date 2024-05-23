extends Area2D

@onready var timer = $Timer

var HEALTH = 100


func _on_body_entered(body):
	HEALTH -= 10
	if HEALTH <= 0:
		Engine.time_scale = 0.5
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	else:
		print(body)
		#body.play("damage")




func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
