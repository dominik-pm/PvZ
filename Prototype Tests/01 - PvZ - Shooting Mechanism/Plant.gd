extends Node2D

export var shooting_interval = 10.0
var wait_time = 0
var reduction = 0.05
var zombie_in_lane = false

var bullet = preload("res://Bullet.tscn")

func _ready():
	pass

func _process(delta):
	# shoot with the specific interval if a zombie is in lane
	if zombie_in_lane:
		if (wait_time <= 0.0):
			wait_time = shooting_interval
			shoot()
		wait_time -= reduction

# shoot a bullet if this functions gets called
func shoot():
	var b = bullet.instance()
	add_child(b)