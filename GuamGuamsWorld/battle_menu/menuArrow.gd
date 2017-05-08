# attached to res://battle_menu/battleMenu.tscn : menuBackground -> menuArrow

extends Sprite

var init_location = Vector2(-49, -7)
var init_state = "Fight"
var current_location
var current_state
var pSprite
var swapBox

func _ready():
	current_location = init_location
	current_state = init_state
	set_process_unhandled_key_input(true)
	self.set_process(true)
	grab()

func grab():
	pSprite = get_node("/root/BulletHell/Player/Player Sprite")
	
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		if current_state == "Dinos":
			current_state = "Fight"
			current_location = Vector2(-49, -7)
		elif current_state == "Run":
			current_state = "Bag"
			current_location = Vector2(7, -7)
			
	if Input.is_action_pressed("ui_left"):
		if current_state == "Bag":
			current_state = "Fight"
			current_location = Vector2(-49, -7)
		elif current_state == "Run":
			current_state = "Dinos"
			current_location = Vector2(-49, 9)
			
	if Input.is_action_pressed("ui_right"):
		if current_state == "Fight":
			current_state = "Bag"
			current_location = Vector2(7, -7)
		elif current_state == "Dinos":
			current_state = "Run"
			current_location = Vector2(7, 9)
			
	if Input.is_action_pressed("ui_down"):
		if current_state == "Fight":
			current_state = "Dinos"
			current_location = Vector2(-49, 9)
		elif current_state == "Bag":
			current_state = "Run"
			current_location = Vector2(7, 9)
	
	if Input.is_action_pressed("ui_accept"):
		var label = get_node("../text_box/label")
		swapBox = get_node("../swapBox")
		if current_state == "Fight":
			label.set_text("You monster! Violence is never the answer!")
		elif current_state == "Bag":
			label.set_text("You've got nothing but a gum wrapper and three cents.")
		elif current_state == "Dinos":
			swapBox.set_hidden(false)
			# switch the sprite change hp bar 
			label.set_text("Pick a mon to swap with using the number pad.")
			#swapMon()
		elif current_state == "Run":
			self.get_tree().change_scene("res://overworld/packedOverworld.tscn")
	
	self.set_pos(current_location)
	
func _unhandled_key_input(event):
	print("swapping sprites")
	if event.is_action_pressed("swap_0") == true:
		print("0 was pressed")
		swapBox.set_hidden(true)
	elif event.is_action_pressed("swap_1") == true:
		print("1 was pressed")
		pSprite.set_texture(Party.party[1].backSprite)
	elif event.is_action_pressed("swap_2"):
		print("2 was pressed")
		pSprite.set_texture(Party.party[2].backSprite)
	elif event.is_action_pressed("swap_3"):
		print("3 was pressed")
		pSprite.set_texture(Party.party[3].backSprite)
	elif event.is_action_pressed("swap_4"):
		print("4 was pressed")
		pSprite.set_texture(Party.party[4].backSprite)
	elif event.is_action_pressed("swap_5"):
		print("5 was pressed")
		pSprite.set_texture(Party.party[5].backSprite)
