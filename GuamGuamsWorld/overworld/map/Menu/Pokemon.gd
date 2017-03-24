extends Patch9Frame

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	set_process_unhandled_input(true)
	set_process_unhandled_key_input(true)
	
func _fixed_process(delta):
	if (Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().change_scene("res://overworld/overworld.tscn")
		
func _unhandled_input(event):
   print(str("An event was unhandled ",event))