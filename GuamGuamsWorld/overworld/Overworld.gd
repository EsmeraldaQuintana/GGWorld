extends Node2D

var death_happened

func _ready():
	print("overworld.gd: in ready()")
	print("overworld.gd: death happened: ", global.death)
	#f (global.death):
	#	get_tree().reload_current_scene()
	#print("Overworld.gd sees death = ", death)

func _get_death_val():
	return death_happened
	
func _update_death_val(x):
	death_happened = true 