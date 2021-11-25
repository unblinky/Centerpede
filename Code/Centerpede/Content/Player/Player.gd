extends KinematicBody2D
class_name Player

const BULLET_PS: PackedScene = preload("res://Content/Bullet/Bullet.tscn")

export var speed: float = 300 # Pixels / sec.
var direction: Vector2
var velocity: Vector2
var ammo_capacity: int = 4
var ammo_inventory: int = 1

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
	if ammo_inventory < ammo_capacity:
		ammo_inventory += count
		print("Ammo Imventory: " + str(ammo_inventory))
	
func Fire():
	if ammo_inventory > 0:
		# Spawn bullet
		var bullet = BULLET_PS.instance()
		bullet.player = self
		bullet.position = position
		get_parent().add_child(bullet)
		print("Fire!")

		ammo_inventory -= 1
	
func Kill():
	queue_free()
