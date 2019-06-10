extends Node2D

signal clicked

var has_plant = false

func _ready():
	# connect clicked signal to the lane
	self.connect("clicked", get_parent().get_parent(), "_on_tile_clicked")
	
#func _process(delta):
	#pass

func set_plant(plant):
	if !has_plant:
		add_child(plant)
		has_plant = true;
		print('tile: plant set on tile')
	else:
		print('tile: plant already set on this tile')


func _on_Area2D_input_event(viewport, event, shape_idx):
	# check if the left mouse button is clicked on the area
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		emit_signal("clicked", self)
		#var plant = get_parent().get_parent().get_parent().get_parent().get_selected_plant()
		#if plant != null:
			#set_plant(plant)
			#print("tile: clicked")

func set_zombies_in_lane(are_zombies_in_lane):
	if has_plant:
		get_child(get_child_count()-1).zombie_in_lane = are_zombies_in_lane;