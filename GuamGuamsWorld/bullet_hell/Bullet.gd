extends KinematicBody2D

export (int) var bullet_speed = 8

var directional_force = Vector2(0, 3)
var bullet_gravity = 0

export (PackedScene) var scene

#export (NodePath) var bullet_spawn_path
#onready var bullet_spawn = get_node(bullet_spawn_path)


var shoots = 0 

var timer = null
var can_shoot = true
var bullet_delay = .2

func _ready():
	set_process(true)
	
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)

func on_timeout_complete():
	can_shoot = true

func _process(delta):
	shoots = randi()%11+1
	if (shoots > 2):
		fire_once()
		shoots = shoots - 1
		timer.start()
	
func fire_once():
	shoot()

func shoot():
	var bullet = scene.instance()
	bullet.set_global_pos(get_node("FireballSpawner").get_global_pos())
	bullet.shoot(directional_force)
	add_child(bullet)