function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 6}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 344, Y = 340, NoSpawnEffect = FALSE, WaitTime = 120, UnitId = 1921,
	Conditions = 
	{ 
		IsNpcCounter{Name = "SkeletonRisingRespawn", Value = 0, Operator = IsEqual},
		BuildingInRange {X = 344, Y = 340, Range = 0}
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "SkeletonRisingRespawn"},
	},
}

Respawn
{
	X = 344, Y = 340, NoSpawnEffect = FALSE, WaitTime = 130, UnitId = 1702,
	Conditions = 
	{ 
		IsNpcCounter{Name = "SkeletonRisingRespawn", Value = 1, Operator = IsEqual},
		BuildingInRange {X = 344, Y = 340, Range = 0}
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "SkeletonRisingRespawn"},
	},
}

Respawn
{
	X = 344, Y = 340, NoSpawnEffect = FALSE, WaitTime = 140, UnitId = 1701,
	Conditions = 
	{ 
		IsNpcCounter{Name = "SkeletonRisingRespawn", Value = 2, Operator = IsEqual},
		BuildingInRange {X = 344, Y = 340, Range = 0}
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "SkeletonRisingRespawn"},
	},
}

Respawn
{
	X = 344, Y = 340, NoSpawnEffect = FALSE, WaitTime = 150, UnitId = 1703,
	Conditions = 
	{ 
		IsNpcCounter{Name = "SkeletonRisingRespawn", Value = 3, Operator = IsEqual},
		BuildingInRange {X = 344, Y = 340, Range = 0}
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "SkeletonRisingRespawn"},
	},
}

Respawn
{
	X = 344, Y = 340, NoSpawnEffect = FALSE, WaitTime = 160, UnitId = 1301,
	Conditions = 
	{ 
		IsNpcCounter{Name = "SkeletonRisingRespawn", Value = 4, Operator = IsEqual},
		BuildingInRange {X = 344, Y = 340, Range = 0}
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "SkeletonRisingRespawn"},
	},
}

Respawn
{
	X = 344, Y = 340, NoSpawnEffect = FALSE, WaitTime = 170, UnitId = 1638,
	Conditions = 
	{ 
		IsNpcCounter{Name = "SkeletonRisingRespawn", Value = 5, Operator = IsEqual},
		BuildingInRange {X = 344, Y = 340, Range = 0}
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "SkeletonRisingRespawn"},
	},
}

Respawn
{
	X = 344, Y = 340, NoSpawnEffect = FALSE, WaitTime = 180, UnitId = 1302,
	Conditions = 
	{ 
		IsNpcCounter{Name = "SkeletonRisingRespawn", Value = 6, Operator = IsEqual},
		BuildingInRange {X = 344, Y = 340, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
