extends Patch9Frame

# location in party 
var spot = 0 
# spot of selection [1-5]
var selected

func _ready():
	set_process_input(true)
	selected = get_node("team/spot_selected")

# Do stuff on an event 
func _input(event):
		# if the event is a key that is pressed
		if event.type == InputEvent.KEY && event.pressed:
			# if were are in the 1st position 
			if (Input.is_action_pressed("ui_up")):
				if (spot == 0): 
					get_node("team/Spot[0]_select").set_hidden(true)
					get_node("team/Cancel_selected").set_hidden(false)
					spot = 5 
				elif (spot == 1):
					get_node("team/spot_selected").set_hidden(true)
					get_node("team/Spot[0]_select").set_hidden(false)
				
			if (Input.is_key_pressed(KEY_DOWN)):
				if (spot == 0):
					get_node("team/Spot[0]_select").set_hidden(true)
					get_node("team/spot_selected").set_hidden(false)
					spot = 1
				
				elif (spot == 1):
					get_node("team/spot_selected").set_hidden(true)
					get_node("team/Spot[0]_select").set_hidden(false)
					spot = 0
				
			if (Input.is_key_pressed(KEY_ESCAPE)):
				get_tree().change_scene("res://overworld/overworld.tscn")

