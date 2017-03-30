# This represents the OTHER Pokemon in the battle scene.
# Right now, it's hardcoded in as Squirtle. Let's change this.

extends "res://dinos/dino.gd".Dino

func _ready():
	var otherPokemon = Party.createPokemonInstance(7, 20, 20)
	set_texture(otherPokemon.frontSprite)
	print(otherPokemon.name, " loaded into scene")
