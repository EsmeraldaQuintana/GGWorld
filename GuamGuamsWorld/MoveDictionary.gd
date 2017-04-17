# This code shamelessly stolen from Youtube user Pananag and 
# Godot Developers user 1000h.
# Check it out at...
# https://godotdevelopers.org/forum/discussion/15844/csv-to-dictionaries-proper-database-for-your-game

# HOW TO USE THE DINO DEX
# From any script, you can call DinoDictionary.pokedex
# Keys of pokedex are just the national dex numbers
# Values are a dictionary of pairs -- currently, Name, Number, Attack, and Type.

extends Node

var bullet_number = randi()%2
var bullet_damage
var bullet_scene

var moveDictionary = {}
var moveDictionary_HEADERS_LIST = []

func _ready():
	set_process(true)
	set_fixed_process(true)
	db_import("res://bullet_hell/moves/moveDatabase.csv", self.moveDictionary, self.moveDictionary_HEADERS_LIST)
	print("MoveDictionary.gd: moveDictionary is ", moveDictionary)
	print("MoveDictionary.gd: HEADERS_LIST is ", moveDictionary_HEADERS_LIST)
	#print("MoveDictionary: moveDictionary[1].Damage is ", moveDictionary[1].Damage)
	#print("MoveDictionary: moveDictionary_HEADERS_LIST is ", moveDictionary_HEADERS_LIST)
	
func _process(delta):
	random_bullet_update()


func random_bullet_update():
	bullet_number = randi()%2
	bullet_damage = MoveDictionary.moveDictionary[bullet_number].Damage
	bullet_scene = MoveDictionary.moveDictionary[bullet_number].tscn
	

func db_import(csv_file, dict_to_append, _HEADERS_LIST):
	# In order to loop through keys of keys as noted in the EDITED section
	# of the first post, EXTRA ARG is called _HEADERS_LIST
	
	var file = File.new()
	file.open(csv_file, file.READ)
	
	var is_header = true # toggle to false after one loop
	var attributes_list = [] # this list stores the first item of each column
	
	file.seek(0) # reader's cursor at first character
	
	var temp_dict = {} # will only live within this function

	while !file.eof_reached():
		var line = file.get_csv_line() # grabs the whole fucking line
		if is_header == true:
			attributes_list = line
			for item in attributes_list:
				_HEADERS_LIST.append(item)
			is_header = false
		else:
			temp_dict[attributes_list[0]] = int(line[0])
			for i in range(1, _HEADERS_LIST.size()):
				temp_dict[attributes_list[i]] = line[i]
			#print("MoveDictionary: dict_to_append is ", dict_to_append)
			#print("MoveDictionary: temp_dict is ", temp_dict)
			dict_to_append[int(line[0])] = temp_dict
			#print("MoveDictionary: dict_to_append is ", dict_to_append)
			temp_dict = {} # clear temp_dict
	#print("MoveDictionary: dict_to_append is ", dict_to_append)
	#print("MoveDictionary: _HEADERS_LIST is ", _HEADERS_LIST)

	#print("MoveDictionary.gd: moveDictionary contains...")
	#for dino in dict_to_append.values():
	#	print("MoveDictionary.gd: ", dino)