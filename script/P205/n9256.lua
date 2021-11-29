function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = FALSE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P205_SpinnenAttacke", UpdateInterval = 10},
	},
	Actions = 
	{
	   Goto {X = 135, Y = 319, NpcId = 9256, Range = 1, WalkMode = Run, GotoMode = GotoForced},
	},
}

EndDefinition()

end
