function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, 
	Y = _Y, 
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "g_P207_Alyha_Moves_Toward_Battle", Seconds = 20},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "g_P207_Alyha_Has_Returned"},
		ChangeRace {Race = 185, NpcId = self},
	},
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
	},
	Actions =
	{
		ChangeFigureOwner {NpcId = self},
	},
}

-- follow funktioniert erst 1 step nach spawn, und muss persistent sein:
OnIdleEvent
{
	Conditions = 
	{
		FigureAlive {NpcId = 10060},  -- Anführer lebt noch
		IsNpcFlagFalse {Name = "FollowModeAlreadySet"},
	},
	Actions = 
	{ 
		Follow{Target = 10060} ,
		SetNpcFlagTrue{Name = "FollowModeAlreadySet"},
	}, 
}

OnOneTimeEvent
{
	Conditions = 
	{
		FigureDead {NpcId = 11086},
		IsGlobalFlagTrue{Name = "g_P207_Undead_Rohen_Has_Spawned"},	
	},  
	Actions = 
	{
		StopFollow{Target = 10060},
	},
}

EndDefinition()

end
