extends TextureButton

func _ready():
	pass

func _pressed():
	get_tree().change_scene("res://bullet_hell/BulletHell.tscn")