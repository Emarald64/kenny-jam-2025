extends Node2D

var cards:Array=[]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is Card:
			cards.append(child)
	print(len(cards))
	spreadCards()

func spreadCards():
	for i in range(len(cards)):
		cards[i].position.x=1000*(i+1)/(len(cards)+1)
		cards[i].position.y=10
		cards[i].id=i

func addCard(card:Card):
	cards.append(card)
	add_child(card)
	spreadCards()

func removeCard(card:Card):
	cards.erase(card)
	remove_child(card)
	spreadCards()
	
