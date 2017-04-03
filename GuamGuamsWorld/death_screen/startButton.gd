# copied from Title Screen!

extends TextureButton

func _ready():
	pass

# continue is kind of broken without save states
# this will load a new game
# starts party with a Torchic (#255) loads in overworld.tscn...
# need to implement save states soon so this button isn't worthless.
func _pressed():
	var starter = Party.createDinoInstance(255, 20, 20)
	Party.party.append(starter)
	get_tree().change_scene("res://overworld/overworld.tscn")