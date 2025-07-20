extends Card


func play():
	if Autoload.field.power>=cost:
		Autoload.field.power-=cost
		Autoload.field.updatePowerMeter()
		
		#card logic
		get_parent().addRandomCard()
		get_parent().addRandomCard()
		
		Autoload.field.cardsPlayed+=1
		get_parent().removeCard(self)
