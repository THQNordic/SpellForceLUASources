function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
OnPlatformOneTimeEvent
{
	Actions =
	{
		LookAtDirection {Direction = 4},
	}
} 
-- Erste Reihe    
Respawn
{
	X = 399, Y = 270,
	WaitTime = 90,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P203_BelagerungAbschnittEinsKaputt"},
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