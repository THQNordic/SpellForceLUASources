function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 4}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 68, Y = 273, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 68, Y = 273, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = (random(10)+5), Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 68, Y = 273, NoSpawnEffect = FALSE, WaitTime = (random(60)+20),
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
