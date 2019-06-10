extends Node2D

var spawners
var plants

func _ready():
	spawners = get_node("Spawner").get_children()
	spawners[0].spawn_zombie()
	spawners[2].spawn_zombie()
	spawners[4].spawn_zombie()
	
	plants = get_node("Plants").get_children()

func _process(delta):
	for i in range(5):
		if spawners[i].zombies > 0:
			plants[i].zombie_in_lane = true
		else:
			plants[i].zombie_in_lane = false