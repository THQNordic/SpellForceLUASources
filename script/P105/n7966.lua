function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END


SpawnOnlyWhen
{
	X = 68, Y = 273, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 68, Y = 273, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = 15, Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 68, Y = 273, NoSpawnEffect = FALSE, WaitTime = 120,
	Conditions = 
	{ 
		BuildingInRange {X = 68, Y = 273, Range = 0}
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_RisingSkeletons"},
	},
}

EndDefinition()

end
