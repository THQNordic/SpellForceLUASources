function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 1}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 334, Y = 322, NoSpawnEffect = FALSE, WaitTime = 120,
	Conditions = 
	{ 
		BuildingInRange {X = 334, Y = 322, Range = 0}
	},
	Actions = 
	{
	},
}

Respawn
{
	X = 344, Y = 340, NoSpawnEffect = FALSE, WaitTime = 130,
	Conditions = 
	{ 
		Negated(BuildingInRange {X = 334, Y = 322, Range = 0}),
		BuildingInRange {X = 344, Y = 340, Range = 0}
	},
	Actions = 
	{
	},
}

Respawn
{
	X = 331, Y = 354, NoSpawnEffect = FALSE, WaitTime = 140,
	Conditions = 
	{ 
		Negated(BuildingInRange {X = 334, Y = 322, Range = 0}),
		Negated(BuildingInRange {X = 344, Y = 340, Range = 0}),
		BuildingInRange {X = 331, Y = 354, Range = 0}
	},
	Actions = 
	{
	},
}


Respawn
{
	X = 339, Y = 318, NoSpawnEffect = FALSE, WaitTime = 150,
	Conditions = 
	{ 	
		Negated(BuildingInRange {X = 334, Y = 322, Range = 0}),
		Negated(BuildingInRange {X = 344, Y = 340, Range = 0}),
		Negated(BuildingInRange {X = 331, Y = 354, Range = 0}),
		BuildingInRange {X = 339, Y = 318, Range = 0}
	},
	Actions = 
	{
	},
}


EndDefinition()

end
