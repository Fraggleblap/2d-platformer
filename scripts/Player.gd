extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = %GameManager
@export var speed = 90

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if input_direction.x > 0:
		animated_sprite.flip_h = false
	elif input_direction.x < 0:
		animated_sprite.flip_h = true
	
	if input_direction != Vector2(0,0):
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
func _physics_process(delta):
	get_input()
	move_and_slide()
