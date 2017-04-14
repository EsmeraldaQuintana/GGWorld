extends Patch9Frame

# location in party 
var spot = 0 
# spot of selection [1-5]
var selected
# shield your eyes (DIRTY)
# all the nodes I use 
var level_0
var name_0
var mon_0 
var HP_0
var level_1
var name_1
var mon_1 
var HP_1
var level_2
var name_2
var mon_2 
var HP_2
var level_3
var name_3
var mon_3 
var HP_3
var level_4
var name_4
var mon_4 
var HP_4
var level_5
var name_5
var mon_5 
var HP_5

func _ready():
	print("in ready")
	set_process_input(true)
	selected = get_node("team/spot_selected")
	level_0 = get_node("team/Spot[0]/Level_0")
	level_1 = get_node("team/Spot[1]/Level_1")
	level_2 = get_node("team/Spot[2]/Level_2")
	level_3 = get_node("team/Spot[3]/Level_3")
	level_4 = get_node("team/Spot[4]/Level_4")
	level_5 = get_node("team/Spot[5]/Level_5")
	name_0 = get_node("team/Spot[0]/Name_0")
	name_1 = get_node("team/Spot[1]/Name_1")
	name_2 = get_node("team/Spot[2]/Name_2")
	name_3 = get_node("team/Spot[3]/Name_3")
	name_4 = get_node("team/Spot[4]/Name_4")
	name_5 = get_node("team/Spot[5]/Name_5")
	HP_0 = get_node("team/Spot[0]/HP_0")
	HP_1 = get_node("team/Spot[1]/HP_1")
	HP_2 = get_node("team/Spot[2]/HP_2")
	HP_3 = get_node("team/Spot[3]/HP_3")
	HP_4 = get_node("team/Spot[4]/HP_4")
	HP_5 = get_node("team/Spot[5]/HP_5")
	mon_0 = get_node("team/Spot[0]/Mon[0]")
	mon_1 = get_node("team/Spot[1]/Mon[1]")
	mon_2 = get_node("team/Spot[2]/Mon[2]")
	mon_3 = get_node("team/Spot[3]/Mon[3]")
	mon_4 = get_node("team/Spot[4]/Mon[4]")
	mon_5 = get_node("team/Spot[5]/Mon[5]")
	_assign()
	
	
func _assign():
	print("assignment")
	level_0.set_text("1")
	level_1.set_text("1")
	level_2.set_text("1")
	level_3.set_text("1")
	level_4.set_text("1")
	level_5.set_text("1")
	name_0.set_text("Torchic")
	name_1.set_text("Squirt")
	name_2.set_text("Ivy")
	name_3.set_text("")
	name_4.set_text("")
	name_5.set_text("")
	HP_0.set_text("100  100")
	HP_1.set_text("")
	HP_2.set_text("")
	HP_3.set_text("")
	HP_4.set_text("")
	HP_5.set_text("")

# Do stuff on an event 
func _input(event):
		# if the event is a key that is pressed
		if event.type == InputEvent.KEY && event.pressed:
			# if were are in the 1st position 
			if (Input.is_action_pressed("ui_up")):
				if (spot == 0): 
					get_node("team/Spot[0]_select").set_hidden(true)
					get_node("team/Cancel_selected").set_hidden(false)
					spot = 6 
					print(spot)
				elif (spot == 1):
					get_node("team/spot_selected").set_hidden(true)
					get_node("team/Spot[0]_select").set_hidden(false)
					spot = 0
					print(spot)
				elif (spot == 2):
					spot = 1
					print(spot)
				elif (spot == 3):
					spot = 2
					print(spot)
				elif (spot == 4):
					spot = 3
					print(spot)
				elif (spot == 5):
					spot = 4
					print(spot)
				elif (spot == 6):
					get_node("team/Cancel_selected").set_hidden(true)
					spot = 5
					print(spot)
				
			if (Input.is_key_pressed(KEY_DOWN)):
				if (spot == 0):
					get_node("team/Spot[0]_select").set_hidden(true)
					get_node("team/spot_selected").set_hidden(false)
					spot = 1
					print(spot)
				
				elif (spot == 1):
					get_node("team/spot_selected").set_hidden(true)
					#get_node("team/Spot[0]_select").set_hidden(false)
					spot = 2
					print(spot)
					
				elif (spot == 2):
					spot = 3
					print(spot)
					
				elif (spot == 3):
					spot = 4
					print(spot)
					
				elif (spot == 4):
					#get_node("team/Spot[5]").set_texture(load("res://overworld/map/Menu" + Selected.tex))
					spot = 5
					print(spot)
					
				elif (spot == 5):
					spot = 6
					get_node("team/Cancel_selected").set_hidden(false)
					print(spot)
					
				elif (spot == 6):
					spot = 0
					get_node("team/Cancel_selected").set_hidden(true)
					get_node("team/Spot[0]_select").set_hidden(false)
					print(spot)
					
			if (Input.is_action_pressed("ui_interact")):
				if (spot == 0):
					#change label swap
					print("swap to 0")
				elif (spot == 1):
					print("swap to 1")
				elif (spot == 2):
					print("swap to 2")
				elif (spot == 3):
					print("swap to 3")
				elif (spot == 4):
					print("swap to 4")
				elif (spot == 5):
					print("swap to 5")
				elif (spot == 6):
					get_tree().change_scene("res://overworld/overworld.tscn")
					
			if (Input.is_key_pressed(KEY_ESCAPE)):
				get_tree().change_scene("res://overworld/overworld.tscn")

