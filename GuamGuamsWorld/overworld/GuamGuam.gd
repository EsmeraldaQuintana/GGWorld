extends Sprite

var name 
var attack_mode = false 

func _ready():
	name = Party.party[0].name
	pass

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
