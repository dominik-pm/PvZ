extends Node2D

var final_y
export var speed = 20

signal got_sunflower

func _ready():
	var y = -10
	final_y = 10
	
	transform.origin.y = y
	
	var spawner = get_parent()
	connect("got_sunflower", self, "handle_click")
	self.connect("got_sunflower", spawner, "_on_Sunflower_got_sunflower")


func _process(delta):
	if transform.origin.y < final_y:
		transform.origin.y += (speed * delta)


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		print('sunflower: :)')
		emit_signal("got_sunflower")


func handle_click():
	queue_free()
