extends Node2D

var lanes
var plant1

func _ready():
	lanes = get_node("Lanes").get_children()
	plant1 = preload("res://Plant.tscn")

func _process(delta):
	pass
	
func get_selected_plant():
	return plant1.instance()
