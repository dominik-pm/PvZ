extends Node2D

var zombies_alive = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	zombies_alive = get_child_count()

func spawn_zombie(zombie):
	add_child(zombie)
