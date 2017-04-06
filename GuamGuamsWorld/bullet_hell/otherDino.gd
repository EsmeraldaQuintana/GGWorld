#
# attached to BulletHell.tscn -> battleArena -> otherPokemon
# This represents the OTHER Pokemon in the battle scene.
# Right now, it's hardcoded in as Squirtle. Let's change this.

extends "res://dinos/dino.gd".Dino

func _ready():
	# Picks random pokemon from dictionary.
	var possibleNums = DinoDictionary.dinodex.keys()
	var i = randi() % possibleNums.size()
	var otherDino = Party.createDinoInstance(possibleNums[i], 20, 20)
	set_texture(otherDino.frontSprite)
	print(otherDino.name, " loaded into scene")
