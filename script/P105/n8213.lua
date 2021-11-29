function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 66, Y = 264, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 66, Y = 264, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = 8, Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 66, Y = 264, NoSpawnEffect = FALSE, WaitTime = (random(30)+30),
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
