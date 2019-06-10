extends Node2D

export var speed = 50
var final_y
var worldspawn = false

signal got_sunflower

func _ready():
	visible = false
	
	var spawner = get_parent()
	self.connect("got_sunflower", spawner, "_on_Sunflower_got_sunflower")
	
	connect("got_sunflower", self, "handle_click")

func _process(delta):
	# rain down if it got initialized as a worldspawn
	if worldspawn:
		if transform.origin.y < final_y:
			transform.origin.y += (speed * delta)

# --- called initializing functions ---
func spawn_fromWorld(x_from, x_to, y_from, y_to):
	visible = true
	worldspawn = true
	randomize()
	var y = -10
	var x = rand_range(x_from, x_to)
	final_y = rand_range(y_from, y_to)
	transform.origin.x = x
	transform.origin.y = y

func spawn_fromPlant(xOff, yOff):
	visible = true
	transform.origin.x += xOff
	transform.origin.y += yOff
# ---  ---

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		print('sunflower: :)')
		emit_signal("got_sunflower")

func handle_click():
	queue_free()