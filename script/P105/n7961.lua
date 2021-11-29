function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	X = 66, Y = 264, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 66, Y = 264, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = 5, Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 66, Y = 264, NoSpawnEffect = FALSE, WaitTime = 75,
	Conditions = 
	{ 
		BuildingInRange {X = 66, Y = 264, Range = 0}
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_RisingSkeletons"},
	},
}

EndDefinition()

end
