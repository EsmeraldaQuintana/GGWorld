# attached to BulletHell.tscn -> Player -> Attack

extends KinematicBody2D

var sprite 
var name 
var attack 

var flameBlast
var waterBlast 
var hyperBeam 

func _ready():
	set_process_unhandled_key_input(true)
	name = Party.party[0].name
	flameBlast = load("res://_assets/pkmn_diamond/Blast-Burn.png")
	waterBlast = load("res://_assets/pkmn_diamond/Waterfall.png")
	hyperBeam = load("res://_assets/pkmn_diamond/Healing.png")
	sprite = get_node("Sprite")
	attack = get_node("/root/BulletHell/Player/Attack")
	set_sprite()
	#prep_attack()

func _unhandled_key_input(key_event):
	if key_event.is_action_pressed("ui_select"):
		prep_attack()

func prep_attack():
	attack.set_hidden(false)

func set_sprite():
	if name == "Torchic":
		sprite.set_texture(flameBlast)
	if name == "Squirtle":
		sprite.set_texture(waterBlast)
	if name == "Bulbasaur":
		sprite.set_texture(hyperBeam)
