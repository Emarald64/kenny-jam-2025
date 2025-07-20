extends Character

func hurt(damage):
	super.hurt(max(damage-3,0))
