function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END


Respawn
{
	X = 130, Y = 300, NoSpawnEffect = FALSE, WaitTime = 90,
	Conditions = 
	{ 
		BuildingInRange {X = 130, Y = 300, Range = 0}
	},
	Actions = 
	{
	},
}

Respawn
{
	X = 138, Y = 272, NoSpawnEffect = FALSE, WaitTime = 100,
	Conditions = 
	{ 
		Negated(BuildingInRange {X = 130, Y = 300, Range = 0}),
		BuildingInRange {X = 138, Y = 272, Range = 0}
	},
	Actions = 
	{
	},
}

Respawn
{
	X = 109, Y = 300, NoSpawnEffect = FALSE, WaitTime = 110,
	Conditions = 
	{ 
		Negated(BuildingInRange {X = 130, Y = 300, Range = 0}),
		Negated(BuildingInRange {X = 138, Y = 272, Range = 0}),
		BuildingInRange {X = 109, Y = 300, Range = 0}
	},
	Actions = 
	{
	},
}


Respawn
{
	X = 112, Y = 269, NoSpawnEffect = FALSE, WaitTime = 120,
	Conditions = 
	{ 
		Negated(BuildingInRange {X = 130, Y = 300, Range = 0}),
		Negated(BuildingInRange {X = 138, Y = 272, Range = 0}),
		Negated(BuildingInRange {X = 109, Y = 300, Range = 0}),
		BuildingInRange {X = 112, Y = 269, Range = 0}
	},
	Actions = 
	{
	},
}

EndDefinition()

end
