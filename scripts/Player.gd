extends CharacterBody2D

const SPEED = 90.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var game_manager = %GameManager

func _physics_process(delta):
	# Remove gravity.
	# if not is_on_floor():
	#     velocity.y += gravity * delta

	# Remove jump handling.
	# if Input.is_action_just_pressed("jump") and is_on_floor():
	#     velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	var vertical_direction = Input.get_axis("move_up", "move_down")
	
	# Horizontal movement and animation.
	if horizontal_direction > 0:
		animated_sprite.flip_h = false
	elif horizontal_direction < 0:
		animated_sprite.flip_h = true
	
	if horizontal_direction != 0 or vertical_direction != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	# Set velocity based on input direction.
	velocity.x = horizontal_direction * SPEED
	velocity.y = vertical_direction * SPEED

	move_and_slide()
