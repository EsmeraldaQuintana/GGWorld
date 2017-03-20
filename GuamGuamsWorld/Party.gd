# Global party singleton.

extends Node

# party is just a list of Pokemon
var party = []

# This creates a pokemon 'type' (like any Squirtle).
# This could be outsourced to a database of some kind. Hmmm.
func createPokemon(inName, inType, inFrontSprite, inBackSprite):
	return {Name = inName, Type = inType, frontSprite = load(inFrontSprite), backSprite = load(inBackSprite)}

# This creates an instance of a Pokemon. (This is *MY* Squirtle).
func createPokemonInstance(inPokeType, inTotalHP, inCurrentHP):
	return {PokeType = inPokeType, TotalHP = inTotalHP, CurrentHP = inCurrentHP}