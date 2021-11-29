function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type, _PlatformId, _NpcId, _X, _Y)

Respawn
{
	X = 194, Y = 177, WaitTime = 180,
	Conditions =
	{
		BuildingInRange {X = 197, Y = 176, Range = 0},
	},
	Actions =
	{
		SetNpcFlagTrue {Name = "Respawn"},
	}
}



        
        
OnIdleGoHome
{       
	X = 207, Y = 267, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "WegpunktZaehler", Value = 0},
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "WegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerDaemonen1"},
	}
}

OnIdleGoHome
{
	X = 292, Y = 159, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "WegpunktZaehler", Value = 1},
		IsGlobalTimeElapsed {Name = "PausentimerDaemonen1", Seconds = 90}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "WegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerDaemonen2"},
	}
}

OnIdleGoHome
{
	X = 298, Y = 292, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "WegpunktZaehler", Value = 2},
		IsGlobalTimeElapsed {Name = "PausentimerDaemonen2", Seconds = 90}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "WegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerDaemonen3"},
	}
}

OnIdleGoHome
{
	X = 300, Y = 160, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsNpcCounter {Name = "WegpunktZaehler", Value = 3},
		IsGlobalTimeElapsed {Name = "PausentimerDaemonen3", Seconds = 90}, 
	},
	HomeActions =
	{
		IncreaseNpcCounter {Name = "WegpunktZaehler"},
		SetGlobalTimeStamp {Name = "PausentimerDaemonen4"},
	}
}

OnIdleGoHome
{
	X = _X, Y = _Y, Direction = random(0,7), Range = 2,
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "PausentimerDaemonen4", Seconds = 90},
		IsNpcCounter {Name = "WegpunktZaehler", Value = 4},
	},
	HomeActions =
	{
		ResetNpcCounter {Name = "WegpunktZaehler"},
		ResetNpcCounter {Name = "PausentimerDaemonen1"},
		ResetNpcCounter {Name = "PausentimerDaemonen2"},
		ResetNpcCounter {Name = "PausentimerDaemonen3"},
		ResetNpcCounter {Name = "PausentimerDaemonen4"},
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
