extends Node2D

signal got_sunflower

var sunflower

export var spawn_interval = 20
export var pre_round_time = 0
var wait_time = pre_round_time
var reduction = 0.05

func _ready():
	sunflower = preload("res://Sunflower.tscn")

func _process(delta):
	# spawn a sunflower in the specific interval
	if (wait_time <= 0.0):
		wait_time = spawn_interval
		spawn_sunflower()
	wait_time -= reduction
	
func spawn_sunflower():
	var s = sunflower.instance()
	add_child(s)

func _on_Sunflower_got_sunflower():
	print('spawner: clicked on one of my sunflowers!')
	emit_signal("got_sunflower")
