#
# attached to res://bullet_hell/BulletHell.tscn : BulletHell -> Player
# THIS SCRIPT HANDLES DAMAGE UPDATES on dino health
#

extends KinematicBody2D

# Set the constant value to increase movement by
const WALK_SPEED=300

var velocity=Vector2()

var bullet_damage # holds damage of bullet collider

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
	
	if (is_colliding()):
		# smoother collision
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
	
		### Damage Handler
		bullet_damage = get_collider().get("damage")
		if (bullet_damage == null):
			bullet_damage = 0
		#if (get_tree().get_root().get_node("BulletHell").no_party):
		#	print("Player_Sprite.gd: in no_party if test!")
		#	if (self.get_parent().BulletHell.current_hp <= 0):
		#		self.get_parent().BulletHell.current_hp = 0
		#	else:
		#		self.get_parent().BulletHell.current_hp -= bullet_damage
		#else:
		if (Party.party[0].CurrentHP <= 0):
			Party.party[0].CurrentHP = 0
		else:
			Party.party[0].CurrentHP -= bullet_damage
	
func _ready():
	set_fixed_process(true)


##########################################
# CODE GRAVEYARD
##########################################
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