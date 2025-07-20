class_name Character
extends Node2D
@export var attack = 0
@export var health = 0
@export var capacity = 0
var modifiers = [0,0,0,0,0,0]
const regen = 0
const rage = 1
const poison = 2
const weakness = 3
const vulnerable = 4
const paralyze = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	updateHealthBar()
	$Sword/Label.text=str(attack)
#
func _process(delta):
	pass
func preTurn(playerChars,enemyChars):
	if modifiers[poison] > 0:
		health -= modifiers[poison]
		modifiers[poison] -= 1
	if modifiers[regen] > 0:
		health += modifiers[regen]
		modifiers[regen] -= 1
func postTurn(playerChars,enemyChars)->bool:
	if health <= 0:
		queue_free()
		return true
	else: return false
func hurt(damage):
	if modifiers[vulnerable] > 0: 
		if modifiers[rage] > 0: 
			health -= (damage + modifiers[rage])*3/2
			modifiers[rage] -= 1
		else: health -= damage*3/2
		modifiers[vulnerable] -= 1
	else:
		if modifiers[rage] > 0: 
			health -= (damage + modifiers[rage])
			modifiers[rage] -= 1
		else: health -= damage
	updateHealthBar()
func getAttackDamage():
	if modifiers[weakness] > 0:
		modifiers[weakness] -= 1
		return (attack + rage)*2/3
	return attack + rage
func getNumAttacks():
	if modifiers[paralyze] > 0:
		modifiers[paralyze] -= 1
		return 0
	return 1

func heal(ammount:int):
	health+=ammount
	updateHealthBar()

func updateHealthBar():
	$Heart/Label.text=str(health)
