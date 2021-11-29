function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		FigureDead{NpcId = 9315},
		FigureDead{NpcId = 9316},
		FigureDead{NpcId = 9317},
		FigureDead{NpcId = 9318},
		IsGlobalFlagFalse { Name = "g_P204_NympenquestVerspielt"},		
	},
	Actions = 
	{
	   ChangeOwner{NpcId = self},
	   ChangeRace{Race = 148, NpcId = 9301},
	   SetGlobalFlagTrue{Name = "g_P205_NymphenFreiA"},
	   Outcry { NpcId = 9301, Tag = "oca2nymphetP205_002", String = "Fremdling! Wir helfen Euch!" },	   
	   SetRewardFlagTrue { Name = "Nymphe3Befreit"},
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
		SetNoFightFlagTrue{NpcId = 9301},
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