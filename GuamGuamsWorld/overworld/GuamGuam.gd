extends KinematicBody2D

var name 
var ChatBox
var attack_mode = false 

func _ready():
	set_fixed_process(true)
	print("In GuamGuam ready")
	name = Party.party[0].name
	interact()

func _fixed_process(delta):
	#move(Vector2(0,-1))
	if (is_colliding()):
		var other = get_collider()
		#other.queue_free()
		print("You touched the GuamGuam!")

	
func interact():
	print("In GuamGuam interact")

	
func transform():
	if (name == "Torchic"):
		#switch into attack mode 
		attack_mode = true
		#swap sprite sheet 
	if (name == "Bulbasuar"):
		#switch into attack mode 
		attack_mode = true
		#swap sprite sheet 
	if (name == "Bulbasuar"):
		#switch into attack mode 
		attack_mode = true
		#swap sprite sheet 
