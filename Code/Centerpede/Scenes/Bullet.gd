extends Area2D

export var speed = 600.0 # 300 - 1200

func _process(delta_time):
	if position.y < 50:
		Kill()
		pass
	position.y -= speed * delta_time
	

func Kill():
	queue_free()
