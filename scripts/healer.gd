extends Character


func postTurn(playerChars,enemyChars)->bool:
	if health>0 and modifiers[paralyze] == 0:
		if self in playerChars:
			playerChars[0].heal(6)
	return super.postTurn(playerChars,enemyChars)
