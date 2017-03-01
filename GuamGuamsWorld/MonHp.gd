extends Node2D

export var health = 100

func _ready():
	set_process_input(true)
	set_process(true)
	
func _input(event):
	if event.is_action_pressed("ui_right"):
		if health < 100:
			health += 10
	if event.is_action_pressed("ui_left"):
		if health > 0:
			health -= 10
			
func _draw():
	var rectangle = Rect2(0,0,(health/1),25)
	var color = Color(1,0,0,1)
	draw_rect(rectangle, color)
	
func _process(delta):
	update()
	
	if health <= 0:
		#add some code 
		print("Oh boy, you have fainted.")