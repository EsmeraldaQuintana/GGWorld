# Global party singleton.

extends Node

# party is just a list of Pokemon
var party = []

# This creates an instance of a Pokemon. (This is *MY* Squirtle).
func createDinoInstance(inNum, inTotalHP, inCurrentHP):
	var species = DinoDictionary.dinodex[inNum]
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