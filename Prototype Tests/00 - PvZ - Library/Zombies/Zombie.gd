extends Node2D

export var speed = 0.25
var health = 10

func _ready():
	pass # Replace with function body.

func _process(delta):
	transform.origin.x -= speed
	
	# check if the zombie dies
	if health <= 0:
		queue_free() #there should be a animation but ok

# function to get hit
func get_hit(damage):
	health -= damage
	print('zombie: got hit! ' + str(health) + ' health left.')

# i dont need that right now but it works :), (somehow doesn't work in bullet, i think because it is a child of the plant)
func _on_Zombie_body_entered(body):
	#print('zombie: got hit!')
	pass
