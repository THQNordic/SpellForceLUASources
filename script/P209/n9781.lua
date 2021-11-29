function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP209UruWachen"},	
	},
	Actions =
	{
		Goto {X = 376, Y = 249, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoForced},
	}
}

--Wenn man mit Uru zum zweiten Mal geredet hat, postiert sich die Wache neu.
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	},
	Actions = 
	{ 
		Goto {X = 417, Y = 281, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoForced},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 417, Y = 281, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = South, NpcId = self},
	}
}
EndDefinition()

end
