extends MenuButton

func _ready():
	pass

func _pressed():
	get_node("pause_menu").hide()
	get_tree().set_pause(false)