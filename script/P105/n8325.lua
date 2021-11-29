function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 59, Y = 279, NoSpawnEffect = FALSE,
	Conditions =
	{ODER(
		UND(
			BuildingInRange {X = 59, Y = 279, Range = 0},
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
	X = 59, Y = 279, NoSpawnEffect = FALSE, WaitTime = (random(80)+60),
	Conditions = 
	{ 
		BuildingInRange {X = 59, Y = 279, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
