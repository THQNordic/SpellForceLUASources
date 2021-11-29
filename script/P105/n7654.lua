function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 5}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 351, Y = 117, NoSpawnEffect = FALSE, WaitTime = 20, UnitId = 1895,
	Conditions = 
	{ 
		IsNpcCounter{Name = "ElementalRespawn", Value = 0, Operator = IsEqual},
		BuildingInRange {X = 353, Y = 118, Range = 0}
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "ElementalRespawn"},
	},
}

Respawn
{
	X = 351, Y = 117, NoSpawnEffect = FALSE, WaitTime = 30, UnitId = 1896,
	Conditions = 
	{ 
		IsNpcCounter{Name = "ElementalRespawn", Value = 1, Operator = IsEqual},
		BuildingInRange {X = 353, Y = 118, Range = 0}
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "ElementalRespawn"},
	},
}

Respawn
{
	X = 351, Y = 117, NoSpawnEffect = FALSE, WaitTime = 40, UnitId = 1897,
	Conditions = 
	{ 
		IsNpcCounter{Name = "ElementalRespawn", Value = 2, Operator = IsEqual},
		BuildingInRange {X = 353, Y = 118, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
