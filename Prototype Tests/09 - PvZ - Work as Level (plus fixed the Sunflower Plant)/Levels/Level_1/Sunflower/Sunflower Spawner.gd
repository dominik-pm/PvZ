extends Node2D

signal got_sunflower

var sunflower

export var spawn_interval = 20
export var pre_round_time = 0
var wait_time = pre_round_time
var reduction = 0.05

func _ready():
	sunflower = preload("Sunflower.tscn")
	self.connect("got_sunflower", get_parent(), "_on_Sunflower_Spawner_got_sunflower")

func _process(delta):
	# spawn a sunflower in the specific interval
	if (wait_time <= 0.0):
		wait_time = spawn_interval
		spawn_sunflower()
	wait_time -= reduction
	
func spawn_sunflower():
	var s = sunflower.instance()
	add_child(s)
	s.spawn_fromWorld(20, 800, 100, 500)

func _on_Sunflower_got_sunflower():
	print('spawner: clicked on one of my sunflowers!')
	emit_signal("got_sunflower")
