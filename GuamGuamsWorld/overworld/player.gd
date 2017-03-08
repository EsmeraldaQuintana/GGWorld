extends KinematicBody2D
#Code based on XAND's

#Movement Variables
var direction = Vector2(0, 0)
var currentPos = Vector2(0, 0)
var moving = false
var speed = 1
var world

#Animation Variables
var sprite
var animationPlayer

#Movement Constants
const GRID = 16

func _ready():
	world = get_world_2d().get_direct_space_state()
	set_fixed_process(true)
	sprite = get_node("Sprite")
	animationPlayer = get_node("AnimationPlayer")
	
func _fixed_process(delta):
	#If the player pressed Esc, quit the game
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	#While not moving check if the spaces adjacent to player have collision
	#If a movement key is pressed turn the sprite the direction pressed
	#If the position is 'open' move the player one tile in that direction
	#And run movement animation
	if !moving:
		#When not moving allows the player to toggle movespeed
		#If holding R character does weird burst sprints
		if speed == 1 && Input.is_key_pressed(KEY_R):
			speed = 2
		elif speed == 2 && Input.is_key_pressed(KEY_R):
			speed = 1
		var resultUp = world.intersect_point(get_pos() + Vector2(0, -GRID))
		var resultDown = world.intersect_point(get_pos() + Vector2(0, GRID))
		var resultLeft = world.intersect_point(get_pos() + Vector2(-GRID, 0))
		var resultRight = world.intersect_point(get_pos() + Vector2(GRID, 0))
		if Input.is_action_pressed("ui_up"):
			sprite.set_frame(0)
			if resultUp.empty():
				moving = true
				direction = Vector2(0, -1)
				currentPos = get_pos()
				animationPlayer.play("walk_up")
		elif Input.is_action_pressed("ui_down"):
			sprite.set_frame(6)
			if resultDown.empty():
				moving = true
				direction = Vector2(0, 1)
				currentPos = get_pos()
				animationPlayer.play("walk_down")
		elif Input.is_action_pressed("ui_left"):
			sprite.set_frame(3)
			if resultLeft.empty():
				moving = true
				direction = Vector2(-1, 0)
				currentPos = get_pos()
				animationPlayer.play("walk_left")
		elif Input.is_action_pressed("ui_right"):
			sprite.set_frame(9)
			if resultRight.empty():
				moving = true
				direction = Vector2(1, 0)
				currentPos = get_pos()
				animationPlayer.play("walk_right")
	else:
		#Update the players movement based on their direction and speed
		move_to(get_pos() + direction * speed)
		if get_pos() == currentPos + Vector2(GRID * direction.x, GRID * direction.y):
			moving = false