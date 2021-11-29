-- Dracon, der Dunkelelfen Kriegsherr ...

-- erst spawnen wenn die letzten flüchtlinge aus dem portal sind
SpawnOnlyWhen
{
	X = PortalX, Y = PortalY, NoSpawnEffect = TRUE,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "EnoughFoodForDraconArmySpawning"},
	},
	Actions = 
	{
		--SetGlobalFlagTrue {Name = "DraconLebt"},
		IncreaseGlobalCounter {Name = "DraconWanderCounter"},
	},
}

--Dracon zieht ins Feld
OnIdleGoHome
{
	WalkMode = Run, X = 441, Y = 104, Direction = 0,
	Conditions =
	{
		IsGlobalCounter {Name = "DraconWanderCounter", Value = 1}
	},
	HomeActions =
	{
	}
}

-- Nun gehts zum Monument um es zu besetzen
OnIdleGoHome
{
	WalkMode = Run, X = 389, Y = 154, Direction = 0,
	Conditions =
	{
		IsGlobalCounter {Name = "DraconWanderCounter", Value = 2}
	},
	HomeActions =
	{
	}
}

-- Nun zu den Elfen
OnIdleGoHome
{
	WalkMode = Run, X = 237, Y = 183, Direction = 0,
	Conditions =
	{
		IsGlobalCounter {Name = "DraconWanderCounter", Value = 3}
	},
	HomeActions =
	{
	}
}


-- Nun zum Tor
OnIdleGoHome
{
	WalkMode = Run, X = 430, Y = 329, Direction = 0,
	Conditions =
	{
		IsGlobalCounter {Name = "DraconWanderCounter", Value = 4}
	},
	HomeActions =
	{
		IncreaseGlobalCounter {Name = "DraconWanderCounter"},
	}
}

-- Nun zur Garnison
OnIdleGoHome
{
	WalkMode = Run, X = 221, Y = 395, Direction = 0,
	Conditions =
	{
		IsGlobalCounter {Name = "DraconWanderCounter", Value = 5}
	},
	HomeActions =
	{
		IncreaseGlobalCounter {Name = "DraconWanderCounter"},
	}
}


Despawn
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "LenaGeht"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "DraconTauschen"},
	}
}

