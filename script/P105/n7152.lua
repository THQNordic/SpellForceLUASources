function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- nur spawnen wenn FleeToIce überlebt
SpawnOnlyWhen
{
	X = _X, Y = _Y, NoSpawnEffect = TRUE,
	Conditions = { 
		IsGlobalCounter{Name = "SavedFugees", Value = FugiNumber[(_NpcId)-7133], Operator = IsGreaterOrEqual},
	},
}

-- Fugis laufen los
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 0, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "FugisGo"},
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- Fugis laufen zum Elfentor
OnIdleGoHome
{
	X = Fugis1X, Y = Fugis1Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 1, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint1"},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- Fugis laufen auf Pfadstelle hinter Elfentor (Kosmetik, da sie sonst quer über Schnee laufen)
OnIdleGoHome
{
	X = Fugis1aX, Y = Fugis1aY, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 2, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_SouthTorAuf" },
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}

-- nun gehen die Flüchtlinge zur Eistempelfalle
OnIdleGoHome
{
	X = Fugis2X, Y = Fugis2Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 3, Operator = IsEqual},
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint2"},
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}


-- Bei Angriff der Eiselementare warten sie oben im Norden
OnIdleGoHome
{
	X = Fugis2aX, Y = Fugis2aY, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 4, Operator = IsEqual},
	},
}

-- Fugis warten, bis der Spieler den Eistempel plattmacht
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 4, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_IcetempleDestroyed" },
		IsGlobalFlagTrue{ Name = "P105_PlayerReachedPoint3"},
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
	},
}


-- nun gehen die Flüchtlinge vor die Stadt
OnIdleGoHome
{
	X = Fugis3X, Y = Fugis3Y, Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 5, Operator = IsEqual},
		
	},
	HomeActions = 
	{
		IncreaseNpcCounter{Name = "FugisWalkPath"},
		SetNpcFlagTrue { Name = "P105_IGotHome" },
	},
}

-- nun gehen die Flüchtlinge in die Stadt
OnIdleGoHome
{
	X = Fugis4X[(_NpcId)-7133], Y = Fugis4Y[(_NpcId)-7133], Range = 4, WalkMode = Walk,
	Conditions = 
	{
		IsNpcCounter{Name = "FugisWalkPath", Value = 6, Operator = IsEqual},
		IsGlobalFlagTrue { Name = "P105_WestTorAuf" },
	},
}

--------- Finaler Zähler: Npc hat überlebt
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcFlagTrue { Name = "P105_IGotHome" },
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_CountTheSurvivors"},
	},
}

EndDefinition()
end