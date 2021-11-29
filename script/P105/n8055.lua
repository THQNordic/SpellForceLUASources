function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 66, Y = 264, NoSpawnEffect = FALSE,
	Conditions =
	{ODER(
		UND(
			BuildingInRange {X = 66, Y = 264, Range = 0},
			IsGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed", Value = 3, Operator = IsGreaterOrEqual}
			),
		UND(
			IsGlobalFlagTrue{Name = "P105_ScramangirSpawned"},
			Negated(FigureAlive{NpcId = 8061})
			)
		)
	},
}

Respawn
{
	X = 66, Y = 264, NoSpawnEffect = FALSE, WaitTime = 150,
	Conditions = 
	{ 
		BuildingInRange {X = 66, Y = 264, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
