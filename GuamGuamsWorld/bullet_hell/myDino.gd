# This represents YOUR Pokemon in the battle scene.
# Loads its back sprite and places it in the scene.

extends "res://dinos/dino.gd".Dino

func _ready():
	print(Party.party.size())
	if Party.party.size() == 0:
		Party.party.append(Party.createDinoInstance(255, 20, 20))
	var myDino = Party.party[0]
	set_texture(myDino.backSprite)
	print(myDino.name, " loaded into scene")
	pass
