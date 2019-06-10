extends Node2D

var slots = []
var selected_plant # rework this

func _ready():
	for child in get_children():
		if child.is_in_group('Slot'):
			slots.push_front(child)

# --- called from main ---

# determine which plants are useable as slots in the shop
func set_plants(plants):
	for i in range(0, slots.size()):
		slots[i].set_plant(plants[i])

# when the selected flower has been planted
func planted_selected():
	selected_plant = null # rework
	
	for i in range(0, slots.size()):
		if slots[i].is_selected:
			slots[i].got_planted()
# --- ---


# --- signal called functions ---
func get_selected_plant():
	for i in range(0, slots.size()):
		if slots[i].is_selected:
			return slots[i].plant
	return null	
	
func _on_Slot_select_plant(slot):
	# just select that one that got clicked on
	deselect_all_slots()
	slot.is_selected = true
	selected_plant = slot.plant
	#print(str(slot.plant))
# --- ---

func deselect_all_slots():
	for slot in slots:
		slot.is_selected = false
	#selected_plant = null
