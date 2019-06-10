extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").text = "Level 1, highscore: " + str(get_node("/root/globals").high_score)
	get_node("/root/globals").high_score += 1
	get_node("/root/globals").save()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
