extends Control
class_name Card 

@export var AffectText:String
var popup:PanelContainer
var hovered:=false
var id=0
var canPlay=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func play():
	print("Played "+$Title.text)
	get_parent().addCard(preload("res://scenes/card.tscn").instantiate())

func _process(delta: float) -> void:
	if isHovered():
		if Input.is_action_just_released("click"):
			play()
		if len(AffectText)>0 and not hovered:
			popup=preload("res://scenes/popup text.tscn").instantiate()
			popup.z_index=2
			popup.get_node("Label").text=AffectText;
			add_child(popup)
		scale=Vector2.ONE*1.2
		if not hovered:position.y-=10
		z_index=1
		hovered=true
	else:
		if popup!=null:
			popup.queue_free()
		if hovered:position.y+=10
		scale=Vector2.ONE
		z_index=0
		hovered=false
		
func isMouseOver() -> bool:
	return Rect2(Vector2(),size).has_point(get_local_mouse_position())

func isHovered() ->bool:
	return isMouseOver() and(id+1==len(get_parent().cards) or not get_parent().cards[id+1].isMouseOver())
