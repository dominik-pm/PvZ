extends Node2D

signal got_sunflower

var sunflower
var price = 50
export var spawning_interval = 10.0
var timer_spawning_interval = 0
var reduction = 0.05

func _ready():
	sunflower = preload("res://Sunflower/Sunflower.tscn")
	var spawner = get_parent().get_parent().get_parent().get_parent().get_node("Sunflower Spawner")
	self.connect("got_sunflower", spawner, "_on_Sunflower_got_sunflower")

func _process(delta):

	# spawn a sunflower in the specific interval
	if (timer_spawning_interval <= 0.0):
		timer_spawning_interval = spawning_interval
		spawn_sunflower()
	timer_spawning_interval -= reduction

# shoot a bullet if this functions gets called
func spawn_sunflower():
	var s = sunflower.instance()
	add_child(s)
	
func _on_Sunflower_got_sunflower():
	emit_signal("got_sunflower")