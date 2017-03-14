extends "res://dinos/dino.gd".Dino


var frontSprite = preload("res://dinos/Squirtle/frontSprite.png")
func _init():
	totalHP = 100
	name = "Squirtle"

func _ready():
	set_texture(frontSprite)
	print(name, " loaded into scene")
	pass

