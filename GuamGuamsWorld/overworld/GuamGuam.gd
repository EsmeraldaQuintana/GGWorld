extends KinematicBody2D

var name 
var ChatBox
var attack_mode = false 

func _ready():
	set_fixed_process(true)
	print("In GuamGuam ready")
	interact()

func _fixed_process(delta):
	#move(Vector2(0,-1))
	if (is_colliding()):
		var other = get_collider()
		#other.queue_free()
		print("You touched the GuamGuam!")

	
func interact():
	print("In GuamGuam interact")

