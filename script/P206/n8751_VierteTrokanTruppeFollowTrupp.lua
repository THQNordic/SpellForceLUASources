function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 8751},
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 8751},
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

    

-- Solange der Entsprechende Lagerabschnitt nocht steht wird gespawnt

Respawn
{
	X = g_P206_VierterTrokanX, Y = g_P206_VierterTrokanX, NoSpawnEffect = FALSE, WaitTime = 60,
	Conditions = 
	{ 
		IsGlobalFlagFalse {Name = "g_P206_TroAbschnittVierKaputt"},
		FigureAlive {NpcId = 8751},
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
		FigureDead{NpcId = 8751},
		IsGlobalFlagTrue {Name = "4AP1_TRO"},
	},  
	Actions = 
	{
		StopFollow{Target = 8751},
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
		ChangeRace {Race = 209},
		ChangeBuildingRace {X = 72, Y = 304, Race = 209},
		ChangeBuildingRace {X = 78, Y = 303, Race = 209},
		ChangeBuildingRace {X = 85, Y = 304, Race = 209},
		ChangeBuildingRace {X = 91, Y = 282, Race = 209},
		ChangeBuildingRace {X = 95, Y = 283, Race = 209},
		ChangeBuildingRace {X = 95, Y = 273, Race = 209},
		ChangeBuildingRace {X = 95, Y = 269, Race = 209},
		ChangeBuildingRace {X = 111, Y = 282, Race = 209},
		ChangeBuildingRace {X = 113, Y = 272, Race = 209},
		ChangeBuildingRace {X = 106, Y = 270, Race = 209},
		ChangeBuildingRace {X = 122, Y = 280, Race = 209},
		ChangeBuildingRace {X = 122, Y = 278, Race = 209},
		ChangeBuildingRace {X = 128, Y = 280, Race = 209},
		ChangeBuildingRace {X = 130, Y = 284, Race = 209},
		ChangeBuildingRace {X = 148, Y = 288, Race = 209},
		ChangeBuildingRace {X = 155, Y = 287, Race = 209},
		ChangeBuildingRace {X = 156, Y = 283, Race = 209},
		ChangeBuildingRace {X = 166, Y = 282, Race = 209},
	}
}

EndDefinition()

end
