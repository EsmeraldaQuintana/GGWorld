# This represents the OTHER Pokemon in the battle scene.
# Right now, it's hardcoded in as Squirtle. Let's change this.

extends "res://dinos/dino.gd".Dino

func _ready():
	# Picks random pokemon from dictionary.
	var possibleNums = DinoDictionary.pokedex.keys()
	var i = randi() % possibleNums.size()
	var otherPokemon = Party.createPokemonInstance(possibleNums[i], 20, 20)
	set_texture(otherPokemon.frontSprite)
	print(otherPokemon.name, " loaded into scene")
