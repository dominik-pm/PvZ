extends Node2D

export var speed = 0.5
var final_y

signal got_sunflower

func _ready():
	var y = -10
	var x = rand_range(20, 800)
	final_y = rand_range(20, 500)
	
	transform.origin.x = x
	transform.origin.y = y
	
	var spawner = get_parent()
	connect("got_sunflower", self, "handle_click")
	self.connect("got_sunflower", spawner, "_on_Sunflower_got_sunflower")
	

func _process(delta):
	if transform.origin.y < final_y:
		transform.origin.y += speed


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		print('sunflower: :)')
		emit_signal("got_sunflower")

		
func handle_click():
	queue_free()
