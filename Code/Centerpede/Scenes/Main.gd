extends Node

const MUSHROOM_PS: PackedScene = preload("res://Content/Mushroom/Mushroom.tscn")
const SEGMENT_PS: PackedScene = preload("res://Content/Segment/Segment.tscn")

onready var PLAYING_FIELD = $PlayingField

func _ready():
	print("I am a mighty CENTERPEDE!")

func _on_Timer_timeout():
	var segment = SEGMENT_PS.instance().Init(self)
	segment.position = Vector2(100, 100)
	PLAYING_FIELD.add_child(segment)
	
#func SpawnMushroom(position):
#	print("Shroom spawned")
#	var shroom = MUSHROOM_PS.instance()
#	shroom.position = position
#	add_child(shroom)
