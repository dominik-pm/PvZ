extends Node2D

var zombie = preload("res://Zombie.tscn")
var zombies = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	zombies = get_child_count()

func spawn_zombie():
	var z = zombie.instance()
	add_child(z)
