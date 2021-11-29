-- TRUPPE 1, Soldaten

MeinFuehrer = 5392

-- nur spawnen wenn der anführer da ist
SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{ 
		FigureAlive{NpcId = MeinFuehrer},
	},
}

-- nur respawnen wenn der anführer da ist, und die truppe komplett tot
Respawn
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 1,
	Conditions = 
	{ 
		FigureAlive {NpcId = MeinFuehrer},
		IsGlobalCounter {Name = "DarkElfAttackGroup2DeadCounter", Value = 0},
	},
	DeathActions = 
	{
		IncreaseGlobalCounter {Name = "DarkElfAttackGroup2DeadCounter"},
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
	X = AttackElfMonumentX, Y = AttackElfMonumentY, Direction = NorthWest, WalkMode = Run, Range = 5,
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

-- Wenn der Angriff auf die Festung losgeht gehen die Wipe outer zum Portal und despawnen
OnIdleGoHome
{
	X = PortalX, Y = PortalY, Direction = NorthWest, WalkMode = Run, Range = 2,
	Conditions =
	{	
		IsGlobalFlagFalse {Name = "Zwei"},
		IsGlobalFlagTrue {Name = "Last1"},
	},
	HomeActions =
	{
		SetNpcFlagTrue {Name = "FigurDespawn"},
	}
}

Despawn
{
	Conditions =
	{
		IsNpcFlagTrue {Name = "FigurDespawn"},
	},
}
