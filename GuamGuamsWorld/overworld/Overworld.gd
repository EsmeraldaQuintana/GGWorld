extends Node2D

var death_happened = false

func _ready():
	if (death_happened):
		get_tree().reload_current_scene()