function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)



Untotenchef1 = 6339

-- nur spawnen wenn der anführer da ist
SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions = 
	{ 
		FigureAlive{NpcId = Untotenchef1},
	},
}

-- nur respawnen wenn der anführer da ist, und die truppe komplett tot
Respawn
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE, WaitTime = 1,
	Conditions = 
	{ 
		FigureAlive{NpcId = Untotenchef1},
		IsGlobalCounter{Name = "UntotenAttackGroup1DeadCounter", Value = 0},
	},
	DeathActions = 
	{
		IncreaseGlobalCounter{Name = "UntotenAttackGroup1DeadCounter"},
		SetNpcFlagFalse{Name = "FollowModeAlreadySet"},
	},
}



-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive{NpcId = Untotenchef1},
		IsNpcFlagFalse{Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = Untotenchef1} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

-- wenn der anführer tot ist, bricht panik aus!
-- alle stürzen sich auf den spieler weil ihnen die "strategie" fehlt...
OnIdleGoHome
{
	X = AttackZwergendorf2X, Y = AttackZwergendorf2Y, Direction = NorthWest, WalkMode = Run, Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = Untotenchef1},
	},
	Actions = 
	{
		StopFollow{Target = Untotenchef1},
	},
	HomeActions = 
	{
	},
}

EndDefinition()

end