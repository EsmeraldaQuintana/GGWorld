extends TextureButton

func _ready():
	pass

func _pressed():
	var starter = Party.createDinoInstance(255, 20, 20)
	Party.party.append(starter)
	get_tree().change_scene("res://overworld/overworld.tscn")