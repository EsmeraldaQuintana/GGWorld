extends Node2D

var health = Party.party[0].CurrentHP
var t      # holds pointer to timer

func _ready():
	#set_process_input(true)
	set_process(true)
	set_fixed_process(true)
	print("MonHP.gd sees initial health as ", health)
	t = Timer.new()
	t.set_wait_time(2)
	self.add_child(t)
	t.start()
	print("TIMER INIT, time left ", t.get_time_left())
	
func _draw():
	var rectangle = Rect2(0,0,(health/1),25)
	var color = Color(1,0,0,1)
	draw_rect(rectangle, color)

func _process(delta):
	health = Party.party[0].CurrentHP
	update()
	if health <= 0:
		print("Oh boy, you have fainted.")
	if (t.get_time_left() - .3 <= 0):
		print("TIMER UP, MonHP.gd sees health as ", health)
		t.set_wait_time(3)
		t.start()
	
#func _input(event):
#	if event.is_action_pressed("ui_right"):
#		if health < 100:
#			health += 10
#	if event.is_action_pressed("ui_left"):
#		if health > 0:
#			health -= 10
