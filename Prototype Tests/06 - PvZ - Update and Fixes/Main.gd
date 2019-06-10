extends Node2D

signal flower_planted

var lanes
var flowershop
var sunflowers = 0
var all_plants
var plant1
var selected_plant
var zombie1

export var spawn_interval = 50
export var pre_round_time = 50
var wait_time = pre_round_time
var reduction = 0.05

func _ready():
	lanes = get_node("Lanes").get_children()
	plant1 = preload("res://Plants/Plant.tscn")
	zombie1 = preload("res://Zombies/Zombie.tscn")
	
	all_plants = [
		plant1
	]
	
	selected_plant = null
	
	flowershop = get_node("Flower Shop")
	flowershop.set_plants(all_plants)		# set selectable plants in the flower shop
	
	# -- connect signals --
	# to tell the flowershop that the selected flower has been planted
	self.connect("flower_planted", get_node("Flower Shop"), "flower_planted")
	# -- --

func _process(delta):
	# spawn a zombie in the specific interval
	if (wait_time <= 0.0):
		wait_time = spawn_interval
		spawn_zombie()
	wait_time -= reduction
	
	# update sunflower Label
	get_node("Sunflowers").text = str(sunflowers)
	
	# update selected plant
	selected_plant = get_node("Flower Shop").selected_plant
	
func spawn_zombie():
	print("zombie is being spawned")
	# randi() % 20 -> int from 0 - 19
	var random_i = randi() % lanes.size()   # random index in the lanes array
	var zombie = zombie1.instance()    		# maybe get a random zombie in the future
	lanes[random_i].spawn_zombie(zombie)	# spawn a zombie on that random lane

# --- signal called functions ---
func _on_lane_set_selected_plant(tile):
	if selected_plant != null:
		var plant = selected_plant.instance()	# make an instance of the selected plant
		
		# plant the selected plant if it is affordable
		if plant.price <= sunflowers:
			print("planted!")
			flowershop.planted_selected()	# tell the flower shop that the selected plant has been planted
			tile.set_plant(plant)			# set the selected plant onto that tile that got clicked on
			sunflowers -= plant.price		# take away the cost of the plant from the sunflowers
		else:
			print('not enough sunflowers')
	else:
		print('no plant selected')
		return null

func _on_Sunflower_Spawner_got_sunflower():
	sunflowers += 50
# --- signal called function ---