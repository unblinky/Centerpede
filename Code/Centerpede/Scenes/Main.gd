extends Node

const SHROOM_PS: PackedScene = preload("res://Content/Mushroom/Mushroom.tscn")
const PLAYER_PS: PackedScene = preload("res://Content/Player/Player.tscn")
const SEGMENT_PS: PackedScene = preload("res://Content/Segment/Segment.tscn")

onready var PLAYER_FIELD := $PlayingField

func _ready():
	print("I am a mighty CENTERPEDE!")
	Spawn(PLAYER_PS, Vector2(100, 200))

# Generic Spawner.
func Spawn(ps: PackedScene, position: Vector2):
	var item = ps.instance()
	item.position = position
	PLAYER_FIELD.add_child(item)
