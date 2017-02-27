extends TileMap

func _ready():
	self.set_process(true)
	
func _process(delta):
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().set_pause(true)
		get_node("pause_menu").show()


#func _pause():
#		get_tree().set_pause(true)
#		get_node("pause_menu").show()
	
#func _unpause():
#   	get_node("pause_menu").hide()
#   	get_tree().set_pause(false)
