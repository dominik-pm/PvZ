extends Node2D

func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

func _on_Button_button_up():
	var currentLevel = get_node("/root/globals").currentLevel
	get_node("/root/globals").setScene("res://Levels/Level_"+str(currentLevel)+"/Main.tscn")