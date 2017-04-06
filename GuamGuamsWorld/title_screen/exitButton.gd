# attached to res://death_screen/Death_Screen.tscn : TextureFrame -> exit button
# attached to res://title_screen/titleScreen.tscn : background -> exit Button

extends TextureButton

func _ready():
	pass

func _pressed():
	get_tree().quit()