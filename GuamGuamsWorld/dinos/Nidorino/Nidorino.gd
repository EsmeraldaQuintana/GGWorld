extends "res://dinos/dino.gd".Dino

var frontSprite = preload("res://dinos/Nidorino/nidrorino.png")
func _init():
	totalHP = 100
	name = "Nidorino"

func _ready():
	set_texture(frontSprite)
	print(name)
	pass
