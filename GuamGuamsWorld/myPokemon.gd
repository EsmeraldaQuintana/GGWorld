# This represents YOUR Pokemon in the battle scene.
# Loads its back sprite and places it in the scene.

extends "res://dinos/dino.gd".Dino

func _ready():
	var myPokemon = Party.party[0]
	set_texture(myPokemon.PokeType.backSprite)
	print(myPokemon.PokeType.Name, " loaded into scene")
	pass
