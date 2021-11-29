function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome
{
	WalkMode = Walk, Direction = 2,
	X = _X, Y = _Y,
	Conditions =
	{
		Negated (IsGlobalFlagTrue {Name = "OrcFeuerBarriere"}),
	}
}

-- Nach der Cutscene bilden die Orc eine Feuerblockereinheit
OnIdleGoHome
{
	WalkMode = Walk, Direction = 2,
	 X = 418, Y = 227, 
	 Conditions =
	 {
	 	IsGlobalFlagTrue {Name = "OrcFeuerBarriere"},
	 }
}
--!EDS ONIDLEGOHOME END

-- !!! Fake Respawn für Militäreinheiten oben an den Feuertürmen

Respawn
{
	WaitTime = 150, X = 412, Y = 290, 
	Conditions =
	{
		IsGlobalFlagTrue {Name = "WildlandpassFeuerFakeSpawn"},
	}
}

EndDefinition()

end
