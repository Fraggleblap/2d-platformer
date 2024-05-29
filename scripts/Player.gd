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
	if get_node("RayCast2D_R").is_colliding():
		var object = get_node("RayCast2D_R").get_collider()
		if object.is_in_group("Interactable"):
			if Input.is_action_just_pressed("interact"):
				print("iunteractededd")
				print(object)
	elif get_node("RayCast2D_L").is_colliding():
		var object = get_node("RayCast2D_L").get_collider()
		if object.is_in_group("Interactable"):
			if Input.is_action_just_pressed("interact"):
				print("iunteracteded12312321d")
