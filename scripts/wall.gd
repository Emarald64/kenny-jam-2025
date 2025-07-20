extends Character

func postTurn(playerChars,enemyChars):
	modifiers[regen]+=3
	return super.postTurn(playerChars,enemyChars)
