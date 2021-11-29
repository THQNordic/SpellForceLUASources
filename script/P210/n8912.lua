function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = 307, Y = 281, NoSpawnEffect = FALSE, WaitTime = 120,
	Conditions = 
	{ 
		Negated(IsNpcCounter{Name = "PersonalRespawn", Value = 10, Operator = IsGreaterOrEqual}),
		Negated(FigureDead { NpcId = 8907 }),
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "PersonalRespawn"},
	},
}

EndDefinition()

end
