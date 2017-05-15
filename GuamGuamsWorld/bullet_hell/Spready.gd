#
# this script is listed in moveDatabase.csv l2
#

extends KinematicBody2D

var _movement
var damage = 5

func shoot(directional_force):
	_movement = directional_force
	set_fixed_process(true)
	
func _fixed_process(delta):
	move(_movement)
	#f (typeof(get_collider()) == TYPE_OBJECT and get_collider().has_node("Interact")):
		#print("IDK LOL");
	if (is_colliding()):
	#	self.free()
		self.destroy()

func destroy():
	queue_free()


# ===== CODE GRAVEYARD
# typeof(get_collider()) == TYPE_OBJECT and 