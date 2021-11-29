function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


-- Troll an Lagerstaette
OnIdleGoHome
{
	X = (TrolllagerX+random(6)-3), Y = (TrolllagerY+random(6)-3), Range = 5, WalkMode = Run,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P105_TrolleAtLagerstaette"},
	},
	HomeActions = 
	{
	},
}

--------------------------------------------
----- Trolle hoch zum Portal schicken ----
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P105_TrollsGoToPortal"},
	 },
	Actions = 
	{
		 IncreaseNpcCounter{Name = "TrollGoToPortal"},
	},
}

-- Schritt 1: Zum Portal laufen

OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "TrollGoToPortal", Value = 1, Operator = IsEqual},
	 },
	Actions = 
	{
		 Goto{ X = PortalHerstellungX, Y = PortalHerstellungY, Range = 1, WalkMode = Run, GotoMode = GotoContinuous },
		 IncreaseNpcCounter{Name = "TrollGoToPortal"},
	},
}

-- Schritt 2: Wenn wieder zurück im Lager, WorkingFlag zurücksetzen
OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "TrollGoToPortal", Value = 2, Operator = IsEqual},
		FigureInRange{X = Trolltanz1X, Y = Trolltanz1Y, NpcId = self, Range = 10 },	
		IsGlobalFlagFalse{Name = "P105_TrollsDidPortalJob"},
	 },
	Actions = 
	{
		 ResetNpcCounter{Name = "TrollGoToPortal"},
		 SetGlobalFlagFalse{Name = "P105_TrollsGoToPortal"},
		 SetGlobalFlagFalse{ Name = "P105_TrollsWorkingForMugwar"},
		 SetGlobalFlagTrue{Name = "P105_TrollsDidPortalJob"},
	},
}
------------------------------------------
------------------------------------------


----------------------------------------------------------
----- Trolle in den Tod, d.h. die Elfenstadt schicken ----
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P105_TrollsGoToElfMassacre"},
	 },
	Actions = 
	{
		 Goto{ X = ElfenstadtMitteX, Y = ElfenstadtMitteX, Range = 5, WalkMode = Run, GotoMode = GotoContinuous },
	},
}
---------------------------------------------------------


-- Trolltanz
-- Troll läuft zum Punkt 1
OnIdleGoHome
{
	X = Trolltanz1X, Y = Trolltanz1Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 1, Operator = IsEqual},
	},
	HomeActions = 
	{
	},
}


-- Troll läuft zum Punkt 2
OnIdleGoHome
{
	X = Trolltanz2X, Y = Trolltanz2Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 2, Operator = IsEqual},
	},
	HomeActions = 
	{
	},
}

-- Troll läuft zum Punkt 3
OnIdleGoHome
{
	X = Trolltanz3X, Y = Trolltanz3Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 3, Operator = IsEqual},
	},
	HomeActions = 
	{
	},
}

-- Troll läuft zum Punkt 4
OnIdleGoHome
{
	X = Trolltanz4X, Y = Trolltanz4Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 4, Operator = IsEqual},
	},
	HomeActions = 
	{
	},
}

-- Troll läuft zum Punkt 5
OnIdleGoHome
{
	X = Trolltanz5X, Y = Trolltanz5Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 5, Operator = IsEqual},
	},
	HomeActions = 
	{
	},
}

-- Troll läuft zum Punkt 6
OnIdleGoHome
{
	X = Trolltanz6X, Y = Trolltanz6Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 6, Operator = IsEqual},
	},
	HomeActions = 
	{
	},
}

EndDefinition()
end