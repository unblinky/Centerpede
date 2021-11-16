extends Node2D

onready var SPRITE = $AnimatedSprite
var health: int = 4 # 0 - 5.

func TakeDamage(delta_damage: int):
	health -= delta_damage

	if health < 0:
		SPRITE.frame = health
		queue_free()
	

func _on_Area2D_body_entered(body):
	print("Here.")
	if body is Bullet:
		TakeDamage(1)

