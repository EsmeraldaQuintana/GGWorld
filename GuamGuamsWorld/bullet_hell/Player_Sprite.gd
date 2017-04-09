#
# attached to res://bullet_hell/BulletHell.tscn : BulletHell -> Player
#

extends KinematicBody2D

# Set the constant value to increase movement by
const WALK_SPEED=300

var velocity=Vector2()

var damage_taken # holds damage of bullet collider


func _fixed_process(delta):
	### Movement Handling
	if (Input.is_action_pressed("move_left")):
		velocity.x = -WALK_SPEED
	elif (Input.is_action_pressed("move_right")):
		velocity.x = WALK_SPEED
	else:
		velocity.x = 0
	if (Input.is_action_pressed("move_down")):
		velocity.y = WALK_SPEED
	elif (Input.is_action_pressed("move_up")):
		velocity.y = -WALK_SPEED
	else:
		velocity.y = 0
	# defines motion based on velocity per second
	var motion = velocity * delta
	move(motion)
	
	#should be smoother collision?
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		damage_taken = get_collider().get("damage")
		if (damage_taken == null):
			damage_taken = 0
		print("SmoothCollisionTest.gd sees damage is ", damage_taken)
		# current_health = Party.party[0].CurrentHP
		# UPDATE HEALTH
		Party.party[0].CurrentHP -= damage_taken
		# MAYBE change this ^ to currentDino ?
	
	
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
	
func _ready():
	set_fixed_process(true)