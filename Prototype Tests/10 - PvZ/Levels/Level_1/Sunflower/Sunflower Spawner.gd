extends Node2D

signal got_sunflower

var sunflower

# Timer
var timer = null
export var spawn_interval = 10
export var pre_round_time = 1

func _ready():
	sunflower = preload("Sunflower.tscn")
	
	var main = get_node("/root/Main")
	self.connect("got_sunflower", main, "_on_Sunflower_got_sunflower")
	
	# Timer
	timer = Timer.new()
	timer.wait_time = pre_round_time 	# set the interval to the pre round time
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	timer.start()

# When the timer runs out
func on_timeout_complete():
	spawn_sunflower()					# spawn a sunflower
	timer.wait_time = spawn_interval 	# set the interval to the spawn interval
	timer.start()						# start the timer

#func _process(delta):
	#pass
	
func spawn_sunflower():
	var s = sunflower.instance()
	add_child(s)
	s.spawn_fromWorld(20, 800, 100, 500)

func _on_Sunflower_got_sunflower():
	print('spawner: clicked on one of my sunflowers!')
	emit_signal("got_sunflower")
