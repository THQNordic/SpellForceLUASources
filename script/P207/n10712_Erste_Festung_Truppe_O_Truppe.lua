function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		--UND
		--(
		--IsGlobalFlagTrue {Name = "g_p207_Erste_Festung_Erste_Truppe_Dead"},
		--IsGlobalFlagTrue {Name = "g_p207_Erste_Festung_Erste_Truppe_Spawned"}
		--)
		IsGlobalFlagTrue {Name = "g_p207_Erste_Festung_Tore_Offen"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Erste_Festung_Truppe_O_Spawned"},
	},
}

-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 10712},  -- Anführer lebt noch
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 10712} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

-- wenn der anführer tot ist, bricht panik aus!
-- alle stürzen sich auf das  Monument des Spielers weil ihnen die "strategie" fehlt...

OnIdleGoHome
{
	X = 185, 
	Y = 333,
	Direction = NorthWest, 
	WalkMode = Run, 
	Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = 10712},		
	},  
	Actions = 
	{
		StopFollow{Target = 10712},
	}
}


EndDefinition()

end
