function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 8752},
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 8752} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

    

-- Solange der Entsprechende Lagerabschnitt nocht steht wird gespawnt

Respawn
{
	X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, NoSpawnEffect = FALSE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_TroAbschnittEinsKaputt"},
		FigureAlive {NpcId = 8752},
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
	X = g_P206_MonumentX, Y = g_P206_MonumentY, Direction = NorthWest, WalkMode = Run, Range = 5,
	Conditions = 
	{
		FigureDead{NpcId = 8752},
		IsGlobalFlagTrue {Name = "AP1_TRO"},
	},  
	Actions = 
	{
		StopFollow{Target = 8752},
	}
}

-- Chage Race auf Feindliche Dervische
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TrokanTot"}
	},
	Actions = 
	{
		ChangeRace {Race = 209}
	}
}

EndDefinition()

end
