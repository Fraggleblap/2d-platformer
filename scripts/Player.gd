extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = %GameManager
@onready var interact_label = $Camera2D/interactLabel
@onready var hit_ray = $hitRay

@export var speed = 90

var inventory = []

func get_input():
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	if input_direction.x > 0:
		animated_sprite.flip_h = false
		hit_ray.target_position.x = 17
	elif input_direction.x < 0:
		animated_sprite.flip_h = true
		hit_ray.target_position.x = -17
	if input_direction != Vector2(0,0):
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	if get_node("hitRay").is_colliding():
		var object = get_node("hitRay").get_collider()
		if object and object.is_in_group("Interactable"):
			interact_label.visible = true
			if Input.is_action_pressed("interact"):
				interact_label.visible = false
				if object.is_in_group("collectable"):
					inventory.append(object.name)
					game_manager.add_sample()
					print(inventory)
					object.queue_free()
				elif object.name == "collector":
					game_manager.upload()
				else:
					pass
			else:
				pass
	else:
		interact_label.visible = false
		pass
