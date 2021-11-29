-- P110 ... Fire City



--TierSpawning
TierSpawning = 250

--Zeitdauer der Angriffswellen der Mondkrieger
AngriffsZeitenMond = 350


--Zeitdauer der Angriffswellen der Sonnenkrieger
AngriffsZeitenSonne = 350

--Zeitdauer der Angriffswellen der Sternkrieger
AngriffsZeitenStar = 180




----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- cutscene rename
--dofile("script/p110/n6046_CutsceneEntry.lua") 
--dofile("script/p110/n6555_CutsceneGrimQuestioning.lua")  

dofile("script/p110/n32017_CutsceneEntry.lua") 
dofile("script/p110/n32018_CutsceneGrimQuestioning.lua")  



dofile("script/p110/n0_ItemScript.lua")
dofile("script/FahrendeHaendler.lua")


--Rewards
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "StopRespawnStarP110"}
		
    },
	Actions =
	{
		SetRewardFlagTrue { Name = "SternstadtZerstoert" },
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "StopRespawnMoonP110"}
		
    },
	Actions =
	{
		SetRewardFlagTrue { Name = "MondstadtZerstoert" },
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "StopRespawnSunP110"}
		
    },
	Actions =
	{
		SetRewardFlagTrue { Name = "SonnenstadtZerstoert" },
	}
}


-- Craigs Armee wechselt in den Besitz des Spielers
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "P110_DialogCraigEnded"}, --Wenn Dialog mit Craig beendet ist, werden die Einheiten umgefärbt
  	},
	Actions =
	{
	RevealUnExplored { X = 129 , Y = 334, Range = 10 },	
	ChangeFigureOwner { NpcId = 5994},
	ChangeFigureOwner { NpcId = 5995},
	ChangeFigureOwner { NpcId = 5996},
	ChangeFigureOwner { NpcId = 6004},
	ChangeFigureOwner { NpcId = 6005},
	ChangeFigureOwner { NpcId = 6006},
	ChangeFigureOwner { NpcId = 6007},
	ChangeFigureOwner { NpcId = 6020},
	ChangeFigureOwner { NpcId = 6021},
	ChangeFigureOwner { NpcId = 6028},
	ChangeFigureOwner { NpcId = 6029},
	--ChangeRace { Race = 139, NpcId = 5994},
	--ChangeRace { Race = 139, NpcId = 5995},
	--ChangeRace { Race = 139, NpcId = 5996},
	--ChangeRace { Race = 139, NpcId = 6004},
	--ChangeRace { Race = 139, NpcId = 6005},
	--ChangeRace { Race = 139, NpcId = 6006},
	--ChangeRace { Race = 139, NpcId = 6007},
	--ChangeRace { Race = 139, NpcId = 6020},
	--ChangeRace { Race = 139, NpcId = 6021},
	--ChangeRace { Race = 139, NpcId = 6028},
	--ChangeRace { Race = 139, NpcId = 6029},
	RevealUnExplored { X = 137 , Y = 250, Range = 8 },	
	SetRewardFlagTrue { Name = "P110KarteErreicht" },	
	--ChangeFigureOwner { NpcId = 6046},
	
	
	}
}


--AngriffsWellen der Mond -und SonnenTruppen sobald der Dialog mit Craig beendet wurde
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{ Name = "P110_DialogCraigEnded"},
		
    },
	Actions =
	{
		SetGlobalTimeStamp{Name = "AngriffsZeitAngenommenP110"},
		SetGlobalFlagTrue {Name = "AngriffeAngenommenP110"},
		SetGlobalTimeStamp{Name = "AngriffsZeitAbgelehntP110"},
		SetGlobalFlagTrue {Name = "AngriffeAbgelehntP110"},
		SetGlobalTimeStamp{Name = "AngriffsZeitStarP110"},
	}
}


--Moon Units greifen an (AngriffsWelle mit 5 Units)

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalFlagFalse { Name = "MondTruppenIdleGoHomeStartP110"},
		IsGlobalTimeElapsed { Name = "AngriffsZeitAbgelehntP110", Seconds = AngriffsZeitenMond, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerP110Abgelehnt", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
	},
	Actions =	
	{
		ClearGlobalTimeStamp{ Name = "AngriffsZeitAbgelehntP110"},
		Goto { X = 125 , Y = 337 , NpcId = 6557 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		Goto { X = 125 , Y = 337 , NpcId = 6558 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6559 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6560 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6561 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		
		--ClanAttack {Number = 5, SourceClan = 26 , TargetX = 125, TargetY = 337, WalkMode = Run},
		--ClanAttack {Number = 5, SourceClan = 24 , TargetX = 125, TargetY = 337, WalkMode = Run},
		IncreaseGlobalCounter {Name = "AngriffsZaehlerP110Abgelehnt"},
		
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerP110Abgelehnt", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		SetGlobalTimeStamp{Name = "AngriffsZeitAbgelehntP110"},
		ResetGlobalCounter { Name = "AngriffsZaehlerP110Abgelehnt" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
	}
	
}

--Sun Units greifen an (AngriffsWelle mit 5 Units)
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
	
	
		IsGlobalTimeElapsed { Name = "AngriffsZeitAngenommenP110", Seconds = AngriffsZeitenSonne, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerP110Angenommen", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
	},
	Actions =	
	{
		ClearGlobalTimeStamp{ Name = "AngriffsZeitAngenommenP110"},
		Goto { X = 125 , Y = 337 , NpcId = 6562 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --SunUnits greifen an
		Goto { X = 125 , Y = 337 , NpcId = 6563 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6564 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6565 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6566 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		--ClanAttack {Number = 5, SourceClan = 26 , TargetX = 125, TargetY = 337, WalkMode = Run},
		--ClanAttack {Number = 5, SourceClan = 24 , TargetX = 125, TargetY = 337, WalkMode = Run},
		IncreaseGlobalCounter {Name = "AngriffsZaehlerP110Angenommen"},
		
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerP110Angenommen", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		SetGlobalTimeStamp{Name = "AngriffsZeitAngenommenP110"},
		ResetGlobalCounter { Name = "AngriffsZaehlerP110Angenommen" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
	}
	
}

--Star Units greifen an (AngriffsWelle mit 3 Units)

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		IsGlobalTimeElapsed { Name = "AngriffsZeitStarP110", Seconds = AngriffsZeitenStar, UpdateInterval = 10}, --Wenn nach dem TimeStmap, 2 Stunden vergangen sind wird die Bedingung ein.
		IsGlobalCounter { Name = "AngriffsZaehlerStarP110", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht wird angegriffen 
	},
	Actions =	
	{
		ClearGlobalTimeStamp{ Name = "AngriffsZeitStarP110"},
		--Goto { X = 125 , Y = 337 , NpcId = 6557 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, --MoonUnits greifen an
		--Goto { X = 125 , Y = 337 , NpcId = 6558 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6759 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6760 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 125 , Y = 337 , NpcId = 6761 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		
		--ClanAttack {Number = 5, SourceClan = 26 , TargetX = 125, TargetY = 337, WalkMode = Run},
		--ClanAttack {Number = 5, SourceClan = 24 , TargetX = 125, TargetY = 337, WalkMode = Run},
		IncreaseGlobalCounter {Name = "AngriffsZaehlerStarP110"},
		
	}
	
}


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		IsGlobalCounter { Name = "AngriffsZaehlerStarP110", Operator = IsEqual, Value = 1, UpdateInterval = 60}, -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		SetGlobalTimeStamp{Name = "AngriffsZeitStarP110"},
		ResetGlobalCounter { Name = "AngriffsZaehlerStarP110" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird 
	}
	
}

--Wenn Spieler Angebot annimmt werden die angreifenden MondTruppen zurückgepfiffen

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MondTruppenIdleGoHomeStartP110"},
		
    },
	Actions =
	{
		
		Goto { X = 236, Y = 454, NpcId = 6557 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 236, Y = 454, NpcId = 6558 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 236, Y = 454, NpcId = 6559 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 236, Y = 454, NpcId = 6560 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 236, Y = 454, NpcId = 6561 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
	}
}



--Wenn der Spieler sein Monument verliert

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MondTruppenIdleGoHomeP110"},
		
    },
	Actions =
	{
		
		Goto { X = 236, Y = 454, NpcId = 6557 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 236, Y = 454, NpcId = 6558 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 236, Y = 454, NpcId = 6559 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 236, Y = 454, NpcId = 6560 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 236, Y = 454, NpcId = 6561 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
	}
}

--Wenn der Spieler sein Monument verliert
OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SunTruppenIdleGoHomeP110"},
		
    },
	Actions =
	{
		
		Goto { X = 220, Y = 96, NpcId = 6562 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 220, Y = 96, NpcId = 6563 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 220, Y = 96, NpcId = 6564 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 220, Y = 96, NpcId = 6564 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
		Goto { X = 220, Y = 96, NpcId = 6566 , Range = 3 , WalkMode = Run , GotoMode = GotoForced},
	}
}

--------------------------------------------------------------------------------------------------------
--Wenn der Spieler sein Monument Zwischenzeitlich verliert, werden die AngriffsTruppen zurückgeschickt--
--------------------------------------------------------------------------------------------------------

OnEvent								
{
	Conditions = 
	{ 
		IsGlobalCounter { Name = "MonumentCounterP110", Value = 0, Operator = IsEqual, UpdateInterval = 60},
		IsGlobalFlagTrue { Name = "OrkMonument1ClaimedP110" }, 
		Negated(IsMonumentInUse {X = 129, Y = 334, Range = 3, UpdateInterval = 10}),
		Negated(IsMonumentInUse {X = 112, Y = 40, Range = 3, UpdateInterval = 10}),
		Negated(IsMonumentInUse {X = 161, Y = 451, Range = 3, UpdateInterval = 10}),
	 
	},
	Actions = 
	{
		SetGlobalFlagTrue { Name = "MondTruppenIdleGoHomeP110"},
		SetGlobalFlagTrue { Name = "SunTruppenIdleGoHomeP110"},
		IncreaseGlobalCounter { Name = "MonumentCounterP110"},	
	},											
}							

OnEvent								
{
	Conditions = 
	{ 
		IsGlobalFlagTrue { Name = "OrkMonument1ClaimedP110" },
		IsGlobalCounter { Name = "MonumentCounterP110", Value = 1, Operator = IsEqual, UpdateInterval = 60},
		IsMonumentInUse {X = 129, Y = 334, Range = 3, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "AngebotAbgelehntP110" }, 
	 
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "StopRespawnMoonP110"},  --Es werden die Respawns für Moon und Sun eingeschaltet
		SetGlobalFlagFalse {Name = "StopRespawnSunP110"},
		--ChangeRace {Race = 137, NpcId = 6047}, 				--Bote greift Spieler an
		ResetGlobalCounter {Name = "MonumentCounterP110"},	
	},											
}							

OnEvent								
{
	Conditions = 
	{ 
		IsGlobalFlagTrue { Name = "OrkMonument1ClaimedP110" },
		IsGlobalCounter { Name = "MonumentCounterP110", Value = 1, Operator = IsEqual, UpdateInterval = 60},
		IsMonumentInUse {X = 129, Y = 334, Range = 3, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "AngebotAngenommenP110" }, 
	 
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "MondTruppenIdleGoHomeP110"},
		SetGlobalFlagTrue {Name = "StopRespawnMoonP110"},
		SetGlobalFlagFalse {Name = "StopRespawnSunP110"},
		--ChangeFigureOwner {NpcId = 6047}, 						--Bote wird zur SpielerFigur
		Goto { X = 162, Y = 443, NpcId = 6047 , Range = 5 , WalkMode = Run , GotoMode = GotoForced},
		ResetGlobalCounter {Name = "MonumentCounterP110"},
			
	},											
}				


---------------------------------------------------------------------
-- Beendigung des Abfangens wenn Spieler Eingangsmonument verliert --
---------------------------------------------------------------------


			
--Wenn der Spieler den Friedhof betritt, werden die Gargoyles zum leben erweckt

OnPlatformOneTimeEvent
{
	Conditions =
	{
		FigureInRange { X = 106, Y = 164, NpcId = Avatar, Range = 10},
		
    },
	Actions =
	{
		SetGlobalFlagTrue{Name = "GargoyleActionP110"},
	}
}


--Wenn der Spieler den Inneren Bereich der Karte betritt wird das Heldenmonument aufgedeckt
OnPlatformOneTimeEvent
{
	Conditions =
	{
		FigureInRange { X = 327, Y = 265, NpcId = Avatar, Range = 5},
	},
	Actions =
	{
		SetRewardFlagTrue { Name = "InInnenstadtGekommen" },
		RevealUnExplored { X = 363 , Y = 293, Range = 8 },
	}
}


--Der Nichtangriffspakt wurde vom Spieler gebrochen

OnPlatformOneTimeEvent
{
	Conditions =
	{
		ODER (ODER (PlayerUnitInRange { X = 208 , Y = 466 , Range = 15 , FigureType = FigureAll , UpdateInterval = 60}, PlayerUnitInRange { X = 241 , Y = 434 , Range = 20 , FigureType = FigureAll , UpdateInterval = 60} ),
				ODER (PlayerUnitInRange { X = 162 , Y = 443 , Range = 15 , FigureType = FigureAll , UpdateInterval = 60}, PlayerUnitInRange { X = 184 , Y = 416 , Range = 15 , FigureType = FigureAll , UpdateInterval = 60} )),
		IsGlobalFlagTrue { Name = "AngebotAngenommenP110"},
		IsGlobalFlagFalse { Name = "VertragsBruchP110"},

    },
	Actions =
	{
		SetGlobalFlagFalse {Name = "MondTruppenIdleGoHomeP110"},
		SetGlobalTimeStamp{Name = "AngriffsZeitAbgelehntP110"},
		ResetGlobalCounter { Name = "AngriffsZaehlerP110Abgelehnt" }, --Der Angriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal ein Angriff innerhalb von 4h gestartet wird AngriffsZaehlerP110Abgelehnt
		SetGlobalFlagTrue {Name = "VertragsBruchP110"},
		ChangeRace {Race = 137, NpcId = 6047}, --Bote greift Spieler an
		Outcry { NpcId = 6043, String = "Ihr dringt in unser Gebiet ein! Der Pakt ist gebrochen! Krieger, greift an!" , Tag = "ocZhaalTuor_P110_002" , Color = ColorWhite},

	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
		IsGlobalFlagFalse { Name = "AngebotAbgelehntP110" }, 
		IsGlobalFlagFalse { Name = "AngebotAngenommenP110" }, 
    },
	Actions =
	{
		ChangeRace {Race = 137, NpcId = 6047},
		SetGlobalFlagFalse {Name = "FireCityCraighPactHint"},
		--Outcry { NpcId = 6047, String = "Du hättest mein Angebot annehmen sollen, jetzt wirst du dafür sterben!" , Tag = "ocMondBoteP110_002" , Color = ColorWhite},
		
	},
}

--Wenn Torwächter 1 stirbt

OnPlatformOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 6705},
		
    },
	Actions =
	{
		SetGlobalFlagTrue{Name = "OeffneSchatzkammer1P110"},
	},
}
--Wenn Torwächter 2 stirbt

OnPlatformOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 6706},
		
    },
	Actions =
	{
		SetGlobalFlagTrue{Name = "OeffneSchatzkammer2P110"},
	}
}

--Outcry Abgesandter des Mondtempels

OnPlatformOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 124, Y = 337, NpcId = 6047, Range = 10},
		PlayerUnitInRange {X = 124, Y = 337, Range = 10 , FigureType = FigureAll},
	},
	Actions =
	{
		
		Outcry { NpcId = 6046 , String = "Ein Gesandter der Mondstadt ist hier! Er will mit Euch sprechen!" , Tag = "ocCraigh_P110_001" },
		
	}
}

--Outcry Lena wenn Spieler alle 3 Schlüssel hat!

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
		IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
		IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
		
	},
	Actions =
	{
		
		Outcry { NpcId = 6738 , String = "Wir haben den Zugang zur inneren Stadt! Es wird Zeit, Grim eine Lektion zu erteilen!" , Tag = "ocLena_P110_001" },
		
	}
}

--Outcry Lena wenn Spieler versucht ohne das Schattenschwert durchs Tor zu gelangen!

OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagFalse{Name = "PlayerHasItemSchattenschwert"},
		IsGlobalFlagTrue{Name = "HaendlerFireCitySpawnP110"},
		PlayerUnitInRange { X = 450, Y = 283, Range = 10 , FigureType = FigureAvatar},
		
	},
	Actions =
	{
		
		Outcry { NpcId = 6738 , String = "Rüste dich mit dem Schwert, bevor wir den Abgrund betreten!" , Tag = "ocLena_P110_002" },
		
	}
}

--Outcry Grim wenn Spieler die innere Stadt betritt!

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange { X = 331, Y = 265, Range = 10 , FigureType = FigureAll},
		
	},
	Actions =
	{
		QuestSolve{QuestId = 620},
		QuestBegin{QuestId = 621},
		Outcry { NpcId = 6555 , String = "Sie sind im Zentrum! Los Würmer, haltet Sie auf!" , Tag = "ocGrim_P110_001" },
	}
}








----------- MAINQUEST

--- Hat der Spieler den Sonnenschlüssel?

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 617, State = StateActive},
		IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
	},
	Actions =
	{
		QuestSolve{QuestId = 617},
	}
}


--- Hat der Spieler den Mondschlüssel?

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 618, State = StateActive},
		IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
	},
	Actions =
	{
		QuestSolve{QuestId = 618},
	}
}


--- Hat der Spieler den Sternenschlüssel?

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 619, State = StateActive},
		IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
	},
	Actions =
	{
		QuestSolve{QuestId = 619},
	}
}


--- Hat der Spieler alle drei Schlüssel?

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 616, State = StateActive},
		IsItemFlagTrue{Name = "PlayerHasItemSunKey"},
		IsItemFlagTrue{Name = "PlayerHasItemMoonKey"},
		IsItemFlagTrue{Name = "PlayerHasItemStarKey"},
	},
	Actions =
	{
		QuestSolve{QuestId = 616},
		QuestBegin{QuestId = 620},
		
	}
}

------------ MAINQUEST ends here


---_______________________________________________________________
--I																  I
--I				Neue MainQuest Mondpriester                       I
--I_______________________________________________________________I


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "FireCityMoonPriestRules"},

		
	},
	Actions =
	{
		QuestSolve { QuestId = 745},
		QuestSolve { QuestId = 671},		
		QuestBegin { QuestId = 746},
		QuestBegin { QuestId = 748},
		SetGlobalFlagTrue { Name = "LeaFollowP110" },
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{Name = "PlayerHasItemGlowstone"},
		QuestState { QuestId = 750, State = StateActive},

		
	},
	Actions =
	{
		QuestSolve { QuestId = 750},
		QuestBegin { QuestId = 749},
		
	}
}






---_______________________________________________________________
--I																  I
--I						Neue MainQuest Craig	                  I
--I_______________________________________________________________I



OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagFalse { Name = "FireCityMoonPriestRules"},
		QuestState { QuestId = 745, State = StateActive},
		IsItemFlagTrue{Name = "PlayerHasItemSchattenschwert"},
	},
	Actions =
	{
		QuestSolve { QuestId = 745},
		QuestSolve { QuestId = 671},		
		QuestBegin { QuestId = 747},
		SetGlobalFlagTrue { Name = "LeaFollowP110" },
		
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagFalse { Name = "FireCityMoonPriestRules"},
		QuestState { QuestId = 747, State = StateSolved},
		
	},
	Actions =
	{
		TransferItem {GiveItem = 4187, Flag = Give},
		QuestBegin { QuestId = 749},
		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "OpenFinalGateP110"},
	
	},
	Actions =
	{
		QuestSolve { QuestId = 749},
		QuestBegin { QuestId = 751},		
	}
}

-- Fahrender Händler ist abgeschlossen
OnOneTimeEvent 
{
	Conditions =
	{
		QuestState {QuestId = 732, State = StateSolved},
	},
	Actions =
	{
		QuestSolve {QuestId = 720},
	}
}




EndDefinition()
end


