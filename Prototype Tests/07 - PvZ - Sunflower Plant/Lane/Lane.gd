extends Node2D

signal set_selected_plant
signal are_zombies_in_lane 

var tiles

func _ready():
	self.connect("set_selected_plant", get_parent().get_parent(), "_on_lane_set_selected_plant")
	
	tiles = get_node("Tiles").get_children()
	for tile in tiles:
		self.connect("are_zombies_in_lane", tile, "set_zombies_in_lane")

func _process(delta):
	if (get_node("Zombie Spawner").zombies_alive > 0):
		emit_signal("are_zombies_in_lane", true)
	else:
		emit_signal("are_zombies_in_lane", false)

func _on_tile_clicked(tile):
	# get selected plant
	emit_signal("set_selected_plant", tile)
	
func spawn_zombie(z):
	get_node("Zombie Spawner").spawn_zombie(z)