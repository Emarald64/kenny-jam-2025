extends Node2D
class_name Field

var playerChars:Array
var enemyChars:Array
var playerBaseHealth=100
var enemyBaseHealth=100
var remainingCapacity=8
var maxCapacity=8
var power=6
var cardsPlayed=0
var cardDraw=4



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Autoload.field=self
#
#
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func addPlayerChar(char:Character):
	playerChars.append(char)
	add_child(char)
	arrangeChars()

func arrangeChars():
	for i in range(len(playerChars)):
		playerChars[i].position.x=((len(playerChars)-i)/(len(playerChars)+1.0))*500
		playerChars[i].position.y=351
	for i in range(len(enemyChars)):
		enemyChars[i].position.x=(((i+1.0)/(len(enemyChars)+1))*500)+600
		enemyChars[i].position.y=351

func turn():
	$hand.clearCards()
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
				$"Player Health".text="Your health: "+str(playerBaseHealth)
				if playerBaseHealth<=0:
					lose()
					return
	for char in playerChars:
		for i in range(char.getNumAttacks()):
			if len(enemyChars)>0:
				enemyChars[0].hurt(char.attack)
			else:
				enemyBaseHealth-=char.attack
				$"Enemy Health".text="Enemy Health: "+str(enemyBaseHealth)
				if enemyBaseHealth<=0:
					win()
					return
	for char in enemyChars:
		char.postTurn(playerChars,enemyChars)
	for char in playerChars:
		if char.postTurn(playerChars,enemyChars):
			remainingCapacity+=char.capacity
	power=6
	cardsPlayed=0
	updateCapacityMeter()
	updatePowerMeter()
	for i in range(cardDraw):
		$hand.addRandomCard()

func updateCapacityMeter():
	$capacity.text="Capacity: "+str(remainingCapacity)+"/"+str(maxCapacity)
	
func updatePowerMeter():
	$Power.text="Power: "+str(power)

func win():
	pass

func lose():
	pass
