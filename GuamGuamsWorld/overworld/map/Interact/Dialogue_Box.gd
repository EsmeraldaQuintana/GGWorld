extends Patch9Frame

#Variables for continuing printing
var printing = false
var donePrinting = false

#If the interact key has been pressed
var interact = false

#Timer to allow for slow print
var timer = 0

#Array of strings to print
var textToPrint = []

#Location in string & array
var currentChar = 0
var currentText = 0

#How fast to print characters
const SPEED = 0.1

func _ready():
	set_fixed_process(true)
	set_process_unhandled_key_input(true)

#When interact is pressed change the state of the variable interact
func _unhandled_key_input(key_event):
	if key_event.is_action_pressed("ui_interact"):
		interact = true
	elif key_event.is_action_released("ui_interact"):
		interact = false

func _fixed_process(delta):
	#Check to see if still printing, then check to see if there is anymore to print
	#If there is more to print it will go through the current string and print out char by char while still chars
	#once there are no more chars, advance to next element in the array and reset the char counter and timer
	#If there are more elements left in the pressing the interact button will continue printing,
	#Otherwise it will stop the printing loop and allow the player to move again
	if printing:
		if !donePrinting:
			timer += delta
			if timer > SPEED:
				timer = 0
				get_node("RichTextLabel").set_bbcode(get_node("RichTextLabel").get_bbcode() + textToPrint[currentText][currentChar])
				currentChar += 1

			if currentChar >= textToPrint[currentText].length():
				currentChar = 0
				timer = 0
				donePrinting = true
				currentText += 1
		elif interact:
			donePrinting = false
			get_node("RichTextLabel").set_bbcode("")
			if currentText >= textToPrint.size():
				currentText = 0
				textToPrint = []
				printing = false
				set_hidden(true)
				get_node("/root/overworld/Player").canMove = true
	interact = false

#Takes in the text to print and immobilizes the player
func _print_dialogue(text):
	printing = true
	textToPrint = text
	get_node("/root/overworld/Player").canMove = false