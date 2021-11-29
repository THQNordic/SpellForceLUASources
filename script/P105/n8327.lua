function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 51, Y = 264, NoSpawnEffect = FALSE,
	Conditions =
	{ODER(
		UND(
			BuildingInRange {X = 51, Y = 264, Range = 0},
			IsGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed", Value = (random(4)+1), Operator = IsGreaterOrEqual}
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
	X = 51, Y = 264, NoSpawnEffect = FALSE, WaitTime = (random(80)+60),
	Conditions = 
	{ 
		BuildingInRange {X = 51, Y = 264, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
