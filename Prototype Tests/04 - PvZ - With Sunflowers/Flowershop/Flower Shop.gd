extends Node2D

var slots
var selected_plant
var plants

func _ready():
	slots = get_node("Slots").get_children()
	selected_plant = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Slot_got_clicked(slot):
	# just select that one that got clicked on
	deselect_all_slots()
	slot.is_selected = true
	
	for i in range(0, slots.size()):
		if slots[i].is_selected:
			selected_plant = plants[i]

func deselect_all_slots():
	for slot in slots:
		slot.is_selected = false
	selected_plant = null	