function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_EmpyriaEndkampf", UpdateInterval = 10},
	},
	Actions = {},
}

OnOneTimeEvent
{
Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P204_YrmirAngriff", UpdateInterval = 10},
	},

	Actions =
	{
			Goto {X = 326, Y = 177, NpcId = 9904, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{	
		IsGlobalFlagTrue{Name = "g_P204_WachenFormieren", UpdateInterval = 10},
	},

	Actions =
	{
			Goto {X = 328, Y = 175, NpcId = 9895, Range = 0, WalkMode = Walk, GotoMode = GotoNormal},
	}
}

EndDefinition()

end
