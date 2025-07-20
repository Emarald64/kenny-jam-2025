extends Node2D

var cards:Array=[]
const posibleCards=["res://scenes/Cards/Character cards/gunner_card.tscn","res://scenes/Cards/Character cards/healer_card.tscn","res://scenes/Cards/Character cards/wall_card.tscn","res://scenes/Cards/Character cards/warrior_card.tscn"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is Card:
			cards.append(child)
	print(len(cards))
	spreadCards()

func spreadCards():
	for i in range(len(cards)):
		cards[i].rotation=(PI/16*(i+1)/(len(cards)+1))-PI/32
		cards[i].position.x=(sin(cards[i].rotation*4)*1000)+500
		cards[i].position.y=-cos(cards[i].rotation*4)*200+200
		if cards[i].hovered:cards[i].position.y-=10
		cards[i].id=i

func addCard(card:Card):
	cards.append(card)
	add_child(card)
	spreadCards()

func addCards(newCards:Array):
	cards.append_array(newCards)
	for card in newCards:
		add_child(card)
	spreadCards()

func addRandomCard():
	addCard(load(posibleCards.pick_random()).instantiate())

func removeCard(card:Card):
	cards.erase(card)
	card.queue_free()
	spreadCards()

func clearCards():
	for card in cards:
		card.queue_free()
	cards.clear()

func removeCardById(id:int):
	remove_child(cards[id])
	cards.remove_at(id)
	spreadCards()
	
