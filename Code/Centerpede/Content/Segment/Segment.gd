extends Node2D

const MUSHROOM_PS: PackedScene = preload("res://Content/Mushroom/Mushroom.tscn")

export var speed: float = 60 # Pixels / sec.
var direction: Vector2 = Vector2.LEFT
var velocity: Vector2

var is_headed_left: bool = true # TODO: Randomize at spawn?
var is_dropping: bool
var down_pos: Vector2

func _process(delta_time):
	position += speed * direction * delta_time
	if is_dropping:
		if position.distance_to(down_pos) > 16:
			is_headed_left = !is_headed_left
			is_dropping = false
			if is_headed_left:
				direction = Vector2.LEFT
			else:
				direction = Vector2.RIGHT
	
	
func _on_Segment_body_entered(body):
	print(body)
	
	if body is Bullet or body is Player:
		body.Kill()
		
		var shroom = MUSHROOM_PS.instance()
		shroom.position = position
		get_node("../").call_deferred("add_child", shroom)
		queue_free()
	else:
		is_dropping = true
		direction = Vector2.DOWN
		down_pos = position
		
