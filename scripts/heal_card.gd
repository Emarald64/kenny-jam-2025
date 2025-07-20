extends Card


# Called when the node enters the scene tree for the first time.
func play():
	if Autoload.field.power>=cost:
		Autoload.field.power-=cost
		Autoload.field.updatePowerMeter()
		
		#card logic
		Autoload.field.playerChars[0].heal(15)
		
		Autoload.field.cardsPlayed+=1
		queue_free()
