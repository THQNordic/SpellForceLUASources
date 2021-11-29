function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	X = 59, Y = 267, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 51, Y = 264, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = 15, Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 51, Y = 264, NoSpawnEffect = FALSE, WaitTime = 120,
	Conditions = 
	{ 
		BuildingInRange {X = 51, Y = 264, Range = 0}
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_RisingSkeletons"},
	},
}

EndDefinition()

end
