function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209CutszeneBote"},	
	},
	Actions =
	{
		
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KhalRuft", UpdateInterval = 10},
	},
	Actions = 
	{ 
		Goto {X = 284, Y = 262, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoForced},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 284, Y = 262, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP209KhalRuft"}
	},
	Actions = 
	{ 
		LookAtDirection {Direction = North, NpcId = self},
	}
}

EndDefinition()

end
