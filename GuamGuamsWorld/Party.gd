extends Node

var party = []

func createPokemon(inName, inType, inFrontSprite, inBackSprite):
	return {Name = inName, Type = inType, frontSprite = inFrontSprite, backSprite = inBackSprite}

func createPokemonInstance(inPokeType, inTotalHP, inCurrentHP):
	return {PokeType = inPokeType, TotalHP = inTotalHP, CurrentHP = inCurrentHP}