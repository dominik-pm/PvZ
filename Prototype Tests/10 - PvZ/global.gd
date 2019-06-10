extends Node

# -- IMPORTANT --
# this script is accessible by all nodes
# get_node("/root/globals") to get this script

var currentLevel = 1

func _ready():
	setScene("/Menu_Scene.tscn")

# global function to set a scene - get_node("/root/globals").setScene("res://Levels/Level_1.tscn")
func setScene(scene_path):
	get_tree().change_scene(scene_path)