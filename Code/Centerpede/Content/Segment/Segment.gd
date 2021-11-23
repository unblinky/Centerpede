extends Node2D

const MUSHROOM_PS: PackedScene = preload("res://Content/Mushroom/Mushroom.tscn")

export var speed: float = 60 # Pixels / sec.
var direction: Vector2 = Vector2.LEFT
var velocity: Vector2


func _process(delta_time):
	position += speed * direction * delta_time
	
	
func _on_Segment_body_entered(body):
	if body is Bullet:
		body.Kill()
		
		var shroom = MUSHROOM_PS.instance()
		shroom.position = position
		#get_node("../").add_child(shroom)
		#call_deferred("Kill")
		
func Kill():
	queue_free()
