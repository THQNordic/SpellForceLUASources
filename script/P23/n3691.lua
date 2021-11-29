function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- !!! Buildingfakespawn, wegen Patroullie

SpawnOnlyWhen
{
	X = daemonenII_SpawnX, Y = daemonenII_SpawnY,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "Q310StartRevengeAttack"},
	}
}


Respawn
{
	X = daemonenII_SpawnX, Y = daemonenII_SpawnY, WaitTime = 150,
	Conditions =
	{
		BuildingInRange {X = 133, Y = 182, Range = 0},
		IsGlobalFlagTrue{Name = "Q310StartRevengeAttack"},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "Respawn"},
	}
}


OnIdleGoHome
{       
	X = 150, Y = 292, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "DaemonIIWegpunktZaehler", Value = 0},
		IsGlobalFlagTrue {Name = "AlleDaemonIIZuHause"},
		
	},
	Actions =
	{
		SetNpcFlagFalse {Name = "Respawn"},
		SetGlobalTimeStamp {Name = "PausentimerDaemonII1"},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "DaemonIIWegpunktZaehler"},
	}
}

OnIdleGoHome
{
	X = 320, Y = 175, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "DaemonIIWegpunktZaehler", Value = 1},
		IsGlobalTimeElapsed {Name = "PausentimerDaemonII1", Seconds = 60}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "DaemonIIWegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerDaemonII2"},
	}
}

OnIdleGoHome
{
	X = 206, Y = 266, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "DaemonIIWegpunktZaehler", Value = 2},
		IsGlobalTimeElapsed {Name = "PausentimerDaemonII2", Seconds = 60}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "DaemonIIWegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerDaemonII3"},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "PausentimerDaemonII3", Seconds = 60},
		IsNpcCounter {Name = "DaemonIIWegpunktZaehler", Value = 3},
	},
	HomeActions =
	{
		ResetNpcCounter {Name = "PausentimerDaemonII1"},
		ResetNpcCounter {Name = "PausentimerDaemonII2"},
		ResetNpcCounter {Name = "PausentimerDaemonII3"},
		ResetNpcCounter {Name = "DaemonIIWegpunktZaehler"},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcFlagTrue {Name = "Respawn"},
	},
	HomeActions =
	{
		SetNpcFlagFalse {Name = "Respawn"},
	}
}

EndDefinition()

end
