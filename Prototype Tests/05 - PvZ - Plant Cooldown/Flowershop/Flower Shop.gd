extends Node2D

var slots = []
var selected_plant
var plants

func _ready():
	for child in get_children():
		if child.is_in_group('Slot'):
			slots.push_front(child)
	selected_plant = null
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Slot_select_plant(slot):
	if (slot.on_cooldown == false):
		# just select that one that got clicked on
		deselect_all_slots()
		slot.is_selected = true
	
		for i in range(0, slots.size()):
			if slots[i].is_selected:
				selected_plant = plants[i]

func flower_planted():
	for i in range(0, slots.size()):
		if slots[i].is_selected:
			slots[i].reset_cooldown()

func deselect_all_slots():
	for slot in slots:
		slot.is_selected = false
	selected_plant = null
