function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 0}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 68, Y = 273, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 68, Y = 273, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = 7, Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 68, Y = 273, NoSpawnEffect = FALSE, WaitTime = (random(30)+30),
	Conditions = 
	{ 
		BuildingInRange {X = 68, Y = 273, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
