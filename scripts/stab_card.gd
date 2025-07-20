extends Card

func play():
	if Autoload.field.power>=cost:
		Autoload.field.power-=cost
		Autoload.field.updatePowerMeter()
		
		#card logic
		if len(Autoload.field.enemyChars):
			Autoload.field.enemyChars[0].hurt(7)
		else:
			Autoload.field.enemyBaseHealth-=7
			Autoload.field.get_node("Enemy Health").text="Enemy Health: "+str(Autoload.field.enemyBaseHealth)
			if Autoload.field.enemyBaseHealth<=0:Autoload.field.win()
		Autoload.field.cardsPlayed+=1
		get_parent().removeCard(self)
