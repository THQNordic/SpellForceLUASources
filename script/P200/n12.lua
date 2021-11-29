-- P200 ... Collosseum



----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

KillScript
{
	Conditions = 
	{
		FigureDead {NpcId = 11416},
		IsGlobalFlagTrue {Name = "g_sP200RndZahlErmittelt"},
	},
	Actions = 
	{
	
	},
}


---_____________________________________________________________________
--I																		I
--I							  Goblin Rennen								I
--I_____________________________________________________________________I

OnOneTimeEvent
{
	Conditions =
	{
	
    },
	Actions =
	{
		RandomizeGlobalCounter {Name = "P200TestCounter", MaxValue = 3}, 
		
		
	}
}


--Random Berechnung, welcher Goblin gewinnt.
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_sP200GelberGoblinKaufen", UpdateInterval = 60},
			IsGlobalFlagTrue {Name = "g_sP200GruenerGoblinKaufen", UpdateInterval = 60},
			IsGlobalFlagTrue {Name = "g_sP200BraunerGoblinKaufen", UpdateInterval = 60},
			IsGlobalFlagTrue {Name = "g_sP200RoterGoblinKaufen", UpdateInterval = 60},
		},
    },
	Actions =
	{
		RandomizeGlobalCounter {Name = "g_csP200RndGoblinRennen", MaxValue = 3}, 
		SetGlobalFlagTrue {Name = "g_sP200RndZahlErmittelt"},
		
	}
}

--Start der Cutszene je nach RndZahl. CutszeneStart Gelb.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
		IsGlobalCounter {Name = "g_csP200RndGoblinRennen", Value = 0, Operator = IsEqual, UpdateInterval = 60},
	
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200CutszeneGelbStart"},
	}
}

--Start der Cutszene je nach RndZahl. CutszeneStart Grün.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
		IsGlobalCounter {Name = "g_csP200RndGoblinRennen", Value = 1, Operator = IsEqual, UpdateInterval = 60},
		
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200CutszeneGruenStart"},
	}
}

--Start der Cutszene je nach RndZahl. CutszeneStart Braun.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
		IsGlobalCounter {Name = "g_csP200RndGoblinRennen", Value = 2, Operator = IsEqual, UpdateInterval = 60},
		
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200CutszeneBraunStart"},
	}
}

--Start der Cutszene je nach RndZahl. CutszeneStart Rot.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
		IsGlobalCounter {Name = "g_csP200RndGoblinRennen", Value = 3, Operator = IsEqual, UpdateInterval = 60},
		
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200CutszeneRotStart"},
	}
}

--Abfrage ob alle Sportler Goblins gespawned sind.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200GoblinGelbRennAufstellung", UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_sP200GoblinGruenRennAufstellung", UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_sP200GoblinBraunRennAufstellung", UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_sP200GoblinRotRennAufstellung", UpdateInterval = 60},	
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
    },
	Actions =
	{
		
		SetGlobalFlagTrue{Name = "g_sP200GoblinUmwandlung"},
	}
}

--Random Berechnung Abfrage: 0 = Gelb 105, Grün = 100, Braun = 100, Rot = 100.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_csP200RndGoblinRennen", Value = 0, Operator = IsEqual, UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_sP200GoblinUmwandlung", UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
    },
	Actions =
	{
		ChangeUnit{ Unit = 2740, NpcId = 11417, ChangeLevel = FALSE}, --Gelb
		ChangeUnit{ Unit = 2746, NpcId = 11418, ChangeLevel = FALSE}, --Grün
		ChangeUnit{ Unit = 2749, NpcId = 11419, ChangeLevel = FALSE}, --Braun
		ChangeUnit{ Unit = 2754, NpcId = 11420, ChangeLevel = FALSE}, --Rot
		--Outcry{NpcId = 11416, String = "Gelb Gewinnt!" , Tag = "" , Delay = TRUE , Color = ColorWhite},
		SetGlobalTimeStamp{Name = "g_sP200GoblinStartbereit"},
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenGelbGewinnt"},
	}
}

--Random Berechnung Abfrage: 3 = Gelb 100, Grün = 108, Braun = 100, Rot = 100.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_csP200RndGoblinRennen", Value = 1, Operator = IsEqual, UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_sP200GoblinUmwandlung", UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
    },
	Actions =
	{
		ChangeUnit{ Unit = 2741, NpcId = 11417, ChangeLevel = FALSE}, --Gelb
		ChangeUnit{ Unit = 2745, NpcId = 11418, ChangeLevel = FALSE}, --Grün
		ChangeUnit{ Unit = 2749, NpcId = 11419, ChangeLevel = FALSE}, --Braun
		ChangeUnit{ Unit = 2754, NpcId = 11420, ChangeLevel = FALSE}, --Rot
		--Outcry{NpcId = 11416, String = "Grün Gewinnt!" , Tag = "" , Delay = TRUE , Color = ColorWhite},
		SetGlobalTimeStamp{Name = "g_sP200GoblinStartbereit"},
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenGruenGewinnt"},
	}
}

--Random Berechnung Abfrage: 2 = Gelb 100, Grün = 100, Braun = 108, Rot = 100.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_csP200RndGoblinRennen", Value = 2, Operator = IsEqual, UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_sP200GoblinUmwandlung", UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
    },
	Actions =
	{
		ChangeUnit{ Unit = 2741, NpcId = 11417, ChangeLevel = FALSE}, --Gelb
		ChangeUnit{ Unit = 2746, NpcId = 11418, ChangeLevel = FALSE}, --Grün
		ChangeUnit{ Unit = 2750, NpcId = 11419, ChangeLevel = FALSE}, --Braun
		ChangeUnit{ Unit = 2754, NpcId = 11420, ChangeLevel = FALSE}, --Rot
		--Outcry{NpcId = 11416, String = "Braun Gewinnt!" , Tag = "" , Delay = TRUE , Color = ColorWhite},
		SetGlobalTimeStamp{Name = "g_sP200GoblinStartbereit"},
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenBraunGewinnt"},
	}
}

--Random Berechnung Abfrage: 1 = Gelb 100, Grün = 100, Braun = 100, Rot = 108.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "g_csP200RndGoblinRennen", Value = 3, Operator = IsEqual, UpdateInterval = 60},
		IsGlobalFlagTrue {Name = "g_sP200GoblinUmwandlung", UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_sP200RndZahlErmittelt", UpdateInterval = 60},
    },
	Actions =
	{
		ChangeUnit{ Unit = 2741, NpcId = 11417, ChangeLevel = FALSE}, --Gelb
		ChangeUnit{ Unit = 2746, NpcId = 11418, ChangeLevel = FALSE}, --Grün
		ChangeUnit{ Unit = 2749, NpcId = 11419, ChangeLevel = FALSE}, --Braun
		ChangeUnit{ Unit = 2753, NpcId = 11420, ChangeLevel = FALSE}, --Rot
		--Outcry{NpcId = 11416, String = "Rot Gewinnt!" , Tag = "" , Delay = TRUE , Color = ColorWhite},
		SetGlobalTimeStamp{Name = "g_sP200GoblinStartbereit"},
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenRotGewinnt"},
	}
}


--Zeitschleife damit alle Sportler Goblins umgewandelt sind.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_sP200GoblinStartbereit", Seconds = 3, UpdateInterval = 60}, 	
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennAufstellung"},
		
	}
}



--Der Dialog mit dem GoblinHändler wird gesperrt sobald das Goblinrennen einmal stattgefunden hat, oder der Spieler seine Kampfrunde in der Arena nicht beendet hat.
OnToggleEvent
{
	NotInDialog = FALSE,
	UpdateInterval = 15,
	OnConditions = 
	{
		IsGlobalFlagFalse{Name = "g_sP200ArenaKampfStart"}, 
		IsGlobalFlagFalse {Name = "g_sP209CutszeneGoblinRennenEnded"},
		IsGlobalFlagFalse{Name = "g_sP200GoblinRennenStart"},
			
	},
	OnActions = 
	{
		SetGlobalFlagTrue{Name = "PleaseEnableSideQuestDialog_11416"},
	},
	OffConditions = 
	{
		ODER9
		{ 
			IsGlobalFlagTrue{Name = "g_sP200ArenaKampfStart"},
			IsGlobalFlagTrue{Name = "g_sP200GoblinRennenStart"},		
		}
	},
	OffActions = 
	{
		
		SetGlobalFlagTrue{Name = "PleaseRemoveDialog_11416"},
	},
}


--Der Spieler wettet auf den Gelben Goblin. Ihm wird der Wetteinsatz abgezogen.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name="g_sP200GelberGoblinKaufen", UpdateInterval = 30},
		PlayerHasMoney {Gold = 500, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200WetteGelberGoblin"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 500, Flag = Take},
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenStart"},
	}
}

--Der Spieler wettet auf den Grünen Goblin. Ihm wird der Wetteinsatz abgezogen.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name="g_sP200GruenerGoblinKaufen", UpdateInterval = 30},
		PlayerHasMoney {Gold = 500, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200WetteGruenerGoblin"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 500, Flag = Take},
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenStart"},
	}
}

--Der Spieler wettet auf den Braunen Goblin. Ihm wird der Wetteinsatz abgezogen.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name="g_sP200BraunerGoblinKaufen", UpdateInterval = 30},
		PlayerHasMoney {Gold = 500, Silver = 0, Copper = 0},
						

    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200WetteBraunerGoblin"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 500, Flag = Take},
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenStart"},
	}
}

--Der Spieler wettet auf den Roten Goblin. Ihm wird der Wetteinsatz abgezogen.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name="g_sP200RoterGoblinKaufen", UpdateInterval = 30},
		PlayerHasMoney {Gold = 500, Silver = 0, Copper = 0},
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200WetteRoterGoblin"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 500, Flag = Take},
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenStart"},
	}
}

--Das Ende des Rennens wird ermittelt.
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange { X = 152, Y = 110, NpcId = 11417, Range = 3}, --Gelb
		FigureInRange { X = 153, Y = 110, NpcId = 11418, Range = 3}, --Grün
		FigureInRange { X = 154, Y = 110, NpcId = 11419, Range = 3}, --Braun
		FigureInRange { X = 155, Y = 110, NpcId = 11420, Range = 3}, --Rot
		IsGlobalFlagTrue {Name = "g_sP200GoblinRennAufstellung"},
		
    },
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_sP200GoblinRennenBeendet"},
		SetGlobalTimeStamp {Name = "g_tsWarteZeitDespawnGoblins"},
	}
}

--Es wird überprüft ob der Spieler gewonnen hat, wenn ja dann bekommt er seine Belohnung.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200GoblinRennenBeendet"},
		IsGlobalFlagTrue {Name = "g_sP209CutszeneGoblinRennenEnded"},
		ODER9
		{
			UND(IsGlobalFlagTrue {Name = "g_sP200WetteBraunerGoblin"}, IsGlobalFlagTrue {Name = "g_sP200GoblinRennenBraunGewinnt"}),
			UND(IsGlobalFlagTrue {Name = "g_sP200WetteRoterGoblin"}, IsGlobalFlagTrue {Name = "g_sP200GoblinRennenRotGewinnt"}),
			UND(IsGlobalFlagTrue {Name = "g_sP200WetteGruenerGoblin"}, IsGlobalFlagTrue {Name = "g_sP200GoblinRennenGruenGewinnt"}),
			UND(IsGlobalFlagTrue {Name = "g_sP200WetteGelberGoblin"}, IsGlobalFlagTrue {Name = "g_sP200GoblinRennenGelbGewinnt"}),
		},
    },
	Actions =
	{
		Outcry{NpcId = 11416, String = "Nein verdammt! Der Runenkrieger hat gewonnen! Ich bin Pleite! Verflixt!" , Tag = "oca2racemasterP200_002" , Delay = TRUE , Color = ColorWhite},
		Goto {X = 72, Y = 128, NpcId = 11416, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},	
		SetGlobalFlagTrue {Name = "g_sP200WetteGewonnen"},
		TransferMoney {Copper = 0, Silver = 0, Gold = 5000, Flag = Give},
		SetRewardFlagTrue { Name = "GoblinRennen" },	
	}
}

--Kleine Zeitschleife damit die vorige Bedingung mit sicherheit vollständig geprüft wird.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_sP200GoblinRennenBeendet"},
		IsGlobalFlagTrue {Name = "g_sP209CutszeneGoblinRennenEnded"},
		
    },
	Actions =
	{
		SetGlobalTimeStamp {Name = "g_tsP200ZeitschleifeRennen"},
	}
}

--Es wird überprüft ob der Spieler gewonnen hat, wenn ja dann bekommt er seine Belohnung.
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_tsP200ZeitschleifeRennen", Seconds = 2, UpdateInterval = 60}, 
		IsGlobalFlagFalse {Name = "g_sP200WetteGewonnen"},
    },
	Actions =
	{
		Outcry{NpcId = 11416, String = "Ja! Und 500 Goldstücke reicher! Ich liebe dieses Rennen!" , Tag = "oca2racemasterP200_003" , Delay = TRUE , Color = ColorWhite},
		Goto {X = 72, Y = 128, NpcId = 11416, Range = 1, WalkMode = Walk, GotoMode = GotoNormal},	
	}
}
						
EndDefinition()
end                 
                                      