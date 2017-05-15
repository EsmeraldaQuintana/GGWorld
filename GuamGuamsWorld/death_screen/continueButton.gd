# attached to res://title_screen/titleScreen.tscn: background -> startButton
# attached to res://death_screen/Death_screen.tscn: TextureFrame -> continue button

extends TextureButton

func _ready():
	pass

func _pressed():
	var starter = Party.createDinoInstance(255, 20, 20)
	Party.party.append(starter)
	Party.party[0].CurrentHP = 20
	
	get_tree().change_scene("res://overworld/overworld.tscn")
	