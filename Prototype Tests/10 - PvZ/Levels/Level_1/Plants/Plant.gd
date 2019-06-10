extends Node2D

var price = 100
var cooldown = 5

# Timer
var timer = null
export var shooting_interval = 2.0
var can_shoot = true

var bullet = preload("Bullet.tscn")

var zombie_in_lane = false

func _ready():
	# Timer
	timer = Timer.new()
	timer.wait_time = shooting_interval
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)

# When the timer ran out
func on_timeout_complete():
	can_shoot = true

func _process(delta):
	# check if shooting is available (timer) and there is a zombie in lane
	if can_shoot and zombie_in_lane:
		shoot()				# shoot a bullet
		can_shoot = false	# disable shooting until timer's timout is complete
		timer.start()		# start timer again

# shoot a bullet if this functions gets called
func shoot():
	var b = bullet.instance()
	add_child(b)