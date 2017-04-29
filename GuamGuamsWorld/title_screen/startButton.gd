# attached to res://title_screen/titleScreen.tscn: background -> startButton
# attached to res://death_screen/Death_screen.tscn: TextureFrame -> continue button

extends TextureButton

func _ready():
	pass

func _pressed():
	if (Party.party.size() == 0):
		var starter = Party.createDinoInstance(255, 20, 20)
		Party.party.append(starter)
	get_tree().change_scene("res://overworld/overworld.tscn")