extends Node2D

var price = 100

export var shooting_interval = 10.0
var timer_shooting_interval = 0

var reduction = 0.05

var bullet = preload("res://Plants/Bullet.tscn")

var zombie_in_lane = false

func _ready():
	pass

func _process(delta):
	
	if zombie_in_lane:
		# shoot in the specific interval
		if (timer_shooting_interval <= 0.0):
			timer_shooting_interval = shooting_interval
			shoot()
		timer_shooting_interval -= reduction

# shoot a bullet if this functions gets called
func shoot():
	var b = bullet.instance()
	add_child(b)