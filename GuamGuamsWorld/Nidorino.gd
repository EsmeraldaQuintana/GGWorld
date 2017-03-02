extends "res://dinos/dino.gd".Dino


func _init():
	totalHP = 100
	name = "Nidorino"

func _ready():
	set_texture(frontSprite)
	print(name)
	pass
