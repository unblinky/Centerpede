extends Node

func _ready():
	print("I am a mighty CENTERPEDE!")
	#kirkja a digital playground to help one learn about the earth sciences.

func _unhandled_key_input(_event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
