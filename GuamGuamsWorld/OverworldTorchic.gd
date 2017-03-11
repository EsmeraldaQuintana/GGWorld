extends KinematicBody2D

func _ready():
	set_process(true)
	
func _process(delta):
	if (is_colliding()):
		print("Colliding!")
		get_tree().change_scene("res://bullet_hell/BulletHell.tscn")