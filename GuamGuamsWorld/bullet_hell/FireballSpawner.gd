#
# attached to res://bullet_hell/BulletHell.tscn : BulletHell -> FireballSpawner
#
extends KinematicBody2D

var directional_force = Vector2(0, 3)
var shoot_chance = 0 # initialized to 0
var timer
var bullet_delay = 1
var can_shoot = false

#export (PackedScene) var scene # Inspector -> Script Variables -> field holds res://bullet_hell/fireball.tscn
# ^ scene points to a fireball 

var scene
#= load("res://bullet_hell/bullet_objects/fireball.tscn")

func _ready():
	_ready_timer() # delays FireballSpawner from shooting
	set_process(true) # how did this code work without that fucking line? Whatever, it's here now.

func _ready_timer():
	set_process(true)
	timer = Timer.new()
	timer.set_wait_time(bullet_delay)
	timer.set_one_shot(true)
	timer.connect("timeout", self, "on_timeout_complete")
	self.add_child(timer)
	timer.start()

func on_timeout_complete():
	can_shoot = true

func _process(delta):
	shoot_chance = randi()%5+1
	scene = load(MoveDictionary.bullet_scene)
	if ((shoot_chance == 1) && can_shoot):
		#print("FUCK ME")
		shoot()
	
func shoot():
	var bullet = scene.instance()
	bullet.set_global_pos(get_node("SpawnPoint").get_global_pos())
	bullet.shoot(directional_force)
	add_child(bullet)
	
##########################################
# CODE GRAVEYARD
##########################################
#export (int) var bullet_speed = 8
#var bullet_gravity = 0

#export (NodePath) var bullet_spawn_path
#onready var bullet_spawn = get_node(bullet_spawn_path)


#func fire_once():
#	shoot()

#func _process(delta):
#	bullet_pick = randi()%2
#	if (MoveDictionary.bullet_number == 0):
#	scene = load(MoveDictionary.moveDictionary[0].tscn)
#	else:
#	scene = load(MoveDictionary.moveDictionary[1].tscn)