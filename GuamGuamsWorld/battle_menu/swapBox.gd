extends Sprite

var options 
var swapCode 

func _ready():
	#print("swapBox.gd: in the swapBox")
	getLabels()
	setLabels()
	
func getLabels():
	options = get_node("../swapBox/mons")
	
func setLabels():
	swapCode = "0 : Cancel \n"
	if Party.party.size() < 2:
		print("swapBox.gd: Only one in party")
	else:
		for i in range (1, Party.party.size()):
			swapCode += str(i) + ": " + Party.party[i].name + " \n"

	options.set_text(swapCode)
	print("swapBox.gd: set labels")