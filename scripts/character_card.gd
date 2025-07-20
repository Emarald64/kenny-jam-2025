extends Card

@export var capacity:int
@export var spawnCharacter:PackedScene

func play():
	if capacity<=Autoload.field.remainingCapacity and Autoload.field.power>=cost:
		Autoload.field.power-=cost
		Autoload.field.updatePowerMeter()
		Autoload.field.remainingCapacity-=capacity
		Autoload.field.updateCapacityMeter()
		Autoload.field.addPlayerChar(spawnCharacter.instantiate())
		Autoload.field.cardsPlayed+=1
		get_parent().removeCard(self)
