function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 9277},
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 9277} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

    

-- Solange der Entsprechende Lagerabschnitt nocht steht wird gespawnt

Respawn
{
	X = g_P206_ErsterMumienX, Y = g_P206_ErsterMumienY, NoSpawnEffect = FALSE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_MumienAbschnittEinsKaputt"},
		FigureAlive {NpcId = 9277},
	},
	DeathActions = 
	{
		SetNpcFlagFalse{Name = "FollowModeAlreadySet"},
	}
}


-- wenn der anführer tot ist, bricht panik aus!
-- alle stürzen sich auf das  Monument des Spielers weil ihnen die "strategie" fehlt...

OnIdleGoHome
{
	X = g_P206_EingangSchluchtX, Y = g_P206_EingangSchluchtY, Direction = NorthWest, WalkMode = Run, Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = 9277},
		
		IsGlobalFlagTrue {Name = "AP1_MUM"},
	},  
	Actions = 
	{
		StopFollow{Target = 9277},
	}
}


EndDefinition()

end
