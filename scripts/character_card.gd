extends Card

@export var capacity:int
@export var spawnCharacter:PackedScene
#@export var my_cost:int=2
#@export_multiline var my_affect_text:String=""
# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#cost=my_cost
	#AffectText=my_affect_text
func play():
	if capacity<=Autoload.field.remainingCapacity and Autoload.field.power>=cost:
		Autoload.field.power-=cost
		Autoload.field.updatePowerMeter()
		Autoload.field.remainingCapacity-=capacity
		Autoload.field.updateCapacityMeter()
		Autoload.field.addPlayerChar(spawnCharacter.instantiate())
		get_parent().removeCard(self)
