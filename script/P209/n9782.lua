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
		Goto {X = 378, Y = 249, NpcId = self, Range = 3, WalkMode = Run, GotoMode = GotoForced},
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
		Goto {X = 400, Y = 252, NpcId = self, Range = 0, WalkMode = Run, GotoMode = GotoForced},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureInRange {X = 400, Y = 252, NpcId = self, Range = 0},
		FigureJob {Job = JobIdle , NpcId = self},
		IsGlobalFlagTrue {Name = "g_sP209KathaiMove"},
	},
	Actions = 
	{ 
		LookAtDirection {Direction = West, NpcId = self},
	}
}
EndDefinition()

end
