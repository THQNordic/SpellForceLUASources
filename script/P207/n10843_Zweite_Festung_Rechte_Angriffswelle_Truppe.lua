function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_p207_Zweite_Festung_Mauer_Gesprengt"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_p207_Zweite_Festung_Rechte_Truppe_Spawned"},
	},
}

-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 10843},  -- Anf�hrer lebt noch
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 10843} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}


-- wenn der anf�hrer tot ist, bricht panik aus!
-- alle st�rzen sich auf das  Monument des Spielers weil ihnen die "strategie" fehlt...

OnIdleGoHome
{
	X = 208,
	Y = 464, 
	Direction = NorthWest, 
	WalkMode = Run, 
	Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = 10843},		
	},  
	Actions = 
	{
		StopFollow{Target = 10843},
	}
}


EndDefinition()

end
