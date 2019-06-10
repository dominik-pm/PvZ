extends Node2D

var lanes
var plant1
var zombie1

export var spawn_interval = 50
export var pre_round_time = 50
var wait_time = pre_round_time
var reduction = 0.05

func _ready():
	lanes = get_node("Lanes").get_children()
	plant1 = preload("res://Plant.tscn")
	zombie1 = preload("res://Zombie.tscn")

func _process(delta):
	# spawn a zombie in the specific interval
	if (wait_time <= 0.0):
		wait_time = spawn_interval
		spawn_zombie()
	wait_time -= reduction
	
func spawn_zombie():
	print("zombie is being spawned")
	# randi() % 20 -> int from 0 - 19
	var random_i = randi() % lanes.size()   # random index in the lanes array
	var zombie = zombie1.instance()    		# maybe get a random zombie in the future
	lanes[random_i].spawn_zombie(zombie)	# spawn a zombie on that random lane

func get_selected_plant():
	return plant1.instance()