#
# attached to BulletHell.tscn -> Hp Bar 
# DinoHP.gd draws the HP bar and updates it
#

extends Node2D

var current_health
var t      # holds pointer to timer

func _ready():
	set_process(true)
	set_fixed_process(true)
	# Following if test unnecessary, BulletHell.gd populates an empty party
	# kept in case code breaks l8r
	#if Party.party.size() == 0:
	#	Party.party.append(Party.createDinoInstance(255, 20, 20))
	#set_process_input(true)
	current_health = Party.party[0].CurrentHP
	print("DinoHP.gd: initial health is ", current_health)
	t = Timer.new()
	t.set_wait_time(2)
	self.add_child(t)
	t.start()
	print("DinoHP.gd: TIMER INIT, time left ", t.get_time_left())
	
func _draw():
	# draws a rectangle of current_healthx25, position offset 0,0
	var rectangle = Rect2(0,0,current_health,25)
	var color = Color(1,0,0,1)
	draw_rect(rectangle, color)

func _process(delta):
	current_health = Party.party[0].CurrentHP
	update()
	# This is now handled in res://overworld/player.gd
	#if current_health <= 0:
	#	print("DinoHP.gd: Oh boy, you have fainted.")
	if (t.get_time_left() - .3 <= 0):
		print("DinoHP.gd: health is ", current_health)
		t.set_wait_time(3)
		t.start()
	
	
##########################################
# CODE GRAVEYARD
##########################################

#func _input(event):
#	if event.is_action_pressed("ui_right"):
#		if health < 100:
#			health += 10
#	if event.is_action_pressed("ui_left"):
#		if health > 0:
#			health -= 10
