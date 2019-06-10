extends Node2D

var tiles

var are_zombies_in_lane = false

func _ready():
	tiles = get_node("Tiles").get_children()

func _process(delta):
	if (get_node("Zombie Spawner").zombies_alive > 0):
		are_zombies_in_lane = true
	else:
		are_zombies_in_lane = false

func spawn_zombie(z):
	get_node("Zombie Spawner").spawn_zombie(z)