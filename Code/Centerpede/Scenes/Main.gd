extends Node

const SHROOM_PS: PackedScene = preload("res://Content/Mushroom/Mushroom.tscn")
const PLAYER_PS: PackedScene = preload("res://Content/Player/Player.tscn")
const SEGMENT_PS: PackedScene = preload("res://Content/Segment/Segment.tscn")

onready var PLAYER_FIELD := $PlayingField
var segment_count: int = 1

func _ready():
	print("I am a mighty CENTERPEDE!")
	Spawn(PLAYER_PS, Vector2(100, 200))


# Generic Spawner.
func Spawn(ps: PackedScene, position: Vector2):
	var item = ps.instance()
	item.position = position
	PLAYER_FIELD.add_child(item)


func SpawnCenetipede(segment_count: int):
	for i in segment_count:
		Spawn(SEGMENT_PS, Vector2(20 * i + 100, 16))

func _unhandled_key_input(_event):
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()


func _on_Timer_timeout():
	SpawnCenetipede(segment_count)
	segment_count += 1
