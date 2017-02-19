extends TextureFrame

var init_location = Vector2(8, 12)
var init_state = "Fight"
var current_location
var current_state

func _ready():
	current_location = init_location
	current_state = init_state
	self.set_process(true)

func _process(delta):
	if Input.is_action_pressed("move_up"):
		if current_state == "Pokemon":
			current_state = "Fight"
			current_location = Vector2(8, 12)
		elif current_state == "Run":
			current_state = "Bag"
			current_location = Vector2(65, 12)
			
	if Input.is_action_pressed("move_left"):
		if current_state == "Bag":
			current_state = "Fight"
			current_location = Vector2(8, 12)
		elif current_state == "Run":
			current_state = "Pokemon"
			current_location = Vector2(8, 28)
			
	if Input.is_action_pressed("move_right"):
		if current_state == "Fight":
			current_state = "Bag"
			current_location = Vector2(65, 12)
		elif current_state == "Pokemon":
			current_state = "Run"
			current_location = Vector2(65, 28)
			
	if Input.is_action_pressed("move_down"):
		if current_state == "Fight":
			current_state = "Pokemon"
			current_location = Vector2(8, 28)
		elif current_state == "Bag":
			current_state = "Run"
			current_location = Vector2(65, 28)
	
	self.set_pos(current_location)