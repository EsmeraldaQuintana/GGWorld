# attached to dino.tscn -> frontSprite

extends Sprite

class Dino extends Sprite:
	var totalHP = 100
	var currentHP = 100
	var name
	var attacks
	var type

func _ready():
	pass
	
#func _currentHP():
#	return 20
#	# HOW DOES THIS WORK I'M RETARDED