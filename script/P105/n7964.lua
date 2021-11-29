function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	X = 49, Y = 275, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 49, Y = 275, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = 15, Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 49, Y = 275, NoSpawnEffect = FALSE, WaitTime = 120,
	Conditions = 
	{ 
		BuildingInRange {X = 49, Y = 275, Range = 0}
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_RisingSkeletons"},
	},
}

EndDefinition()

end
