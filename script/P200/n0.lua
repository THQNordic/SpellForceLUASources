-- P200 ... Colosseum



----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile("script/P200/n32200_CutszeneRound1.lua") 
dofile("script/P200/n32201_CutszeneGoblinRennenGelb.lua") 
dofile("script/P200/n32202_CutszeneGoblinRennenGruen.lua") 
dofile("script/P200/n32203_CutszeneGoblinRennenBraun.lua") 
dofile("script/P200/n32204_CutszeneGoblinRennenRot.lua") 
dofile("script/P200/n0_ItemScript.lua")
dofile("script/Hadeko.lua")



--Vor der Startcutszene werden die Tore geschlossen.
OnOneTimeEvent
{
	Conditions =
	{
			
    },
	Actions =
	{
		SetEffect {Effect = "IndoorGateClose", X = 114, Y = 109, NpcId = 10497}, 
		SetEffect {Effect = "IndoorGateClose", X = 114, Y = 99, NpcId = 10498}, 
		SetGlobalFlagTrue {Name="g_sP200Obstkorb1start"}, --initialisierung von Hilfsvariablen für Obsthändler
		SetGlobalFlagTrue {Name = "g_sP200Obstkorb1And2start"},  --initialisierung von Hilfsvariablen für Obsthändler
		QuestBegin { QuestId = 1099},
		
	}
}

--Wenn der Spieler die Karte Betritt und die Quest 1078 aktiv ist.
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 1078, State = StateActive, UpdateInterval = 60}, 
    },
	Actions =
	{
		QuestSolve { QuestId = 1086}, 
	    QuestSolve { QuestId = 1078}, 
	}
}

--Nach Startcutszene werden die Tore wieder geschlossen.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200CutszeneRound1Ended"},		
    },
	Actions =
	{
		SetEffect {Effect = "IndoorGateClose", X = 114, Y = 109, NpcId = 10497}, 
		SetEffect {Effect = "IndoorGateClose", X = 114, Y = 99, NpcId = 10498}, 
		
	}
}


--Abfrage ob der Avatar die Arena betreten hat.
OnToggleEvent
{
	NotInDialog = FALSE,
	UpdateInterval = 10,
	OnConditions = 
	{
		FigureInRange {X = 130, Y = 128, NpcId = 0, Range = 10},
	},
	OnActions = 
	{
		SetGlobalFlagTrue {Name = "g_sP200AvatarInArena"},
	},
	OffConditions = 
	{
		ODER(FigureInRange {X = 105, Y = 128, NpcId = 0, Range = 2}, FigureInRange {X = 76, Y = 128, NpcId = 0, Range = 10}),
		
	},
	OffActions = 
	{
		SetGlobalFlagFalse {Name = "g_sP200AvatarInArena"},
	},
}



---_____________________________________________________________________
--I																		I
--I							  Obsthändler								I
--I_____________________________________________________________________I


--Dialoge mit den Obstschalen werden removed.
OnOneTimeEvent
{
	Conditions =
	{
		
    },
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9501"},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9502"},
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_9504"},
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_9346"}, --Sklavenhändler
	}
}


--Abfrage ob sich der Avatar beim Obsthänler heilende Früchte bestellt hat. Obstschale 1: 
OnToggleEvent
{
	NotInDialog = FALSE,
	UpdateInterval = 10,
	OnConditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Obstkorb1gefuellt"}, 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		
	},
	OnActions = 
	{
		ChangeObject {X = 117, Y = 156, Object = 3048},
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_9501"},
	},
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_sP200Obstkorb1gefuellt"}, 
		
	},
	OffActions = 
	{
		ChangeObject {X = 117, Y = 156, Object = 3045},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9501"},
	
	},
}

--Die Obstschale1 wird vom Avatar im Dialog geleert.
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200HeilendeFruechteGegessen1"},
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerGoblin1", Value = 0, Operator = IsEqual},
    },
	Actions =
	{
		ChangeObject {X = 117, Y = 156, Object = 3045},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9501"},
		SetGlobalFlagFalse{Name = "g_sP200Obstkorb1gefuellt"},
		SetGlobalFlagTrue {Name = "g_sP200heilGoblinSpawn"},
		SetGlobalFlagFalse {Name = "g_sP200Obstschale1Bestellt"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehlerGoblin1"},
	}
}

--Damit das Event immer nur einmal ausgeführt wird.
OnEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerGoblin1", Value = 1, Operator = IsGreaterOrEqual},	
		
    },
	Actions =
	{
		
		SetGlobalFlagFalse {Name = "g_sP200HeilendeFruechteGegessen1"},
		SetGlobalFlagTrue {Name = "g_sP200Obstkorb1start"},
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehlerGoblin1"},
		
	}
}

--Abfrage ob sich der Avatar beim Obsthänler heilende Früchte bestellt hat. Obstschale 2: 
OnToggleEvent
{
	NotInDialog = FALSE,
	UpdateInterval = 10,
	OnConditions = 
	{
		IsGlobalFlagTrue {Name = "g_sP200Obstkorb2gefuellt"}, 
		IsGlobalFlagTrue {Name = "g_sP200ArenaKampfStart"},
		
	},
	OnActions = 
	{
		ChangeObject {X = 144, Y = 99, Object = 3048},
		SetGlobalFlagTrue {Name = "PleaseEnableSideQuestDialog_9502"},
	},
	OffConditions = 
	{
		IsGlobalFlagFalse {Name = "g_sP200Obstkorb2gefuellt"}, 
		
	},
	OffActions = 
	{
		ChangeObject {X = 144, Y = 99, Object = 3045},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9502"},
		
	},
}

--Die Obstschale2 wird vom Avatar im Dialog geleert.
OnEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200HeilendeFruechteGegessen2"},
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerGoblin2", Value = 0, Operator = IsEqual},
    },
	Actions =
	{
		ChangeObject {X = 144, Y = 99, Object = 3045},
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9502"},
		SetGlobalFlagFalse{Name = "g_sP200Obstkorb2gefuellt"},
		SetGlobalFlagTrue {Name = "g_sP200heilGoblin2Spawn"},
		SetGlobalFlagFalse {Name = "g_sP2002ObstschalenBestellt"},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehlerGoblin2"},
		
	}
}


--Damit das Event immer nur einmal ausgeführt wird.
OnEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerGoblin2", Value = 1, Operator = IsGreaterOrEqual},	
		
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200Obstkorb1And2start"},
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehlerGoblin2"},
		SetGlobalFlagFalse {Name = "g_sP200HeilendeFruechteGegessen2"},
		
	}
}


--Handel mit dem Spieler beim Obsthändler.
OnEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerObst1", Value = 0, Operator = IsEqual},	
		IsGlobalFlagTrue {Name="g_sP200Obstschale1Bestellt"},
		PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0},
		IsGlobalFlagTrue {Name="g_sP200Obstkorb1start"},
    },
	Actions =
	{
		TransferMoney {Copper = 0, Silver = 0, Gold = 2000, Flag = Take},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehlerObst1"},
	}
}
--Damit dem Spieler nur einmal die Kohle abgezogen wird.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerObst1", Value = 1, Operator = IsGreaterOrEqual},	
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehlerObst1"},
		SetGlobalFlagTrue {Name = "g_sP200Obstkorb1gefuellt"},
		SetGlobalFlagFalse {Name = "g_sP200Obstkorb1start"},
	},
}

--Handel mit dem Spieler beim Obsthändler beide Schalen.
OnEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerObst2", Value = 0, Operator = IsEqual},	
		IsGlobalFlagTrue {Name="g_sP2002ObstschalenBestellt"},
		PlayerHasMoney {Gold = 3500, Silver = 0, Copper = 0},
		IsGlobalFlagTrue {Name = "g_sP200Obstkorb1And2start"},
    },
	Actions =
	{
		TransferMoney {Copper = 0, Silver = 0, Gold = 3500, Flag = Take},
		IncreaseGlobalCounter {Name = "g_cnP200OneTimeZaehlerObst2"},
	}
}
--Damit dem Spieler nur einmal die Kohle abgezogen wird.
OnEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "g_cnP200OneTimeZaehlerObst2", Value = 1, Operator = IsGreaterOrEqual},	
	},
	Actions = 
	{
		ResetGlobalCounter {Name = "g_cnP200OneTimeZaehlerObst2"},
		SetGlobalFlagTrue {Name = "g_sP200Obstkorb1gefuellt"},
		SetGlobalFlagTrue {Name = "g_sP200Obstkorb2gefuellt"},
		SetGlobalFlagFalse {Name = "g_sP200Obstkorb1And2start"},
		
	},
}



---_____________________________________________________________________
--I																		I
--I							Sklavenhändler								I
--I_____________________________________________________________________I

--Handel mit dem Spieler beim Sklavenhändler --> ZwergenTitan <--.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ZwergKaufen", UpdateInterval = 10},
		PlayerHasMoney {Gold = 2000, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200ZwergGekauft"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 2000, Flag = Take},
	}
}
--Handel mit dem Spieler beim Sklavenhändler --> OrkTitan <--.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200DemonKaufen", UpdateInterval = 10},
		PlayerHasMoney {Gold = 2500, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200DemonGekauft"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 2500, Flag = Take},
	}
}

--Handel mit dem Spieler beim Sklavenhändler --> DunkelElfenTitan <--.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200SpinneKaufen", UpdateInterval = 10},
		PlayerHasMoney {Gold = 3000, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200SpinneGekauft"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 3000, Flag = Take},
	}
}


--Handel mit dem Spieler beim Sklavenhändler --> MenschenTitan <--.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200GreifKaufen", UpdateInterval = 10},
		PlayerHasMoney {Gold = 4000, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200GreifGekauft"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 4000, Flag = Take},
	}
}

--Handel mit dem Spieler beim Sklavenhändler --> ElfenTitan <--.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200BaumKaufen", UpdateInterval = 10},
		PlayerHasMoney {Gold = 4500, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200BaumGekauft"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 4500, Flag = Take},
	}
}

--Handel mit dem Spieler beim Sklavenhändler --> TrollTitan <--.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200OgerKaufen", UpdateInterval = 10},
		PlayerHasMoney {Gold = 5000, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200OgerGekauft"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 5000, Flag = Take},
	}
}

--Wenn alle Titanen verkauft sind soll das Fragezeichen verschwinden.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200ZwergGekauft"},
		IsGlobalFlagTrue {Name = "g_sP200DemonGekauft"},
		IsGlobalFlagTrue {Name = "g_sP200SpinneGekauft"},
		IsGlobalFlagTrue {Name = "g_sP200GreifGekauft"},
		IsGlobalFlagTrue {Name = "g_sP200BaumGekauft"},
		IsGlobalFlagTrue {Name = "g_sP200OgerGekauft"},
		
    },
	Actions =
	{
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_9346"},
	}
}

----I---------------------------------------I
----I                                       I
----I           Bank von Empyria            I
----I           Schatzbrief-Zähler          I
----I         (muß auf alle Karten!)        I
----I                                       I
----I---------------------------------------I



OnEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 7357},
		IsGlobalTimeElapsed{Name = "g_SchatzbriefTimer", Seconds = 7000}
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "g_P204_SchatzbriefZins"},
		SetGlobalTimeStamp{Name = "g_SchatzbriefTimer"},
	}
}



							
EndDefinition()
end                 
                                      