extends TextureFrame

var player_health = 100
var screen_size
var player_size
var player_speed = 300
# player velocity doesn't need to be initialized
#		because it is updated to 0 on inactivity
var player_velocity = Vector2()

# NOTE: BH BOUNDARIES 500x500 box, 8px border, active area is 485x485

# fixed_process happens on timed basis
func _fixed_process(delta):
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
	# set_process(true)
	set_fixed_process(true)
	screen_size = get_viewport_rect().size
	var boundarybox = get_node("BH Boundaries").get_pos()
	print("boundarybox_x is", boundarybox.x)
	print("boundarybox_y is", boundarybox.y)
	 # pad_size obtains texture size
	player_size = get_node("Player/Player Sprite").get_texture().get_size()
	 # activates idle processing
	 # when active, _process() called on every frame
	

# gamestate update
# delta processes at every frame
func _process(delta):
	#var player_pos = get_node("Player").get_pos()
	#var left_rect = Rect2( get_node("left").get_pos() - pad_size*0.5, pad_size )
	#var right_rect = Rect2( get_node("right").get_pos() - pad_size*0.5, pad_size )
	 # get new ball position
	# ball_pos += direction*ball_speed*delta
	 # flip ball when touching roof or floor
	#if ((ball_pos.y < 0 and direction.y < 0) or (ball_pos.y > screen_size.y and direction.y > 0)):
	#	direction.y = -direction.y
	 # flip, change direction, increase speed by 10% when touching pads
	#if ( ( left_rect.has_point(ball_pos) and direction.x < 0 ) or (right_rect.has_point(ball_pos) and direction.x > 0) ):
	#	direction.x = -direction.x
#		direction.y = randf()*2.0 - 1
#		direction = direction.normalized()
#		ball_speed *= 1.1
#	 # reset ball if game over (x position out of bounds)
#	if (ball_pos.x < 0 or ball_pos.x > screen_size.x):
#		ball_pos = screen_size*0.5
#		ball_speed = INITIAL_BALL_SPEED
#		direction = Vector2(-1, 2.0*randf()-1)
		
		
	#get_node("Player").set_pos(player_pos) # update player position
	
	 # move left pad
	#var left_pos = get_node("BH Boundaries/BH Player").get_pos()
	#if (Input.is_action_pressed("move_up")):
		
	#	player_pos.y += -player_speed * delta
	#if (Input.is_action_pressed("move_down")):
	#	player_pos.y += player_speed * delta
	#if (Input.is_action_pressed("move_right")):
	#	player_pos.x += player_speed * delta
	#if (Input.is_action_pressed("move_left")):
	#	player_pos.x += -player_speed * delta
	#get_node("Player").set_pos(player_pos)
	