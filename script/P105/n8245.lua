function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 59, Y = 279, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 59, Y = 279, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = (random(20)+20), Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 59, Y = 279, NoSpawnEffect = FALSE, WaitTime = (random(60)+60),
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
