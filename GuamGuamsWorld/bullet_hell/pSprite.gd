extends Sprite

var myName
var Torchic
var Squirtle
var Bulbasaur

func _ready():
	load_sprites()
	set_sprites()

func load_sprites():
	Torchic = load("res://dinos/Torchic/backSprite.png")
	Squirtle = load("res://dinos/Squirtle/backSprite.png")
	Bulbasaur = load("res://dinos/Bulbasaur/backSprite.png")
	
func set_sprites():
	myName = Party.party[0].name
	
	if myName == "Torchic":
		self.set_texture(Torchic)
	elif myName == "Squirtle":
		self.set_texture(Squirtle)
	elif myName == "Bulbasaur":
		self.set_texture(Bulbasaur)
		
	print("set sprite")