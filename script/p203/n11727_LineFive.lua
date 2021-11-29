function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)
-- Belagerung des Dorfs
--Ausrichten f�r die Blickrichtung und Respawnen so lange die entsprechende H�tte steht
     
OnPlatformOneTimeEvent
{
	Actions =
	{
		LookAtDirection {Direction = 0},
	}
}
-- Dritte Reihe    
Respawn
{
	X = 396, Y = 277,
	WaitTime = 90,
	NoSpawnEffect = FALSE,
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_P203_BelagerungAbschnittFuenfKaputt"},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y,
	Direction = 0,
	WalkMode = Walk,
	Conditions =
	{
	}
}

EndDefinition()

end