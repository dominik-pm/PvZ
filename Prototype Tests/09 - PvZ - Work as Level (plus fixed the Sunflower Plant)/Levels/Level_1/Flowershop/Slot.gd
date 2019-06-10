extends Node2D

signal select_plant

var is_selected
var plant

var on_cooldown
export var cooldown = 10
var timer_cooldown = cooldown
var reduction = 0.05

var cooldown_background
var cnt = 0

func _ready():
	cooldown_background = get_node("Cooldown").get_child(0)
	
	is_selected = false
	on_cooldown = true
	
	# connect the select plant signal to the flower shop
	self.connect("select_plant", get_parent(), "_on_Slot_select_plant")

func _process(delta):
	# cooldown
	if (timer_cooldown <= 0):
		on_cooldown = false
		#pass
	else:
		timer_cooldown -= reduction
		
	# show cooldown
	if on_cooldown:
		get_node("Cooldown").visible = true
		get_node("Highlight").visible = false
	else:
		get_node("Cooldown").visible = false
		
	# animate cooldown --_!_!_!_!_!_--_!_!_!_!_
	# scale y from 0 to 1
	# move y from 0 to 50
	
	#cnt+=0.01
	#var y = ((sin(cnt)+1)/2)*50
	#var scale_y = (sin(cnt)+1)/2
	#cooldown_background.transform.origin.y = y
	#cooldown_background.transform.scaled(Vector2(0, scale_y)
	#print(cooldown_background.transform.get_scale())
	
	# highlight toggle
	if is_selected:
		get_node("Highlight").visible = true
	else:
		get_node("Highlight").visible = false

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		if (!is_selected and !on_cooldown):
			emit_signal("select_plant", self)

func got_planted():
	print("slot: flower got planted, cooldown reseted")
	is_selected = false
	on_cooldown = true
	timer_cooldown = cooldown
	
func set_plant(p):
	plant = p