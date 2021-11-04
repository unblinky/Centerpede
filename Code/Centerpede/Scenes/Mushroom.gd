extends Node2D
class_name Mushroom

onready var ANIMATION = $AnimatedSprite

func _ready():
	ANIMATION.play("default")
