# attached to res://battle_menu/battleMenu.tscn : menuBackground -> menuArrow

extends Sprite

var init_location = Vector2(-49, -7)
var init_state = "Fight"
var current_location
var current_state

func _ready():
	current_location = init_location
	current_state = init_state
	self.set_process(true)

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
		if current_state == "Fight":
			label.set_text("You monster! Violence is never the answer!")
		elif current_state == "Bag":
			label.set_text("You've got nothing but a gum wrapper and three cents.")
		elif current_state == "Dinos":
			label.set_text("Dino-switching DLC coming soon -- only $20.")
		elif current_state == "Run":
			self.get_tree().change_scene("res://overworld/packedOverworld.tscn")
	
	self.set_pos(current_location)