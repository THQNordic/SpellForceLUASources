function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 8721},
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 8721},
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

    

-- Solange der Entsprechende Lagerabschnitt nocht steht wird gespawnt

Respawn
{
	X = g_P206_VierterTrakanX, Y = g_P206_VierterTrakanY, NoSpawnEffect = FALSE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_TraAbschnittVierKaputt"},
		FigureAlive {NpcId = 8721},
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
		FigureDead{NpcId = 8721},
		IsGlobalFlagTrue {Name = "AP1_TRA"},
	},  
	Actions = 
	{
		StopFollow{Target = 8721},
	}
}


EndDefinition()

end
