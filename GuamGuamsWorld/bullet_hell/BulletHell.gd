extends TextureFrame

# var player_health = global.player_health OLD
# global.player_health for health
var screen_size
var player_size
var player_speed = 300
# player_velocity doesn't need to be initialized
#		because it is updated to 0 on inactivity
#		in _fixed_process()
var player_velocity = Vector2()
var colliding

# first function called is _ready()
func _ready():
	print("BulletHell.gd sees player health as ", global.player_health)
	set_process(true)
	set_fixed_process(true)
	# BOUNDARY BOX DEBUGGING
	#var boundarybox = get_node("Box").get_pos()
	#print("boundarybox_x is", boundarybox.x)
	#print("boundarybox_y is", boundarybox.y)
	#player_size = get_node("Player/Player Sprite").get_texture().get_size()
	# BOUNDARY BOX DEBUGGING END

func _fixed_process(delta):
	# COLLIDING HANDLING
	colliding = .get_node("Player").is_colliding()
	if (colliding):
		if (.get_node("Player").get_collider() == .get_node("Bullet")):
			.get_node("Player").get_collider().free()
			colliding = false 
			print("Took 60 bullet dmg!")
			global.player_health = global.player_health - 60
			print("Player health is ", global.player_health)
		if (.get_node("Player").get_collider() == .get_node("Lightning")):
			.get_node("Player").get_collider().free()
			colliding = false
			print("Took 40 lightning dmg!")
			global.player_health = global.player_health - 40
			print("Player health is ", global.player_health)
	# COLLIDING HANDLING END
	# PLAYER MOVEMENT
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
	# PLAYER MOVEMENT END

# gamestate update
# delta processes at every frame
#func _process(delta):
#)

# NOTE: BH BOUNDARIES 500x500 box, 8px border, active area is 485x485
