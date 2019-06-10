extends Node

# -- IMPORTANT --
# this script is accessible by all nodes
# get_node("/root/globals") to get this script

var currentLevel = 1


# save game record
var high_score = 0
var savegame = File.new() #file
var save_path = "user://savegame.save" #place of the file (recommended, but in %appdata% - godot - ...)
#var save_path = "res://savegame.save" #place of the file (not recommended)
var save_data = {"highscore": high_score} #variable to store data


func _ready():
	setScene("/Menu_Scene.tscn")
	
	# create a savegame file if not already created
	if not savegame.file_exists(save_path):
		create_save()
	# read from a savegame file
	high_score = read_savegame()

# global function to set a scene - get_node("/root/globals").setScene("res://Levels/Level_1.tscn")
func setScene(scene_path):
	get_tree().change_scene(scene_path)

# -- save game record: --

func create_save():
	savegame.open(save_path, File.WRITE)
	savegame.store_var(save_data)
	savegame.close()

# to save data to the savegame file (maybe as arguments: key, value)
func save():
   save_data["highscore"] = high_score #data to save
   savegame.open(save_path, File.WRITE) #open file to write
   savegame.store_var(save_data) #store the data
   savegame.close() # close the file

# to get a specific data from the savegame file (maybe as arguments: data)
func read_savegame():
   savegame.open(save_path, File.READ) #open the file
   save_data = savegame.get_var() #get the value
   savegame.close() #close the file
   return save_data["highscore"] #return the value

# -- --