extends Control
class_name Card 

var targetType=Card
@export var AffectText:String
var popup

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func play(target):
	pass



func _on_mouse_entered() -> void:
	if AffectText!=null:
		popup=preload("res://scenes/popup text.tscn").instantiate()
		popup.get_node("Label").text=AffectText;
		add_child(popup)
		


func _on_mouse_exited() -> void:
	if popup!=null:
		popup.queue_free()
