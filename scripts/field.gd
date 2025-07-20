extends Node2D
class_name Field

var playerChars:Array
var enemyChars:Array
var playerBaseHealth=20
var enemyBaseHealth=20
var remainingCapacity=8
var maxCapacity=8
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func addPlayerChar(char:Character,position:=0):
	playerChars.insert(position,char)
	add_child(char)

func arrangeChars():
	for i in range(len(playerChars)):
		playerChars[i].position.x=(len(playerChars)-i/len(playerChars)+1)*500
		playerChars[i].position.y=351
	for i in range(len(enemyChars)):
		enemyChars[i].position.x=((i+1/len(enemyChars)+1)*500)+600
		enemyChars[i].position.y=351

func turn():
	for char in enemyChars:
		char.preTurn(playerChars,enemyChars)
	for char in playerChars:
		char.preTurn(playerChars,enemyChars)
	for char in enemyChars:
		for i in range(char.getNumAttacks()):
			if len(playerChars)>0:
				playerChars[0].hurt(char.attack)
			else:
				playerBaseHealth-=char.attack
				if playerBaseHealth<=0:
					lose()
					return
	for char in playerChars:
		for i in range(char.getNumAttacks()):
			if len(playerChars)>0:
				enemyChars[0].hurt(char.attack)
			else:
				enemyBaseHealth-=char.attack
				if enemyBaseHealth<=0:
					win()
					return
	for char in enemyChars:
		char.postTurn(playerChars,enemyChars)
	for char in playerChars:
		if char.postTurn(playerChars,enemyChars):
			remainingCapacity+=char.capacity
	updateCapacityMeter()

func updateCapacityMeter():
	$capacity.text=str(remainingCapacity)+"/"+str(maxCapacity)+" capacity"

func win():
	pass

func lose():
	pass
