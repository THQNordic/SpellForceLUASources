function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

SpawnOnlyWhen
{
	X = _X, Y = _Y,
	NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue { Name = "P105_EistempelfalleStart" },
		BuildingInRange {X = 116, Y = 177, Range = 0},
	},
	Actions = 
	{
		Goto {X = 169, Y = 248, GotoMode = GotoContinuous, WalkMode = Run},
	},
}

Respawn
{
	X = _X, Y = _Y, NoSpawnEffect = FALSE, WaitTime = 30,
	Conditions = 
	{ 
		BuildingInRange {X = 116, Y = 177, Range = 0}
	},
	Actions = 
	{
		Goto {X = 169, Y = 248, GotoMode = GotoContinuous, WalkMode = Run},
	},
}


EndDefinition()

end
