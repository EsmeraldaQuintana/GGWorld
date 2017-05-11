# attached to overworld.tscn -> overworld -> Player

extends KinematicBody2D
#Code based on XAND's

#const GRAVITY = 200.0
#const WALK_SPEED = 200

#Movement Variables
var direction = Vector2(0, 0)
var currentPos = Vector2(0, 0)
var moving = false
var speed = 1
var canMove = true
var world
var chatBox
var chatBoxMessage
var collision_normal 
var GuamMode = false 

var Player 
var Torchic 
var Squirtle 
var Bulbasuar 

var transformed = false 

var velocity = Vector2()
var motion = Vector2()

#Variables for menus and interacting
var interact = false
var menu = false

#Animation Variables
var sprite
var animationPlayer

#Movement Constants
const GRID = 16

#Needed for Death Screen
var currentDino = Party.party[0]
var currentHP
var name 

func _ready():
	world = get_world_2d().get_direct_space_state()
	set_process(true)
	set_process_input(true)
	set_fixed_process(true)
	name = Party.party[0].name
	sprite = get_node("Sprite")
	chatBox = get_node("ChatBox")
	chatBoxMessage = get_node("ChatBox/Message")
	animationPlayer = get_node("AnimationPlayer")
	#get_node("../Player").connect("body_enter",self,"_on_Area2D_body_enter")
	#get_node("../GuamGuam").connect("body_exit",self,"_on_Area2D_body_exit")
	print('player.gd: Your party contains: ')
	for dino in Party.party:
		print(dino.name)
	Player = load("res://overworld/PlayerSprites/redtest.png")
	Torchic = load("res://overworld/PlayerSprites/gTorchic.png")
	Squirtle = load("res://overworld/PlayerSprites/gSquirt.png")
	Bulbasuar = load("res://overworld/PlayerSprites/gBulba.png")

func _input(event):
	#If the player pressed Esc, quit the game
	if event.is_action_pressed("ui_interact"):
		interact = true
	elif event.is_action_released("ui_interact"):
		interact = false
	elif event.is_action_pressed("ui_menu"):
		menu = true
	elif event.is_action_released("ui_menu"):
		menu = false
		
func _fixed_process(delta):
	#print("in player fixed")

	#While not moving check if the spaces adjacent to player have collision
	#If a movement key is pressed turn the sprite the direction pressed
	#If the position is 'open' move the player one tile in that direction
	#And run movement animation
	if !moving and canMove:
		#When not moving allows the player to toggle movespeed
		#If holding R character does weird burst sprints
		if speed == 1 && Input.is_key_pressed(KEY_R):
			speed = 2
		elif speed == 2 && Input.is_key_pressed(KEY_R):
			speed = 1
		# Check tiles around player to see if there is a collision present
		var resultUp = world.intersect_point(get_pos() + Vector2(0, -GRID))
		var resultDown = world.intersect_point(get_pos() + Vector2(0, GRID))
		var resultLeft = world.intersect_point(get_pos() + Vector2(-GRID, 0))
		var resultRight = world.intersect_point(get_pos() + Vector2(GRID, 0))
		
		# Hardcoded 1/20 random encounter rate
		var rand = randi() % 50
		
		#When respective direction is pressed, sprite is changed to that direction
		#If there is no collision in that direction's tile, move to it
		if Input.is_action_pressed("move_owup"):
			sprite.set_frame(0)
			if resultUp.empty():
				moving = true
				direction = Vector2(0, -1)
				currentPos = get_pos()
				animationPlayer.play("walk_up")
				chatBox.set_hidden(true)
			if rand == 0:
				randomEncounter()
		elif Input.is_action_pressed("move_owdown"):
			sprite.set_frame(6)
			if resultDown.empty():
				moving = true
				direction = Vector2(0, 1)
				currentPos = get_pos()
				animationPlayer.play("walk_down")
				chatBox.set_hidden(true)
			if rand == 0:
				randomEncounter()
		elif Input.is_action_pressed("move_owleft"):
			sprite.set_frame(3)
			if resultLeft.empty():
				moving = true
				direction = Vector2(-1, 0)
				currentPos = get_pos()
				animationPlayer.play("walk_left")
				chatBox.set_hidden(true)
			if rand == 0:
				randomEncounter()
		elif Input.is_action_pressed("move_owright"):
			sprite.set_frame(9)
			if resultRight.empty():
				moving = true
				direction = Vector2(1, 0)
				currentPos = get_pos()
				animationPlayer.play("walk_right")
				chatBox.set_hidden(true)
			if rand == 0:
				randomEncounter()
		
		#When Enter or E is pressed, test if an interact node
		#Is present in the direction the character is facing
		if interact:
			if sprite.get_frame() == 0:
				interact(resultUp)
			if sprite.get_frame() == 6:
				interact(resultDown)
			if sprite.get_frame() == 3:
				interact(resultLeft)
			if sprite.get_frame() == 9:
				interact(resultRight)
		
		#If the player is not interacting with something, 
		#open the menu
		if menu and !interact:
			get_node("Camera2D/CanvasLayer/Menu")._open_menu()
	elif canMove:
		#Update the players movement based on their direction and speed
		move_to(get_pos() + direction * speed)
		if get_pos() == currentPos + Vector2(GRID * direction.x, GRID * direction.y):
			moving = false
		if (is_colliding()):
			var other = get_collider()
			moving = false
			print("colliding in fixed")
			revert_motion()
			print("moved?")
			chatBox.set_hidden(false)
			chatBoxMessage.set_text("You've unlocked the GuamGuam")
			if other.is_in_group("Upgrades"):
				GuamMode = true
				other.queue_free()
	interact = false
	menu = false
func _on_Area2D_body_enter( body ):
	print("Entered Area2D with body ", body)
	
func _on_Area2D_body_exit( body ):
	print("Exited Area2D with body ", body)

func _process(delta):
	# reupdating currentDino so this code won't break when we can change order of party
	currentDino = Party.party[0]
	currentHP = currentDino.CurrentHP
	# Death Screen Handler
	#	need to eventually make a "all_pokemon_dead" function
	#	and use it here instead
	if (currentHP == 0):
		print("Player.gd: you're dead!")
		get_tree().change_scene("res://death_screen/Death_Screen.tscn")
	

# This could maybe go in a different file -- that might make more sense.
func randomEncounter():
	var bh = load("res://bullet_hell/BulletHell.tscn").instance()
	var packed_ow = PackedScene.new()
	packed_ow.pack(get_tree().get_current_scene())
	ResourceSaver.save("res://overworld/packedOverworld.tscn", packed_ow)
	self.get_tree().change_scene("res://bullet_hell/BulletHell.tscn")

#Given the direction the player is facing
#If there is an object with collision AND interact node
#Dialogue box is brought up and prints message from the interact node
func interact(result):
	for dictionary in result:
		if typeof(dictionary.collider) == TYPE_OBJECT and dictionary.collider.has_node("Interact"):
			get_node("Camera2D/CanvasLayer/Dialogue Box").set_hidden(false)
			get_node("Camera2D/CanvasLayer/Dialogue Box")._print_dialogue(dictionary.collider.get_node("Interact").text)
			
func transform():
	if (!transformed):
		if (name == "Torchic"):
			#switch into attack mode 
			print("Tochic in GuamMode")
			#swap sprite sheet 
			get_node("Sprite").set_texture(Torchic)
			transformed = true 
		if (name == "Bulbasuar"):
			#switch into attack mode 
			print("Bulbasuar in GuamMode")
			#swap sprite sheet 
			get_node("Sprite").set_texture(Bulbasuar)
			transformed = true 
		if (name == "Squirtle"):
			#switch into attack mode 
			print("Squirtle in GuamMode")
			#swap sprite sheet 
			get_node("Sprite").set_texture(Squirtle)
			transformed = true 
	elif (transformed):
		#get_node("Sprite").set_texture(Player)
		print("Trying to swap back")
		