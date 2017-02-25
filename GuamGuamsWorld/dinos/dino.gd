extends Sprite

class Dino extends Sprite:
	var totalHP = 100
	var currentHP = 100
	var name
	var attacks
	var type
	var frontSprite

func _ready():
	self.set_texture(frontSprite)