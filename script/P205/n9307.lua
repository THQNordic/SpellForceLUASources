function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		FigureDead{NpcId = 9322},
		FigureDead{NpcId = 9323},
		FigureDead{NpcId = 9324},
		FigureDead{NpcId = 9325},
		IsGlobalFlagFalse { Name = "g_P204_NympenquestVerspielt"},			
	},
	Actions = 
	{
	   ChangeOwner{NpcId = self},
	   ChangeRace{Race = 148, NpcId = 9307},
	   Outcry { NpcId = 9307, Tag = "oca2nymphetP205_001", String = "Runenkrieger! Lasst uns gemeinsam kämpfen!" },	   
	   SetGlobalFlagTrue{Name = "g_P205_NymphenFreiB"},
	   SetRewardFlagTrue { Name = "Nymphe2Befreit"},
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
		SetNoFightFlagTrue{NpcId = 9307},
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