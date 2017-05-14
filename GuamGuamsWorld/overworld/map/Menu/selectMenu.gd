extends TextureFrame

#Variables of menu openness and use
var menu = false
var open = false

#Direction variables for pointer
var up = false
var down = false

var inSwappe = true
var inSwapper = false  

var ready = false 

#Variable of what option you're on
var currentLabel = 0
var container
var labels
var swappe
var swapper
var tempMon

#Location of arrow
var pointer

#Sprite for the player if transformed
var pSprite 

func _ready():
	print("in selectMenu")
	set_process_unhandled_key_input(true)
	set_fixed_process(true)
	container = get_node("/root/Pokemon/team/Message_box/Container")
	labels = get_node("/root/Pokemon/team/Message_box/Container").get_children()
	pointer = get_node("/root/Pokemon/team/Message_box/Arrow")
	pSprite = get_node("/root/overworld/")
	#get_tree().set_pause(true)

#If the menu is open continue executing
func _fixed_process(delta):
	if open:
		#If the interact button is pressed go to the option pressed
		if Input.is_action_pressed("ui_interact"):
			#get_tree().set_pause(false)
			container.set_hidden(false)
			pointer.set_hidden(false)
			_handle_interaction()
		
		if up:
			if currentLabel == 0:
				currentLabel = labels.size() - 1
			else:
				currentLabel = currentLabel - 1
			_move_arrow()
			print(currentLabel)
			
		if down:
			if currentLabel == labels.size() - 1:
				currentLabel = 0
			else:
				currentLabel = currentLabel + 1
			_move_arrow()
			print(currentLabel)
			
	up = false 
	down = false
			
#Check which label the arrow is currently pointing at and execute appropriately
func _handle_interaction():
	if open:
		if currentLabel == 0:
			print("summary")
		elif currentLabel == 1:
			#inSwappe = true
			container.set_hidden(true)
			pointer.set_hidden(true)
			get_node("/root/Pokemon/team/Message_box").set_text("Swap with who")
			get_node("/root/Pokemon").selecting = true
			 
			# if they press enter after choosing swap 
			if Input.is_action_pressed("ui_interact"):
				getSwapSpots()
				if ready:
					doSwap()
					get_tree().change_scene("res://overworld/map/Menu/Pokemon.tscn")
			open = false
			print("swap")
		elif currentLabel == 2:
			get_node("/root/Pokemon/team/Message_box").set_text("Maybe one day")
			print("item")
		elif currentLabel == 3:
			container.set_hidden(true)
			pointer.set_hidden(true)
			#get_tree().set_pause(false)
			get_tree().change_scene("res://overworld/map/Menu/Pokemon.tscn")
			print("cancel")

func getSwapSpots():
	if inSwappe:
		swappe = get_node("/root/Pokemon").spot
		print("swappe = " + str(swappe))
		inSwappe = false
		inSwapper = true 
	elif inSwapper:
		swapper = get_node("/root/Pokemon").spot
		print("swappe = " + str(swappe))
		print("swapper = " + str(swapper))
		inSwapper = false
		ready = true
		
func doSwap():
	if Party.party[swappe] != null && Party.party[swapper] != null:
		for i in range (0, Party.party.size()):
			if get_node("/root/Pokemon").spot == i:
				tempMon = Party.party[swappe] 
				Party.party[swappe] = Party.party[swapper]
				Party.party[swapper] = tempMon
				#if get_node("/root/overworld/")
	else:
		print("cant swap null referances")
	
func _unhandled_key_input(key_event):
	if open:
		if key_event.is_action_pressed("ui_menu"):
			menu = true
		elif key_event.is_action_released("ui_menu"):
			menu = false
		elif key_event.is_action_pressed("ui_down"):
			down = true
		elif key_event.is_action_released("ui_down"):
			down = false
		elif key_event.is_action_pressed("ui_up"):
			up = true
		elif key_event.is_action_released("ui_up"):
			up = false
			
func _move_arrow():
	pointer.set_global_pos(Vector2(pointer.get_global_pos().x, labels[currentLabel].get_global_pos().y+8))

func _open_menu():
	#get_tree().set_pause(true)
	open = true 
	print("menu open")