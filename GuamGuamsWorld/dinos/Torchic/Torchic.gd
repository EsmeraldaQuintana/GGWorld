extends "res://dinos/dino.gd".Dino


var frontSprite = preload("res://dinos/Torchic/frontSprite.png")
func _init():
	totalHP = 100
	name = "Torchic"

func _ready():
	set_texture(frontSprite)
	print(name)
	pass
