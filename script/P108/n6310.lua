function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

--!EDS ONIDLEGOHOME BEGIN
OnIdleGoHome{WalkMode = Walk, X = _X, Y = _Y, Direction = 3}
--!EDS ONIDLEGOHOME END
-- Schnitter



OnOneTimeEvent 
{
	Conditions =
	{
		FigureHasHealth {Percent = 50},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WaechterEinsSpawnenP108"},
		SetGlobalFlagTrue {Name = "WaechterZweiSpawnenP108"},
	}
	
}

OnOneTimeEvent 
{
	Conditions =
	{
		FigureHasHealth {Percent = 25},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WaechterDreiSpawnenP108"},
		SetGlobalFlagTrue {Name = "WaechterVierSpawnenP108"},
	}
	
}

Respawn
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE, WaitTime = 1,
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "IchWerdeNieWahr"},
	},
	DeathActions = 
	{
		SetGlobalFlagTrue{Name = "WaechterSterben"},
	},
}

EndDefinition()

end
