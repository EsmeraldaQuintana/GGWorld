extends KinematicBody2D

var sprite 
var name 

var flameBlast

func _ready():
	name = Party.party[0].name
	flameBlast = load("res://_assets/pkmn_diamond/Blast-Burn.png")
	set_sprite()
	
func set_sprite():
	if name == "Torchic":
		sprite = get_node("Sprite")
		sprite.set_texture(flameBlast)
