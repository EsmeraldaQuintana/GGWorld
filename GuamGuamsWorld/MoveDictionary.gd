# This code shamelessly stolen from Youtube user Pananag and 
# Godot Developers user 1000h.
# Check it out at...
# https://godotdevelopers.org/forum/discussion/15844/csv-to-dictionaries-proper-database-for-your-game

# HOW TO USE THE DINO DEX
# From any script, you can call DinoDictionary.pokedex
# Keys of pokedex are just the national dex numbers
# Values are a dictionary of pairs -- currently, Name, Number, Attack, and Type.

extends Node

var moveDictionary = {}
var moveDictionary_HEADERS_LIST = []
# params:  csv_file        csv file path
#          dict_to_append  .
#          _HEADERS_LIST   .
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
		var line = file.get_csv_line()
		if is_header == true:
			# set attributes_list : this is the header line
			attributes_list = line
			#print("MoveDictionary.gd: _HEADERS_LIST contains... ")
			for item in attributes_list:
				#print("MoveDictionary.gd: ", item, " ")
				_HEADERS_LIST.append(item)
			is_header = false
		else: # we have the header list
			temp_dict[attributes_list[0]] = int(line[0])
			for i in range(1, _HEADERS_LIST.size()):
				# create a key in temp_dict that is just one of the headers
				temp_dict[attributes_list[i]] = line[i]
			dict_to_append[int(line[0])] = temp_dict
			temp_dict = {} # clear temp_dict
	
	print("MoveDictionary.gd: moveDictionary contains...")
	for dino in dict_to_append.values():
		print("MoveDictionary.gd: ", dino)
		
func _ready():
	db_import("res://bullet_hell/moves/moveDatabase.csv", self.moveDictionary, self.moveDictionary_HEADERS_LIST)