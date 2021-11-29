function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209SpawnUnterstuetzungseinheiten"},	
	},
	Actions =
	{
		Goto {X = 382, Y = 251, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoForced},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 382, Y = 251, NpcId = self , Range = 10},
	},
	Actions = 
	{ 
		SetNpcFlagTrue{Name = "ChangeOwnerNowAndForever!"},
	}
}
 

OnPlatformOneTimeEvent
{
	Conditions = 
	{ 
		IsNpcFlagTrue{Name = "ChangeOwnerNowAndForever!"},
	},
	Actions = 
	{ 
		ChangeFigureOwner {NpcId = self},
	}
}
 

EndDefinition()

end
