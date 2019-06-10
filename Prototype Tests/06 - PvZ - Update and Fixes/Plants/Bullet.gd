extends Node2D

export var shooting_speed = 400
export var damage = 2

func _ready():
	print('bullet: shooting!')

func _process(delta):
	# move the bullet forward
	transform.origin.x += (shooting_speed * delta)
	
	# check if the bullet is out of frame (then delete it)
	if transform.origin.x > 900:
		queue_free()


func _on_Area2D_body_entered(body):
	# check if the bullet hits a zombie
	if body.is_in_group('Zombie'):
		print('bullet: hit zombie!')
		
		body.get_hit(damage)	# call the get_hit function of the zombie
		
		queue_free()			# delete the bullet