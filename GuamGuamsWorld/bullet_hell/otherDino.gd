#
# attached to BulletHell.tscn -> battleArena -> otherPokemon
# This represents the OTHER Pokemon in the battle scene.
# Currently, it picks a random Dino 

extends "res://dinos/dino.gd".Dino

var otherDino

func _ready():
	# Picks random pokemon from dictionary.
	var possibleNums = DinoDictionary.dinodex.keys()
	var i = randi() % possibleNums.size()
	otherDino = Party.createDinoInstance(possibleNums[i], 20, 20)
	Party.fighting = otherDino
	set_texture(otherDino.frontSprite)
	#print(otherDino.name, " loaded into scene")
