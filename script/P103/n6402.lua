function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)

BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Frösche laufen los wenn ihr Käfig geöffnet wurde und sie agro sind --

OnIdleGoHome
{
	X = 312 , Y = 386 , Direction = South , Range = 1 , WalkRange = 1 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoContinuous,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Froschangriff", UpdateInterval = 10},
	},
	Actions =
	{
		ChangeRace {Race = 153},
		SetGlobalFlagFalse{Name = "Froschangriff"},
		SetGlobalFlagTrue{Name = "Froschangriff_Punkt1"},
	}
}

OnIdleGoHome
{
	X = 310 , Y = 365 , Direction = South , Range = 1 , WalkRange = 1 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoContinuous,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "Froschangriff_Punkt1", UpdateInterval = 10},
		IsGlobalFlagFalse{Name = "Froschangriff", UpdateInterval = 10},
	},
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "Froschangriff_Punkt1"},
		SetGlobalFlagTrue{Name = "Froschangriff_Punkt2"},
	}
}
OnIdleGoHome
{
	X = 317 , Y = 303 , Direction = South , Range = 1 , WalkRange = 1 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoContinuous,
	Conditions = { 
		IsGlobalFlagTrue{Name = "Orkposten1_tot", UpdateInterval = 10},
	},
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "Froschangriff_Punkt2"},
		SetGlobalFlagTrue{Name = "Froschangriff_Punkt3"},
		SetGlobalFlagFalse{Name = "Orkposten1_tot"},
	}
}	

OnIdleGoHome
{
	X = 347 , Y = 227 , Direction = South , Range = 1 , WalkRange = 1 , WaitTime = 0 , WalkMode = Run , GotoMode = GotoContinuous,
	Conditions = { 
		IsGlobalFlagTrue{Name = "Orkposten2_tot", UpdateInterval = 10},
	},
	HomeActions =
	{
		SetGlobalFlagFalse{Name = "Froschangriff_Punkt3"},	
		SetGlobalFlagFalse{Name = "Orkposten2_tot"},

	}
}


EndDefinition()

end
