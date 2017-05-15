extends Node2D

var death_happened

func _ready():
	print("overworld.gd: in ready()")
	print("overworld.gd: death happened: ", global.death)
	if (global.death):
		_reload()
	#print("Overworld.gd sees death = ", death)

func _reload():
	print("overworld.gd: in _reload()...")
	#get_tree().reload_current_scene()

#func _get_death_val():
#	return death_happened
	
#func _update_death_val(x):
#	death_happened = true 