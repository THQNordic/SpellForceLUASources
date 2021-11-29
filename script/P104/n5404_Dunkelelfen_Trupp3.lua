-- TRUPPE 1, Soldaten

MeinFuehrer = 5404

-- nur spawnen wenn der anführer da ist
SpawnOnlyWhen
{
	X = 371, Y = 307, NoSpawnEffect = TRUE,
	Conditions = 
	{ 
		FigureAlive{NpcId = MeinFuehrer},
	},
}

-- nur respawnen wenn der anführer da ist, und die truppe komplett tot
Respawn
{
	X = 371, Y = 307, NoSpawnEffect = TRUE, WaitTime = 1,
	Conditions = 
	{ 
		FigureAlive {NpcId = MeinFuehrer},
		IsGlobalCounter {Name = "DarkElfAttackGroup3DeadCounter", Value = 0},
	},
	DeathActions = 
	{
		IncreaseGlobalCounter {Name = "DarkElfAttackGroup3DeadCounter"},
		SetNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
}

-- FIXME: weitere respawns an anderen positionen ...


-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = MeinFuehrer},
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow {Target = MeinFuehrer},
		SetNpcFlagTrue {Name = "FollowModeAlreadySet"},
	}, 
}

-- wenn der anführer tot ist, bricht panik aus!
-- alle stürzen sich auf den spieler weil ihnen die "strategie" fehlt...
OnIdleGoHome
{
	X = AttackGrenzFesteHintenX, Y = AttackGrenzFesteHintenY, Direction = NorthWest, WalkMode = Run, Range = 5,
	Conditions = 
	{
		FigureDead {NpcId = MeinFuehrer},
	},
	Actions = 
	{
		StopFollow {Target = MeinFuehrer},
	},
	HomeActions = 
	{
	},
}

