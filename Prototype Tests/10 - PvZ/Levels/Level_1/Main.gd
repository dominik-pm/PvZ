extends Node2D

signal flower_planted

export var starting_sunflowers = 150

# Zombie Timer
var timer = null
export var spawn_interval = 5
export var pre_round_time = 5

var lanes
var flowershop
var sunflowers = starting_sunflowers
var all_plants
var plant1
var plant2
var selected_plant
var zombie1

func _ready():
	# initializing
	lanes = get_node("Lanes").get_children()
	plant1 = preload("Plants/Plant.tscn")
	plant2 = preload("Plants/Plant_Sunflower.tscn")
	zombie1 = preload("Zombies/Zombie.tscn")
	
	# init the plants
	all_plants = [
		plant1,
		plant2
	]
	
	selected_plant = null
	
	flowershop = get_node("Flower Shop")
	flowershop.set_plants(all_plants)		# set selectable plants in the flower shop
	
	# Zombie Timer
	timer = Timer.new()
	timer.wait_time = pre_round_time
	timer.connect("timeout", self, "on_timeout_complete")
	timer.start()
	add_child(timer)
	# --
	
	# set a test plant
	#lanes[0].tiles[0].set_plant(plant2.instance())	
	
	# -- connect signals --
	# to tell the flowershop that the selected flower has been planted
	self.connect("flower_planted", get_node("Flower Shop"), "flower_planted")
	# -- --

# Zombie Timer
func on_timeout_complete():
	spawn_zombie()
	timer.wait_time = spawn_interval
	timer.start()

func _process(delta):
	# spawn a zombie in the specific interval
	#if (wait_time <= 0.0):
		#wait_time = spawn_interval
		#spawn_zombie()
	#wait_time -= reduction
	
	# update sunflower Label
	get_node("Sunflowers").text = str(sunflowers)
	
	# update selected plant
	selected_plant = get_node("Flower Shop").selected_plant
	
func spawn_zombie():
	randomize()
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
			if !tile.has_plant:					# if there isnt already a plant on that tile
				tile.set_plant(plant)			# set the selected plant onto that tile that got clicked on
				flowershop.planted_selected()	# tell the flower shop that the selected plant has been planted
				sunflowers -= plant.price		# take away the cost of the plant from the sunflowers
				print("plant set on tile!")
			else:
				print('tile: plant already set on this tile')
		else:
			print('not enough sunflowers')
	else:
		print('no plant selected')
		return null

#func _on_Sunflower_Spawner_got_sunflower():
	#sunflowers += 25
func _on_Sunflower_got_sunflower():
	sunflowers += 25
# --- signal called function ---