function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		FigureDead{NpcId = 9311},
		FigureDead{NpcId = 9312},
		FigureDead{NpcId = 9313},
		FigureDead{NpcId = 9314},
		IsGlobalFlagFalse { Name = "g_P204_NympenquestVerspielt"},			
	},
	Actions = 
	{
	   ChangeOwner{NpcId = self},
	   ChangeRace{Race = 148, NpcId = 9310},
	   Outcry { NpcId = 9310, Tag = "oca2nymphetP205_003", String = "Nehmt uns mit, Runenkrieger! Wir werden helfen!" },	 	   
	   SetRewardFlagTrue { Name = "Nymphe1Befreit"},  
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P205_CutsceneSpinnenkoenigAvatarStart", UpdateInterval = 10},
	},
	
	Actions =
	{
		SetNoFightFlagTrue{NpcId = 9310},
	}
}


OnToggleEvent
{
	OnConditions = 
	{
		FigureDead{NpcId = Avatar},
	},
	OnActions = 
	{
	},
	OffConditions = 
	{
		FigureAlive{NpcId = Avatar},
	},
	OffActions = 
	{
	   ChangeOwner{NpcId = self},
	   ChangeRace{Race = 148, NpcId = self},
	}
}

EndDefinition()

end