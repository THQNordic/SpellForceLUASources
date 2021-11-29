function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END

Respawn
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 1,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "SpawnUramP108"},
		IsGlobalFlagFalse {Name = "NurEinmalP108"},
	},
	DeathActions = 
	{
		SetGlobalFlagTrue {Name = "NurEinmalP108"},
	},
}

EndDefinition()

end
