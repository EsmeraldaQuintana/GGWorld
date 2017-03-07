extends KinematicBody2D

# Set the constant value to increase movement by
const WALK_SPEED=300

var velocity=Vector2()

# function that tracks movement
func _fixed_process(delta):
	
	# A series of if/elif/else statements that checks for
	# input and then moves character.
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
		move(motion)
	
func _ready():
	set_fixed_process(true)