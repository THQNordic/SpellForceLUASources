function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillOnDominate{}

SpawnOnlyWhen 
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Angreifer_Gespawnt"},	
	},
	Actions = 
	{
	},
}

-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 10934},  -- Anf�hrer lebt noch
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 10934} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}


-- wenn der anf�hrer tot ist, bricht panik aus!
-- alle st�rzen sich auf das  Monument des Spielers weil ihnen die "strategie" fehlt...

OnIdleGoHome
{
	X = 441,
	Y = 260, 
	Direction = NorthWest, 
	WalkMode = Run, 
	Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = 10934},		
	},  
	Actions = 
	{
		StopFollow{Target = 10934},
	}
}


EndDefinition()

end
