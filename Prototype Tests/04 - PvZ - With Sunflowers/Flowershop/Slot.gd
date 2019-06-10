extends Node2D

signal got_clicked

var is_selected
export var plant = 0

func _ready():
	is_selected = false

func _process(delta):
	if is_selected:
		get_node("Highlight").visible = true
	else:
		get_node("Highlight").visible = false


func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT):
		#is_selected = true # send a signal to flowershop to handle that
		emit_signal("got_clicked", self)
