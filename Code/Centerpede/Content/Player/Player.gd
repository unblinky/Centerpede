extends KinematicBody2D
class_name Player

const BULLET_PS: PackedScene = preload("res://Content/Bullet/Bullet.tscn")

export var speed: float = 300 # Pixels / sec.
var direction: Vector2
var velocity: Vector2
var ammo_count: int = 1

func _process(_delta_time):
	# Input Direction
	var x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	direction = Vector2(x, y).normalized()

	# Input Fire
	if Input.is_action_pressed("fire"):
		Fire()
	
	velocity = direction * speed
	move_and_slide(velocity)
	#Move(direction * speed * delta_time)
	

func Move(delta_position: Vector2):
	position += delta_position


func Reload(count: int):
	ammo_count += count
	print("Ammo Count: " + str(ammo_count))
	
	
func Fire():
	if ammo_count > 0:
		# Spawn bullet
		var bullet = BULLET_PS.instance()
		bullet.player = self
		bullet.position = position
		get_parent().get_node("Bullets").add_child(bullet)
		print("Fire!")

		ammo_count -= 1
	
