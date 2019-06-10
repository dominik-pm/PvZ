extends Node2D

signal select_plant

var is_selected
var enough_sunflowers = false
var plant

# Timer
var timer = null
var on_cooldown
#var timer_cooldown = cooldown
#var reduction = 0.05

var cooldown_background
var cnt = 0

func _ready():
	cooldown_background = get_node("Cooldown").get_child(0)
	
	is_selected = false
	on_cooldown = true
	
	# Timer
	timer = Timer.new()
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	# (timer gets started when the plant is added to the slot
	
	# connect the select plant signal to the flower shop
	self.connect("select_plant", get_parent(), "_on_Slot_select_plant")

func on_timeout_complete():
	on_cooldown = false

func _process(delta):
	# cooldown
	#if (timer_cooldown <= 0):
		#on_cooldown = false
		#pass
	#else:
		#timer_cooldown -= reduction
		
	# show cooldown
	if on_cooldown or !enough_sunflowers:
		get_node("Cooldown").visible = true
		get_node("Highlight").visible = false
	else:
		get_node("Cooldown").visible = false
	
	
	# animate cooldown --_!_!_!_!_!_--_!_!_!_!_ (maybe just with animation, not manually)
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
	
	# check if there are enough sunflowers
	var main = get_node("/root/Main")
	if (main.sunflowers >= plant.instance().price):
		enough_sunflowers = true
	else:
		enough_sunflowers = false

func _on_Area2D_input_event(viewport, event, shape_idx):
	# if this slot got clicked on
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		# check if it isn't already selected and not on cooldown
		if (!is_selected and !on_cooldown and enough_sunflowers):
			emit_signal("select_plant", self)

func got_planted():
	# if this slot's plant got planted, deselect this slot and reset the cooldown
	print("slot: flower got planted, cooldown reseted")
	is_selected = false
	on_cooldown = true
	timer.start()
	#timer_cooldown = cooldown
	
func set_plant(p):
	# this function is called in the beginning to give this slot a plant
	plant = p
	
	# start the timer and give it the wait time of the plants cooldown
	var cooldown = plant.instance().cooldown
	timer.wait_time = cooldown
	timer.start()	