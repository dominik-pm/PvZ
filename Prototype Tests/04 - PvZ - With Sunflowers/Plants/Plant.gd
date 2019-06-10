extends Node2D

export var shooting_interval = 10.0
var wait_time = 0
var reduction = 0.05
var price = 100

var bullet = preload("res://Plants/Bullet.tscn")

var zombie_in_lane = false

func _ready():
	pass

func _process(delta):
	
	if zombie_in_lane:
		# shoot in the specific interval
		if (wait_time <= 0.0):
			wait_time = shooting_interval
			shoot()
		wait_time -= reduction

# shoot a bullet if this functions gets called
func shoot():
	var b = bullet.instance()
	add_child(b)