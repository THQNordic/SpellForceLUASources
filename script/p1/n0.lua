function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


---Queststatus initialisieren
---- -Q12-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 12 , State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 12},
		QuestBegin{QuestId = 446},
		QuestBegin{QuestId = 447},
		QuestSolve{QuestId = 446},
		}
}


--Checker ob Spieler Dolch hat UND Queste
---- -Q65 -Q64-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2336 },
		QuestState{QuestId = 65 , State = StateActive}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q65HasDaggerAndQuest"}
		}
}


--Checker ob Spieler Federkiel hat und Queste
---- -Q335 -Q339 -Q351  - Zauberwerk-Quest/Federkiel
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2001 },
		QuestState{QuestId = 351 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 351},
		QuestBegin{QuestId = 340}
		}
}


--Siegbedingung Westcamp
---- -Q65- -Q63- -Q64-
OnOneTimeEvent
{
Conditions =	{
		Negated(EnemyUnitInRange{X = 66 , Y = 122 , NpcId = Avatar , Range = 4 , UnitId = 0 , UpdateInterval = 60}),
		FigureDead{NpcId = 1716},
		QuestState{QuestId = 65 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 63}, 
		QuestBegin{QuestId = 64}
		}
}

-- portal troop counter toggle, prüft ob alle schon tot sind
OnToggleEvent
{
	UpdateInterval = 20 ,
	OnConditions = {
		-- schon alle truppen gespawned?
		--ODER(
		--	IsGlobalCounter{Name = "NumTroopsSpawned", Operator = IsGreaterOrEqual, Value = 5, UpdateInterval = 20},
		--	IsGlobalFlagTrue{Name = "PortalTroopsSafetySwitch", UpdateInterval = 20}
		--	),
		FigureInRange{NpcId = 1406, X = 123, Y = 112, Range = 1},
		FigureInRange{NpcId = 1608, X = 124, Y = 113, Range = 1},
		FigureInRange{NpcId = 1609, X = 126, Y = 113, Range = 1},
		FigureInRange{NpcId = 1610, X = 124, Y = 111, Range = 1},
		FigureInRange{NpcId = 1611, X = 126, Y = 111, Range = 1},
	},
	OnActions = {
		-- gehe von spawning in walking modus, um respawn erst wieder bei
		-- wiederaufnehmen der quest bei celen zu erlauben
		SetGlobalFlagFalse{Name = "PortalTroopsSpawning"},
		SetGlobalFlagTrue{Name = "PortalTroopsWalking"},
		ResetGlobalCounter{Name = "NumTroopsSpawned"},
		ResetGlobalCounter{Name = "NumTroopsDead"},
		--SetGlobalFlagFalse{Name = "PortalTroopsSafetySwitch"},
		--SetEffect{Effect = "AcidCloud", NpcId = Avatar, Length = 3333},
	},
	OffConditions = {
		-- sind etwa alle gestorben?
		IsGlobalCounter{Name = "NumTroopsDead", Operator = IsGreaterOrEqual, Value = 5},
		-- ...und ist die "geleite truppen zu portal" quest noch nicht gesolved?
		QuestState{QuestId = 16, State = StateActive},
	},
	OffActions = {
		-- restart quest from scratch
		QuestBegin{QuestId = 14 , SubQuestActivate = TRUE},
		SetGlobalFlagFalse{Name = "PortalTroopsWalking"},
		SetGlobalFlagFalse{Name = "PortalTroopsWalkingSafetyNet"},
		--SetEffect{Effect = "Fog", NpcId = Avatar, Length = 3333},
	},
}
-- portal troop safety toggle ...
--OneTimeInitAction( SetNpcTimeStamp{Name = "PortalTroopSafetyTimer"} )
--OnToggleEvent
--{
--	OnConditions = {
--		IsNpcTimeElapsed{Name = "PortalTroopSafetyTimer", Seconds = 6},
--		Negated(IsGlobalCounter{Name = "NumTroopsSpawned", Operator = IsGreaterOrEqual, Value = 5}),
--		FigureInRange{NpcId = 1406, X = 123, Y = 112, Range = 0},
--		FigureInRange{NpcId = 1608, X = 124, Y = 113, Range = 0},
--		FigureInRange{NpcId = 1609, X = 126, Y = 113, Range = 0},
--		FigureInRange{NpcId = 1610, X = 124, Y = 111, Range = 0},
--		FigureInRange{NpcId = 1611, X = 126, Y = 111, Range = 0},
--	},
--	OnActions = {
--		SetGlobalFlagTrue{Name = "PortalTroopsSafetySwitch"},
--	},
--	OffConditions = {
--		IsGlobalFlagFalse{Name = "PortalTroopsSafetySwitch"},
--	},
--	OffActions = {
--		SetNpcTimeStamp{Name = "PortalTroopSafetyTimer"},
--	},
--}

--Prüfen ob alle Goblins am Portal tot
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 2862},
		FigureDead{NpcId = 1617},
		FigureDead{NpcId = 1695},
		FigureDead{NpcId = 1693},
		FigureDead{NpcId = 1698},
		--QuestState{QuestId = 16 , State = StateActive},
		Negated (EnemyUnitInRange {X = 68 , Y = 202 , Radius = 8 , NpcId = 1240 , UnitId = 0 , UpdateInterval = 30 } ),
		},
Actions = 	{
		SetGlobalFlagTrue{Name = "Q16PortalGoblinsDead" },
		}
}

OnOneTimeEvent
{
	Conditions = {
		ODER(
			UND(
				IsGlobalTimeElapsed{Name = "ForceLiannonPortalKeepOpen", Seconds = 8},
				IsGlobalFlagTrue{Name = "EinerGehtZumPortal"}
				),
			UND(
				IsGlobalCounter{Name = "NumTroopsDead", Operator = IsGreaterOrEqual, Value = 5},
				QuestState{QuestId = 17, State = StateActive}
				)
			),
		QuestState{QuestId = 262, State = StateUnknown},
	},
	Actions = {
		QuestSolve{QuestId = 17},
		QuestBegin{QuestId = 262}, 
		SetPlayerFlagTrue{Name = "QuestGetToEloniSolved"},
	},
}

-- make it simple, tor öffnen wenn 1x versagt und spieler alleine beim portal ist:
OnOneTimeEvent
{
	Conditions = {
		IsGlobalCounter{Name = "NumTroopsDead", Operator = IsGreaterOrEqual, Value = 5},
		IsPlayerFlagTrue{Name = "Q16PortalTroopHasDiedAtLeastOnce"},
		IsGlobalFlagTrue{Name = "Q16PortalGoblinsDead" },
		FigureInRange{X = 68, Y = 202, NpcId = Avatar, Range = 6},
	},
	Actions = {
		QuestSolve{QuestId = 15},
		QuestSolve{QuestId = 16},
		QuestSolve{QuestId = 17},
		QuestBegin{QuestId = 262}, 
		SetPlayerFlagTrue{Name = "QuestGetToEloniSolved"},
		ResetGlobalCounter{Name = "NumTroopsSpawned"},
		ResetGlobalCounter{Name = "NumTroopsDead"} ,
		SetPlayerFlagFalse{Name = "Q16AttemptFailed"},
	},
}



comment = [[
--Vergleich Todescounter für Geist, Solver für Subquest 38, nebenquest brok 36
OnOneTimeEvent
{
Conditions =	{
		IsGlobalCounter{Name = "GhostDeath" , Value = 2 , Operator = IsEqual},
		QuestState{QuestId = 38 ,  State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 38 ,ActivateNextQuest = TRUE}
		}
}
]]

---Checker für die Nebenquest Brok 36; prüft ob Spieler Schwert UND Quest hat, Schalter für Dialog
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 36 , State = StateActive},
		PlayerHasItem{ItemId = 1998},
		},
Actions = 	{
		SetPlayerFlagTrue{Name = "HasQuestAndSword" },
		QuestSolve{QuestId = 38},
		QuestBegin{QuestId = 39},
		}
}

--- CELEN BLOCK BEGINS HERE
--Retry auslösen
OnEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "Q16StartedBefore"},
		QuestState{QuestId = 16 , State = StateActive},
		FigureDead{NpcId = 1406},
		FigureDead{NpcId = 1608},
		FigureDead{NpcId = 1609},
		FigureDead{NpcId = 1610},
		FigureDead{NpcId = 1611},
		QuestState{QuestId = 262 , State = StateUnknown},
		},
Actions =	{
		QuestChangeState{QuestId = 17 , State = StateUnknown},
		QuestChangeState{QuestId = 16 , State = StateUnknown},
		QuestBegin{QuestId = 15},
		}
}
---Check ob ein Retry der Portalqueste stattfindet
---- -Q16- -Q15-
OnToggleEvent
{
OnConditions =	{
		IsPlayerFlagTrue{Name = "Q16StartedBefore"},
		QuestState{QuestId = 15 , State = StateActive},
		QuestState{QuestId = 262 , State = StateUnknown},
		},
OnActions =	{
		SetPlayerFlagTrue{Name = "Q16AttemptFailed"},
		SetPlayerFlagTrue{Name = "Q16PortalTroopHasDiedAtLeastOnce"},
		},
OffConditions =	{
		QuestState{QuestId = 16 , State = StateActive},
		QuestState{QuestId = 262 , State = StateUnknown},
		},
OffActions =	{
		SetPlayerFlagFalse{Name = "Q16AttemptFailed"},
		},
}

--- CELEN BLOCK ENDS HERE

--- ORTHA BLOCK BEGINS HERE
--- Abfrage ob Schreiber hin ist, Beginn der Schreiber Queste
---- -Q41- -Q43- -Q45-
OnOneTimeEvent
{
Conditions = 	{
		IsPlayerFlagTrue{Name = "Q43ScribeDead"},
		QuestState{QuestId = 41 , State = StateActive},
		},
Actions =	{
		QuestBegin{QuestId = 43},
		QuestBegin{QuestId = 45},
		}
}


--- Abfrage ob Späher hin ist, Beginn der Späher Queste
---- -Q47- -Q48- -Q41-
OnOneTimeEvent
{
Conditions = 	{
		IsPlayerFlagTrue{Name = "Q47ScoutDead"},
--		FigureDead{NpcId = 1625},
		QuestState{QuestId = 45 , State = StateSolved},
		},
Actions =	{
		QuestBegin{QuestId = 47},
		QuestBegin{QuestId = 48},
		},
}
---Udwins Questpart wird grösstenteils in Udwins Dialog geregelt
--Prüfen ob Udwin hin ist
---- -Q51- -Q49-
OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "Q49UdwinDead"},
		--FigureDead{NpcId = 1398},
		QuestState{QuestId = 49 , State =  StateActive},
		IsGlobalFlagFalse{Name = "GhostIsNowVanishing", UpdateInterval = 1},
		},
Actions =	{
		QuestSolve{QuestId = 51},
		QuestSolve{QuestId = 50},
		QuestSolve{QuestId = 49},
		},
}



---Queststart Schreiber, Solver bei Ortah
---- -Q43- -Q45-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 41 , State = StateActive},
		--IsGlobalCounter{Name = "GhostScribeDeath" , Value = 2 , Operator = IsEqual},
		IsPlayerFlagTrue{Name = "Q43ScribeDead"},
		},
Actions =	{
		QuestSolve{QuestId = 556},
		QuestBegin{QuestId = 43},
		QuestBegin{QuestId = 45},
		}
}


---Queststart Späher, Solver bei Ortah
---- -Q47- -Q48-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 41 , State = StateActive},
		--IsGlobalCounter{Name = "GhostScoutDeath" , Value = 2 , Operator = IsEqual},
		IsPlayerFlagTrue{Name = "Q47ScoutDead"},
		},
Actions =	{
		QuestSolve{QuestId = 557},
		QuestBegin{QuestId = 47},
		QuestBegin{QuestId = 48},
		}
}

---Prüfen ob Spieler bei Darius war und mit Ortah geredet hat
---- -Q47- -Q48-
OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "Q49MarkerForBookQuestion" , UpdateInterval = 10},
		QuestState{QuestId = 46 , State = StateSolved}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q49DairusandMarker"}
		}
}



--Prüfen ob Buch da und Quest nicht gelöst
---- -Q46-
REM = [[ -- ist vermutlich weggefallen...
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2003}, 
		Negated(QuestState{QuestId = 46 , State = StateSolved})	
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q46BookbutQuestNotSolved"}
		}
}
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2003}, 
		QuestState{QuestId = 46 , State = StateSolved}	
		},
Actions =	{
		SetPlayerFlagFalse{Name = "Q46BookbutQuestNotSolved"}
		}
}
]]
--Solver für Geisterqueste komplett
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 42 , State = StateSolved},	
		QuestState{QuestId = 43 , State = StateSolved},	
		QuestState{QuestId = 47 , State = StateSolved},	
		QuestState{QuestId = 49 , State = StateSolved},	
		},
Actions =	{
		QuestSolve{QuestId = 41},
		}
}

--- ORTAH BLOCK ENDS HERE


--SHAN BLOCK BEGINS HERE


OnOneTimeEvent
{
UpdateInterval = 10,
Conditions = 	{
			QuestState{QuestId = 92 , State = StateActive},
			PlayerHasItem{ItemId = 2362}
		},
Actions =	{
		QuestSolve{QuestId = 92},
		QuestBegin{QuestId = 93},
		TransferXP{XP = 10 , Flag = Give},
		}
}
--SHAN BLOCK ENDS HERE

--TYRGAR BLOCK BEGINS HERE
--Fisch und Queste abfragen
---- -Q128-
OnOneTimeEvent
{
UpdateInterval = 20,
Conditions = 	{
		PlayerHasItem{ItemId = 2461},
		QuestState{QuestId = 129 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 129},
		QuestBegin{QuestId = 130},
		SetPlayerFlagTrue{Name = "Q118HasBagandQuest"}
		}
}

--TYRGAR BLOCK ENDS HERE


--Hat der Spieler Zangen und Zahnbrecherquest?
---- -Q371 -Q 372
OnOneTimeEvent
{
Conditions = 	{
		PlayerHasItem{ItemId = 2486},
		QuestState{QuestId = 372 , State = StateActive}
		},
Actions =	{
		QuestBegin{QuestId = 373},
		QuestSolve{QuestId = 372}
		}
}
-----  Zahnbrecher ends here


--Hat der Spieler Gebrochenen Bogen und Schwarzeibenquest?
---- -Q414 -Q415 -Q416
OnOneTimeEvent
{
Conditions = 	{
		PlayerHasItem{ItemId = 2002},
		QuestState{QuestId = 415 , State = StateActive}
		},
Actions =	{
		QuestBegin{QuestId = 416},
		QuestSolve{QuestId = 415}
		}
}
-----  Schwarzeibe ends here


--Hat der Spieler Klingzogs Beinlinge?
---- -Q411 Q412
OnOneTimeEvent
{
Conditions = 	{
		PlayerHasItem{ItemId = 1994},
		},
Actions =	{
		SetGlobalFlagTrue {Name = "TanaraKannSprechen"},
		EnableDialog {NpcId = 2861},
		QuestBegin{QuestId = 411},
		QuestBegin{QuestId = 412}
		}
}
-----  Klingzogs Beinlinge end here




----Amra und Lea
-- 


OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 387, State = StateActive},
	},
	Actions =
	{
		Goto {NpcId = 2897, X = 470, Y = 340, WalkMode = Walk, Range = 3}
	}
}

OnOneTimeEvent
{
	UpdateInterval = 1,
	Conditions =
	{
		FigureDead {NpcId = 2913},
		FigureDead {NpcId = 2914},
		FigureDead {NpcId = 2915},
		QuestState {QuestId = 382, State = StateActive},
		IsGlobalFlagTrue {Name = "Quest383Helper"},
	},
	Actions =
	{
		QuestSolve {QuestId = 382},
		QuestBegin {QuestId = 383},		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 3047},
		QuestState {QuestId = 383, State = StateActive},
	},
	Actions =
	{
		QuestSolve {QuestId = 383},
		QuestBegin {QuestId = 384},
	}
}	

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 388, State = StateActive},
		PlayerHasItem {ItemId = 3045},
		PlayerHasItem {ItemId = 3046}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "LeasKram"},
	}
}

--Amra&Lea Ende

-- Fake für das RTS Spawning, da die Einheiten Einzelne Homepoints haben und deshalb nicht über RTS-SPawning klappen


OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 66, Y = 198, Range = 4},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "LianonFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 67, Y = 200},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 66, Y = 198, Range = 4}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "LianonFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 67, Y = 200, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 67, Y = 200, Length = 3000},
		StopEffect {TargetType = World, X = 67, Y = 200},
	}
}

-- geistertod prüfen.........

OnOneTimeEvent
{
	Conditions = {
		FigureDead{NpcId = 1626},
		IsGlobalFlagTrue{Name = "ScribeSpawned"},
		IsGlobalFlagFalse{Name = "GhostIsNowVanishing", UpdateInterval = 1},
	},
	Actions = {
		SetPlayerFlagTrue{Name = "Q43ScribeDead"},
	},
}

OnOneTimeEvent
{
	Conditions = {
		FigureDead{NpcId = 1625},
		IsGlobalFlagTrue{Name = "ScoutSpawned"},
		IsGlobalFlagFalse{Name = "GhostIsNowVanishing", UpdateInterval = 1},
	},
	Actions = {
		SetPlayerFlagTrue{Name = "Q47ScoutDead"},
	},
}

OnOneTimeEvent
{
	Conditions = {
		FigureDead{NpcId = 1398},
		IsGlobalFlagTrue{Name = "UdwinSpawned"},
		IsGlobalFlagFalse{Name = "GhostIsNowVanishing", UpdateInterval = 1},
	},
	Actions = {
		SetPlayerFlagTrue{Name = "Q49UdwinDead"},
	},
}


EndDefinition()

end
