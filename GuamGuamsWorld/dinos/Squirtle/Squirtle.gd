extends "res://dinos/dino.gd".Dino

var frontSprite = load("/frontSprite.png")

class Squirtle extends "res://dinos/dino.gd".Dino:
	
	
	func _init():
		totalHP = 50
		name = "Squirtle"
		

func _ready():
	var squirt = Squirtle.new()
	squirt.set_texture(frontSprite)
	print(squirt.name)
	pass
