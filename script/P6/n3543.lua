function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 2}
--!EDS ONIDLEGOHOME END

-- !!! Fake Respawn f�r Milit�reinheiten oben an den Feuert�rmen

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
