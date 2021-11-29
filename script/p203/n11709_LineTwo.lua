function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

OnPlatformOneTimeEvent
{
	Actions =
	{
		LookAtDirection {Direction = 4},
	}
}
-- Zweite Reihe    
Respawn
{
	X = 374, Y = 272,
	WaitTime = 90,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P203_BelagerungAbschnittZweiKaputt"},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y,
	Direction = 4,
	WalkMode = Walk,
	Conditions =
	{
	}
}

EndDefinition()

end