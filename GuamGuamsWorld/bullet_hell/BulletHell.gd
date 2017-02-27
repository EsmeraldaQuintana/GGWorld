extends TextureFrame

var player_health = 100
var screen_size
var player_size
var player_speed = 300
# player_velocity doesn't need to be initialized
#		because it is updated to 0 on inactivity
#		in _fixed_process()
var player_velocity = Vector2()

# NOTE: BH BOUNDARIES 500x500 box, 8px border, active area is 485x485

# fixed_process happens on timed basis
func _fixed_process(delta):
	var colliding = .get_node("Player").is_colliding()
	if (colliding):
		print("colliding!")
		print("took 100 dmg", .get_node("Player").get_collider().free())
		player_health = 0
		print("player health is ", player_health)
	player_velocity.y += delta
	if (Input.is_action_pressed("move_left")):
		player_velocity.x = -player_speed
	elif (Input.is_action_pressed("move_right")):
		player_velocity.x = player_speed
	else:
		player_velocity.x = 0
	if (Input.is_action_pressed("move_up")):
		player_velocity.y = - player_speed
	elif (Input.is_action_pressed("move_down")):
		player_velocity.y = player_speed
	else:
		player_velocity.y = 0
	var motion = player_velocity * delta
	get_node("Player").move(motion)
	
# first function called is _ready()
func _ready():
	set_process(true)
	set_fixed_process(true)
	screen_size = get_viewport_rect().size
	var boundarybox = get_node("Box").get_pos()
	print("boundarybox_x is", boundarybox.x)
	print("boundarybox_y is", boundarybox.y)
	player_size = get_node("Player/Player Sprite").get_texture().get_size()

# _process() currently unused!
# gamestate update
# delta processes at every frame
#func _process(delta):
#)
