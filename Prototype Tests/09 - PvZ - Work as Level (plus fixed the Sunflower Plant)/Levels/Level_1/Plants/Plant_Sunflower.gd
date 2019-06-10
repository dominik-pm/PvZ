extends Node2D

signal got_sunflower

var sunflower
var price = 50
var sunflower_spawned = false
export var spawning_interval = 30.0
var timer_spawning_interval = spawning_interval
var reduction = 0.05

func _ready():
	sunflower = preload("../Sunflower/Sunflower.tscn")
	var spawner = get_parent().get_parent().get_parent().get_parent().get_node("Sunflower Spawner")
	self.connect("got_sunflower", spawner, "_on_Sunflower_got_sunflower")

func _process(delta):
	# spawn a sunflower in the specific interval, if there isnt already a sunflower spawned
	if !sunflower_spawned:
		if (timer_spawning_interval <= 0.0):
			timer_spawning_interval = spawning_interval
			spawn_sunflower()
		timer_spawning_interval -= reduction

# spawn a sunflower when this functions gets called
func spawn_sunflower():
	var s = sunflower.instance()
	add_child(s)
	s.spawn_fromPlant(-20, 20)
	sunflower_spawned = true
	
func _on_Sunflower_got_sunflower():
	sunflower_spawned = false
	emit_signal("got_sunflower")