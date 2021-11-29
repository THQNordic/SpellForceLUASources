function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

SpawnOnlyWhen
{
	X = 113, Y = 249, NoSpawnEffect = FALSE,
	Conditions = 
	{ 
		BuildingInRange {X = 113, Y = 249, Range = 0},
		IsGlobalCounter{Name = "P210_Room4SkelCounter", Value = 2, Operator = IsEqual},
	},
	Actions = 
	{
	},
}


Respawn
{
	X = 113, Y = 249, NoSpawnEffect = FALSE, WaitTime = 60,
	Conditions = 
	{ 
		BuildingInRange {X = 113, Y = 249, Range = 0},
		Negated(IsNpcCounter{Name = "PersonalRespawn", Value = 5, Operator = IsGreaterOrEqual}),
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "PersonalRespawn"},
	},
}



EndDefinition()

end
