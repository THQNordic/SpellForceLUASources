function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 59, Y = 267, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 59, Y = 267, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = 2, Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 59, Y = 267, NoSpawnEffect = FALSE, WaitTime = (random(30)+30),
	Conditions = 
	{ 
		BuildingInRange {X = 59, Y = 267, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
