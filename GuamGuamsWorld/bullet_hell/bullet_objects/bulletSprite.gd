extends Sprite

var name
var ember 
var waterGun 
var razorLeaf

func _ready():
	load_bullet_sprites()
	set_bullet_sprites()
	
func load_bullet_sprites():
	ember = load("res://_assets/Bullet_FIRE.png")
	waterGun = load("res://_assets/pkmn diamond attack graphics/Water-Sport.png")
	razorLeaf = load("res://_assets/pkmn diamond attack graphics/Leaves.png")

func set_bullet_sprites():
	name = get_node("/root/BulletHell/battleArena/otherPokemon").otherDino.name
	
	print("The wild mon is " + str(name)) 
	
	if name == "Torchic":
		self.set_texture(ember)
	if name == "Squirtle":
		self.set_texture(waterGun)
	if name == "Bulbasaur":
		self.set_texture(razorLeaf)