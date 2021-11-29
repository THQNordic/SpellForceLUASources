function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = 273, 
	Y = 36, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohens_Army_Formation_Group"},
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_And_His_Army_Unit_05", UpdateInterval = 5},
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
		FigureAlive {NpcId = 11087},  -- Anführer lebt noch
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 11087} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

OnIdleGoHome
{
	X = 343,
	Y = 103, 
	Direction = NorthWest, 
	WalkMode = Run, 
	Range = 7,
	Conditions = 
	{
		FigureDead{NpcId = 11087},		
	},  
	Actions = 
	{
		StopFollow{Target = 11048},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		FigureDead{NpcId = 11086},	-- Rohen
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_Has_Spawned"},
	},  
	Actions = 
	{
		Kill {NpcId = self},
	}
}

Respawn
{
	WaitTime = 9,
	X = 273,
	Y = 36,
	Conditions = 
	{
		FigureAlive{NpcId = 11086},	-- Rohen
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_Has_Spawned"},
		--IsGlobalFlagFalse {Name = "g_P207_Alyha_Has_Returned"},
		IsGlobalFlagFalse {Name = "g_P207_Rohen_Wants_To_Kick_Some_Ass"},
	},
	Actions = 
	{
		Goto {X = 343, Y = 103, NpcId = self, Range = 7, WalkMode = Run, GotoMode = GotoContinuous},
	},
	DeathActions = 
	{ 
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P207_Rohens_Army_Formation_Group_Follow"},
	},  
	Actions = 
	{
		Follow{Target = 11087},
	}
}

EndDefinition()

end
