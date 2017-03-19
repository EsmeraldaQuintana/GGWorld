extends Patch9Frame

#Variables of menu openness and use
var menu = false
var open = false

#Direction variables for pointer
var up = false
var down = false

#Variable of what option you're on
var currentLabel = 0
var labels

#Location of arrow
var pointer

func _ready():
	set_process_unhandled_key_input(true)
	set_fixed_process(true)
	labels = get_node("Labels").get_children()
	pointer = get_node("Sprite")
	
#If the menu is open continue executing
func _fixed_process(delta):
	if open:
		
		#If the interact button is pressed go to the option pressed
		if Input.is_action_pressed("ui_interact"):
			_handle_interaction()
		
		#If menu button is hit again, close the menu
		if menu:
			set_hidden(true)
			get_tree().set_pause(false)
			get_node("../Controls").set_hidden(true)
			open = false
		#If the up button is pressed move the cursor up
		if up:
			#Not working, should make the cursor wrap around
			if currentLabel == 0:
				currentLabel == labels.size()-1
			else:
				currentLabel -= 1
			pointer_update()
		#If the down button is pressed move the cursor down
		if down:
			#Not working, should make the cursor wrap around
			if currentLabel == labels.size()-1:
				currentLabel == 0
			else:
				currentLabel += 1
			pointer_update()
		
		menu = false
		up = false
		down = false

#Check which label the arrow is currently pointing at and execute appropriately
func _handle_interaction():
	if currentLabel == 0:
		get_tree().set_pause(false)
		get_tree().change_scene("res://bullet_hell/BulletHell.tscn")
	elif currentLabel == 1:
		get_node("../Controls").set_hidden(false)
	elif currentLabel == 2:
		get_tree().set_pause(false)
		get_tree().change_scene("res://title_screen/titleScreen.tscn")

#Repositions pointer based on current label
func pointer_update():
	pointer.set_global_pos(Vector2(pointer.get_global_pos().x, labels[currentLabel].get_global_pos().y+8))

#Handles menu, up, and down variables depending on key state
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

#Reveals menu, pauses game
func _open_menu():
	set_hidden(false)
	get_tree().set_pause(true)
	menu = false
	open = true