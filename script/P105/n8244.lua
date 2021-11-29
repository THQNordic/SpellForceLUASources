function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 7}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 49, Y = 275, NoSpawnEffect = FALSE,
	Conditions =
	{
		BuildingInRange {X = 49, Y = 275, Range = 0},
		IsGlobalCounter{Name = "P105_RisingSkeletons", Value = (random(20)+20), Operator = IsGreaterOrEqual},
	},
}

Respawn
{
	X = 49, Y = 275, NoSpawnEffect = FALSE, WaitTime = (random(60)+60),
	Conditions = 
	{ 
		BuildingInRange {X = 49, Y = 275, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
