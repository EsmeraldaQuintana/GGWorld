extends "res://dinos/dino.gd".Dino

func _ready():
	var otherPokeType = Party.createPokemon("Squirtle", "Water", "res://dinos/Squirtle/frontSprite.png", "res://dinos/Squirtle/backSprite.png")
	var otherPokemon = Party.createPokemonInstance(otherPokeType, 20, 20)
	set_texture(otherPokemon.PokeType.frontSprite)
	print(otherPokemon.PokeType.Name, " loaded into scene")