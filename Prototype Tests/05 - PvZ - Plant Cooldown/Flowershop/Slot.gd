extends Node2D

signal select_plant

var is_selected
export var plant = 0

var on_cooldown
export var cooldown = 10
var timer_cooldown = cooldown
var reduction = 0.05

func _ready():
	is_selected = false
	on_cooldown = true
	
	# connect the select plant signal to the flower shop
	self.connect("select_plant", get_parent(), "_on_Slot_select_plant")

func _process(delta):
	# cooldown
	if (timer_cooldown <= 0):
		on_cooldown = false
	else:
		timer_cooldown -= reduction
		
	# show cooldown
	if on_cooldown:
		get_node("Cooldown").visible = true
		get_node("Highlight").visible = false
	else:
		get_node("Cooldown").visible = false
		
		# highlight toggle
		if is_selected:
			get_node("Highlight").visible = true
		else:
			get_node("Highlight").visible = false

func reset_cooldown():
	print("slot: cooldown reseted")
	on_cooldown = true
	is_selected = false
	timer_cooldown = cooldown

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		if (!is_selected):
			emit_signal("select_plant", self)
