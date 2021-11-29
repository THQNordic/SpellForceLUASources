function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- !!! Buildingfakespawn, wegen Patroullie


Respawn
{
	X = basilisk_SpawnX, Y = basilisk_SpawnY, WaitTime = 150,
	Conditions =
	{
		BuildingInRange {X = 207, Y = 310, Range = 0},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "Respawn"},
	}
}



        
        
OnIdleGoHome
{       
	X = 322, Y = 176, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "BasiliskWegpunktZaehler", Value = 0},
		IsGlobalFlagTrue {Name = "AlleBasiliskZuHause"},
		
	},
	Actions =
	{
		SetNpcFlagFalse {Name = "Respawn"},
		SetGlobalTimeStamp {Name = "PausentimerBasilisk1"},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "BasiliskWegpunktZaehler"},
	}
}

OnIdleGoHome
{
	X = 377, Y = 201, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "BasiliskWegpunktZaehler", Value = 1},
		IsGlobalTimeElapsed {Name = "PausentimerBasilisk1", Seconds = 120}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "BasiliskWegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerBasilisk2"},
	}
}

OnIdleGoHome
{
	X = 133, Y = 275, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "BasiliskWegpunktZaehler", Value = 2},
		IsGlobalTimeElapsed {Name = "PausentimerBasilisk2", Seconds = 120}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "BasiliskWegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerBasilisk3"},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "PausentimerBasilisk3", Seconds = 120},
		IsNpcCounter {Name = "BasiliskWegpunktZaehler", Value = 3},
	},
	HomeActions =
	{
		ResetNpcCounter {Name = "PausentimerBasilisk1"},
		ResetNpcCounter {Name = "PausentimerBasilisk2"},
		ResetNpcCounter {Name = "PausentimerBasilisk3"},
		ResetNpcCounter {Name = "BasiliskWegpunktZaehler"},
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
