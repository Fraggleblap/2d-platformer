extends Area2D

@onready var game_manager = %GameManager
@onready var animation_player = $AnimationPlayer
@onready var PLAYER = $"../CharacterBody2D"


func _on_body_entered(body):
	game_manager.add_blank()
	animation_player.play("pickup")
