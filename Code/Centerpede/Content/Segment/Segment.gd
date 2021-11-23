extends Node2D

var MAIN: Node
const MUSHROOM_PS: PackedScene = preload("res://Content/Mushroom/Mushroom.tscn")

export var speed: float = 60 # Pixels / sec.
var direction: Vector2 = Vector2.LEFT
var velocity: Vector2

func _process(delta_time):
	position += speed * direction * delta_time

func Init(my_main: Node):
	MAIN = my_main
	return self
	
func _on_Segment_body_entered(body):
	if body is Bullet:
		var shroom = MUSHROOM_PS.instance()
		shroom.position = position
		MAIN.call_deferred("add_child", shroom)
		#MAIN.SpawnMushroom(position)
		
