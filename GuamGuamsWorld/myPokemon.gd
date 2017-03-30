# This represents YOUR Pokemon in the battle scene.
# Loads its back sprite and places it in the scene.

extends "res://dinos/dino.gd".Dino

func _ready():
	if Party.party.size() == 0:
		Party.party.append(Party.createPokemonInstance(255, 20, 20))
	var myPokemon = Party.party[0]
	set_texture(myPokemon.backSprite)
	print(myPokemon.name, " loaded into scene")
	pass
