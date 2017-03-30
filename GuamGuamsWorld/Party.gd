# Global party singleton.

extends Node

# party is just a list of Pokemon
var party = []

# This creates a pokemon 'type' (like any Squirtle).
# This could be outsourced to a database of some kind. Hmmm.
func createPokemon(inName, inType, inFrontSprite, inBackSprite):
	return {Name = inName, Type = inType, frontSprite = load(inFrontSprite), backSprite = load(inBackSprite)}

# This creates an instance of a Pokemon. (This is *MY* Squirtle).
func createPokemonInstance(inNum, inTotalHP, inCurrentHP):
	var species = DinoDictionary.pokedex[inNum]
	return {
		name = species["Name"],
		TotalHP = inTotalHP,
		CurrentHP = inCurrentHP,
		frontSprite = load("res://dinos/" + species["Name"] + "/frontSprite.png"),
		backSprite = load("res://dinos/" + species["Name"] + "/backSprite.png"),
		type = species["Type"],
		num = inNum,
		attack = species["Attack"]
	}