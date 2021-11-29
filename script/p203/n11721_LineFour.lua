function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Belagerung des Dorfs
--Ausrichten f�r die Blickrichtung und Respawnen so lange die entsprechende H�tte steht
     
OnPlatformOneTimeEvent
{
	Actions =
	{
		LookAtDirection {Direction = 4},
	}
}
-- Dritte Reihe    
Respawn
{
	X = 396, Y = 294,
	WaitTime = 90,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P203_BelagerungAbschnittVierKaputt"},
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