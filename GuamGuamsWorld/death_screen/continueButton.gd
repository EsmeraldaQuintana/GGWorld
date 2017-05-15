# attached to res://title_screen/titleScreen.tscn: background -> startButton
# attached to res://death_screen/Death_screen.tscn: TextureFrame -> continue button

extends TextureButton

func _ready():
	pass

func _pressed():
	print("continueButton.gd is in _pressed()!")
	var starter = Party.createDinoInstance(255, 20, 20)
	Party.party.append(starter)
	Party.party[0].CurrentHP = 20
	# IF YOU SEE THIS: this was the correct way, I think to handle the death reset.
	# I can't figure it out, so it's going in a disgusting global variable!
	#var Overworldgd = preload("res://overworld/Overworld.gd")
	#print("continueButton.gd: preload ended! ", Overworldgd)
	#Overworldgd.death = true
	global.death = true
	print("set global.death to ", global.death)
	get_tree().change_scene("res://overworld/overworld.tscn")
	