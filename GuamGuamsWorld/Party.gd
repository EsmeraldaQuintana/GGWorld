extends Node

var party = []

func createPokemon(inName, inType, inFrontSprite, inBackSprite):
	return {Name = inName, Type = inType, frontSprite = load(inFrontSprite), backSprite = load(inBackSprite)}

func createPokemonInstance(inPokeType, inTotalHP, inCurrentHP):
	return {PokeType = inPokeType, TotalHP = inTotalHP, CurrentHP = inCurrentHP}