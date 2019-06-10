extends Node2D

var tiles

signal are_zombies_in_lane 

func _ready():
	tiles = get_node("Tiles").get_children()
	
	for tile in tiles:
		self.connect("are_zombies_in_lane", tile, "set_zombies_in_lane")

func _process(delta):
	if (get_node("Zombie Spawner").zombies_alive > 0):
		emit_signal("are_zombies_in_lane", true)
	else:
		emit_signal("are_zombies_in_lane", false)

func spawn_zombie(z):
	get_node("Zombie Spawner").spawn_zombie(z)