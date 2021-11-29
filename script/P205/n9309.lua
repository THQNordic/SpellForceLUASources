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
	   ChangeRace{Race = 148, NpcId = 9309},
	   SetGlobalFlagTrue{Name = "g_P205_NymphenFreiC"},
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
		SetNoFightFlagTrue{NpcId = 9309},
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