#
# attached to BulletHell.tscn parent node BulletHell
#

extends TextureFrame

var screen_size
var player_size
var currentDino
var current_health
var colliding

var t

var no_party = true

func _ready():
	#print("BulletHell.gd: no_party init is ", no_party)
	t = Timer.new()
	t.set_wait_time(3)
	self.add_child(t)
	t.start()
	#print("BulletHell.gd: Party size = ", Party.party.size())
	#print("Printing array [0] ", Party.party[0])
	# question:
	# Is there a way to make sure this code runs first? these two lines are
	# repeated in scripts attached to child nodes of BulletHell
	if (Party.party.size() == 0):
		no_party = true
		#print("BulletHell.gd: no_party is (should be true) ", no_party)
		Party.party.append(Party.createDinoInstance(255, 20, 20))
		currentDino = Party.party[0]
		# added in second line... dunno if I need that. hope so!
	else:
		currentDino = Party.party[0] # else pick first pokemon in Party
		no_party = false
		#print("BulletHell.gd: no_party is (should be false) ", no_party)
	current_health = currentDino.CurrentHP
	print("BulletHell.gd: dino HP: ", current_health)
	set_process(true)
	# set_fixed_process(true)

func _process(delta):
	current_health = currentDino.CurrentHP
	#if (t.get_time_left() - .3 <= 0):
	#	print("BulletHell.gd: health is ", current_health)
	#	t.set_wait_time(3)
	#	t.start()
	if (current_health == 0):
			print("BulletHell.gd: you're dead!")
			get_tree().change_scene("res://death_screen/Death_Screen.tscn")
	







##########################################
# CODE GRAVEYARD
##########################################
#var player_speed = 300
# player_velocity doesn't need to be initialized
#		because it is updated to 0 on inactivity
#		in _fixed_process()
#var player_velocity = Vector2()

# BOUNDARY BOX DEBUGGING
	#var boundarybox = get_node("Box").get_pos()
	#print("boundarybox_x is", boundarybox.x)
	#print("boundarybox_y is", boundarybox.y)
	#player_size = get_node("Player/Player Sprite").get_texture().get_size()
	# BOUNDARY BOX DEBUGGING END

#func _fixed_process(delta):
#	# COLLIDING HANDLING
#	colliding = .get_node("Player").is_colliding()
#	if (colliding):
#		if (.get_node("Player").get_collider() == .get_node("Bullet")):
#			.get_node("Player").get_collider().free()
#			colliding = false 
#			print("Took 60 bullet dmg!")
#			currentPokemon.CurrentHP -= 5
#			print("Player health is ", currentPokemon.CurrentHP)
#		if (.get_node("Player").get_collider() == .get_node("Lightning")):
#			.get_node("Player").get_collider().free()
#			colliding = false
#			print("Took 5 lightning dmg!")
#			currentPokemon.CurrentHP -= 5
#			print("Player health is ", currentPokemon.CurrentHP)

	# COLLIDING HANDLING END
	# PLAYER MOVEMENT
	#player_velocity.y += delta
	#if (Input.is_action_pressed("move_left")):
	#	player_velocity.x = -player_speed
	#elif (Input.is_action_pressed("move_right")):
	#	player_velocity.x = player_speed
	#else:
	#	player_velocity.x = 0
	#if (Input.is_action_pressed("move_up")):
	#	player_velocity.y = - player_speed
	#elif (Input.is_action_pressed("move_down")):
	#	player_velocity.y = player_speed
	#else:
	#	player_velocity.y = 0
	#var motion = player_velocity * delta
	#get_node("Player").move(motion)
	# PLAYER MOVEMENT END

# gamestate update
# delta processes at every frame
#func _process(delta):
#)

# NOTE: BH BOUNDARIES 500x500 box, 8px border, active area is 485x485

##########################################
# END CODE GRAVEYARD
##########################################