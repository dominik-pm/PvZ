extends Node2D

var has_plant = false

func _ready():
	pass
	
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
		var plant = get_parent().get_parent().get_parent().get_parent().get_selected_plant()
		set_plant(plant)
		print("tile: clicked")
