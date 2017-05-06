extends TextureFrame

#Variables of menu openness and use
var menu = false
var open = true

#Direction variables for pointer
var up = false
var down = false

#Variable of what option you're on
var currentLabel = 0
var container
var labels

#Location of arrow
var pointer

func _ready():
	print("in selectMenu")
	set_process_unhandled_key_input(true)
	set_fixed_process(true)
	container = get_node("/root/Pokemon/team/Message_box/Container")
	labels = get_node("/root/Pokemon/team/Message_box/Container").get_children()
	pointer = get_node("/root/Pokemon/team/Message_box/Arrow")

#If the menu is open continue executing
func _fixed_process(delta):
	if open:
		
		#If the interact button is pressed go to the option pressed
		if Input.is_action_pressed("ui_interact"):
			_handle_interaction()
		
		if up:
			if currentLabel == 0:
				currentLabel = labels.size() - 1
			else:
				currentLabel = currentLabel - 1
			print(currentLabel)
			
		if down:
			if currentLabel == labels.size() - 1:
				currentLabel = 0
			else:
				currentLabel = currentLabel + 1
			# print(currentLabel)
			
	up = false 
	down = false
			
#Check which label the arrow is currently pointing at and execute appropriately
func _handle_interaction():
	container.set_hidden(false)
	pointer.set_hidden(false)
	if currentLabel == 0:
		print("summary")
	elif currentLabel == 1:
		get_node("/root/Pokemon/team/Message_box").set_text("Swap with who")
		print("swap")
	elif currentLabel == 2:
		get_node("/root/Pokemon/team/Message_box").set_text("Maybe one day")
		print("item")
	elif currentLabel == 3:
		container.set_hidden(true)
		pointer.set_hidden(true)
		get_tree().set_pause(false)
		print("cancel")
		
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
			
func _open_menu():
	#set_hidden(false)
	get_tree().set_pause(true)
	menu = false
	open = true