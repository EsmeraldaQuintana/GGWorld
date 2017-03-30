extends TextureButton

func _ready():
	pass

func _pressed():
	DinoDictionary.db_import("res://dinos/pokemonDatabase.csv", DinoDictionary.pokedex, DinoDictionary.POKEDEX_HEADERS_LIST)
	get_tree().change_scene("res://overworld/overworld.tscn")