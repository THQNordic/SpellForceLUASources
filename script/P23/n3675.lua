function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

-- !!! Buildingfakespawn, wegen Patroullie


Respawn
{
	X = succubus_SpawnX, Y = succubus_SpawnY, WaitTime = 240,
	Conditions =
	{
		BuildingInRange {X = 283, Y = 334, Range = 0},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "Respawn"},
	}
}



        
        
OnIdleGoHome
{       
	X = 316, Y = 233, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "SuccubiWegpunktZaehler", Value = 0},
		IsGlobalFlagTrue {Name = "AlleSuccubiZuHause"},
		
	},
	Actions =
	{
		SetNpcFlagFalse {Name = "Respawn"},
		SetGlobalTimeStamp {Name = "PausentimerSuccubi1"},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "SuccubiWegpunktZaehler"},
	}
}

OnIdleGoHome
{
	X = 222, Y = 241, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "SuccubiWegpunktZaehler", Value = 1},
		IsGlobalTimeElapsed {Name = "PausentimerSuccubi1", Seconds = 60}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "SuccubiWegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerSuccubi2"},
	}
}

OnIdleGoHome
{
	X = 319, Y = 232, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "SuccubiWegpunktZaehler", Value = 2},
		IsGlobalTimeElapsed {Name = "PausentimerSuccubi2", Seconds = 60}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "SuccubiWegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerSuccubi3"},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "PausentimerSuccubi3", Seconds = 60},
		IsNpcCounter {Name = "SuccubiWegpunktZaehler", Value = 3},
	},
	HomeActions =
	{
		ResetNpcCounter {Name = "PausentimerSuccubi1"},
		ResetNpcCounter {Name = "PausentimerSuccubi2"},
		ResetNpcCounter {Name = "PausentimerSuccubi3"},
		ResetNpcCounter {Name = "SuccubiWegpunktZaehler"},
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
