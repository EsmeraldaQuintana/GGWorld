#
# attached to fireball.tscn parent node fire_ball
# This script is attached to every single fireball spawned! Yay!
#

extends KinematicBody2D

var _movement
var damage = 10

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