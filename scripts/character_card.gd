extends Card

@export var capacity:int
@export var spawnCharacter:PackedScene
# Called when the node enters the scene tree for the first time.
func play():
	if capacity<=Autoload.field.remainingCapacity:
		Autoload.field.addPlayerChar(spawnCharacter.instantiate(),len(Autoload.field.playerChars)-1)
