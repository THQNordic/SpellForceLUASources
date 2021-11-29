function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

WatchStateMachine()

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


----- Togo tötet Wolf ----

OnOneTimeEvent
{
	Conditions = 
	{
		Negated(IsGlobalCounter{Name = "TogoKillWolf", Value = 0, Operator = IsEqual}),
		FigureJob{}
	 },
	Actions = 
	{
		SetNpcFlagTrue{Name = "GoAndKillWolf"},
	},
}

-- Schritt 1: Wolf töten

OnOneTimeEvent
{
	Conditions = 
	{
		IsNpcFlagTrue{Name = "GoAndKillWolf", UpdateInterval = 10},
	 },
	Actions = 
	{
		Outcry { NpcId = 7205, String = "Oh! Mugwa spricht, Mugwa spricht!" , Tag = "ocTogo_P105_003" , Color = ColorWhite},
		AttackTarget {Target = 7231, NpcId = self, FriendlyFire = TRUE },
		IncreaseGlobalCounter{Name = "TogoKillWolf"},
		SetNpcFlagFalse{Name = "GoAndKillWolf"},
	},
}

-- Schritt 2: Fell abliefern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter{Name = "TogoKillWolf", Value = 2, Operator = IsEqual},
		Negated(FigureAlive{NpcId = 7231}), 
	 },
	Actions = 
	{
		 Goto{ X = LieferplatzX, Y = LieferplatzY, Range = 1, WalkMode = Run, GotoMode = GotoForced },
		 ResetGlobalCounter{Name = "TogoKillWolf"},
		 TransferItem{GiveItem = 4252 , Flag = Give},
		 SetGlobalFlagFalse{ Name = "P105_TrollsWorkingForMugwar"},
	},
}
----------------------------

------------------------------
-- Mächtigen Gegenstand abliefern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "P105_TrollsGiveMightyItem"},
	 },
	Actions = 
	{
		 Outcry { NpcId = 7205, String = "Oh! Mugwa spricht, Mugwa spricht!" , Tag = "ocTogo_P105_003" , Color = ColorWhite},
		 Goto{ X = LieferplatzX, Y = LieferplatzY, Range = 1, WalkMode = Walk, GotoMode = GotoForced },
		 TransferItem{GiveItem = 3600 , Flag = Give},
		 SetGlobalFlagTrue{Name = "P105_TrollsGiveMightyItem"},
		 SetPlayerFlagTrue{Name = "P105_GotMightyTrollItem"},
		 SetGlobalFlagFalse{ Name = "P105_TrollsWorkingForMugwar"},
	},
}
----------------------------

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
		 Outcry { NpcId = 7205, String = "Mugwa gesprochen, wir tun!" , Tag = "ocTogo_P105_004" , Color = ColorWhite},
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

----------------------------
-- Trolltanz
-- Troll läuft zum Punkt 1
OnIdleGoHome
{
	X = Trolltanz1X, Y = Trolltanz1Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 3, Operator = IsEqual},
		IsGlobalCounter{Name = "TogoKillWolf", Value = 0, Operator = IsEqual},
	},
}


-- Troll läuft zum Punkt 2
OnIdleGoHome
{
	X = Trolltanz2X, Y = Trolltanz2Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 4, Operator = IsEqual},
		IsGlobalCounter{Name = "TogoKillWolf", Value = 0, Operator = IsEqual},
	},
}

-- Troll läuft zum Punkt 3
OnIdleGoHome
{
	X = Trolltanz3X, Y = Trolltanz3Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 5, Operator = IsEqual},
		IsGlobalCounter{Name = "TogoKillWolf", Value = 0, Operator = IsEqual},
	},
}

-- Troll läuft zum Punkt 4
OnIdleGoHome
{
	X = Trolltanz4X, Y = Trolltanz4Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 6, Operator = IsEqual},
		IsGlobalCounter{Name = "TogoKillWolf", Value = 0, Operator = IsEqual},
	},
}

-- Troll läuft zum Punkt 5
OnIdleGoHome
{
	X = Trolltanz5X, Y = Trolltanz5Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 1, Operator = IsEqual},
		IsGlobalCounter{Name = "TogoKillWolf", Value = 0, Operator = IsEqual},
	},
}

-- Troll läuft zum Punkt 6
OnIdleGoHome
{
	X = Trolltanz6X, Y = Trolltanz6Y, Range = 2, WalkMode = Run,
	Conditions = 
	{
		IsGlobalCounter{Name = "Trolltanz", Value = 2, Operator = IsEqual},
		IsGlobalCounter{Name = "TogoKillWolf", Value = 0, Operator = IsEqual},
	},
	Actions = 
	{
		IncreaseNpcCounter{Name = "Outcrycounter"},
	},
}

----- Outcries: Togo weise!
OnEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "Outcrycounter", Value = 9, Operator = IsEqual},
	},
	Actions = 
	{
		Outcry { NpcId = 7205, String = "Mugwa groß, Mugwa weise! Mugwa machen Bäuche voll!" , Tag = "ocTogo_P105_001" , Color = ColorWhite},
		IncreaseNpcCounter{Name = "Outcrycounter"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsNpcCounter{Name = "Outcrycounter", Value = 10, Operator = IsEqual},
	},
	Actions = 
	{
		Outcry { NpcId = 7205, String = "Wir Mugwa dienen! Großer Mugwa, großer Mugwa!" , Tag = "ocTogo_P105_002" , Color = ColorWhite},
		ResetNpcCounter{Name = "Outcrycounter"},
	},
}

EndDefinition()
end