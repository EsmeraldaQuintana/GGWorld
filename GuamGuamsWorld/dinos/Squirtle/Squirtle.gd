extends "res://dinos/dino.gd".Dino


class Squirtle extends "res://dinos/dino.gd".Dino:
	
	var frontSprite = preload("res://dinos/Squirtle/frontSprite.png")
	
	func _init():
		totalHP = 50
		name = "Squirtle"


func _ready():
	var squirt = Squirtle.new()
	print(squirt.name)
	pass
