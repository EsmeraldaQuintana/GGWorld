#
# this script is listed in moveDatabase.csv l2
#

extends KinematicBody2D

var _movement

func shoot(directional_force):
	_movement = directional_force
	set_fixed_process(true)
	
func _fixed_process(delta):
	move(_movement)
	#if (get_collider() != ):
	#	self.free()
	#	self.destroy()

#func destroy():
#	queue_free()