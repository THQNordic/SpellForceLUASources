function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/P210/n0_ItemScript.lua")
dofile("script/P210/n32501_CutsceneRoom1Xalaban.lua")
dofile("script/P210/n32500_CutsceneRoom2.lua")
dofile("script/P210/n32502_CutsceneRoom3SingleHeadGlowing.lua")
dofile("script/P210/n32503_CutsceneRoom3AllHeadsGlowing.lua")
dofile("script/P210/n32504_CutsceneEndkampf.lua")
dofile("script/P210/n32505_CutsceneVermaechtnis.lua")

dofile("script/Hadeko.lua")

--- Zu Beginn startet der Timer für Urus erstes Erscheinen auf der Map
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalTimeStamp{Name = "UrusFirstComing"},	
	}
}

--- Zu Beginn werden die Goals der vier Entry-Menhir-Zeiger auf 4 gesetzt
--- Das bedeutet: Das Entry-Menhir ist nicht zu öffnen, solange Uru noch nicht erschienen ist
--- Erst mit Urus Erscheinen werden die Goals der Zeiger auf Werte zwischen 0 und 3 gesetzt
--- Somit ist am Menhir eine korrekte Kombination einstellbar
--- Warum das alles? Antwort: Der Spieler soll so gezwungen werden, mit Uru zu Beginn der Karte zu sprechen

OnOneTimeEvent
{
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_PointerA", Step = 4},
		IncreaseGlobalCounter{Name = "g_P210_PointerB", Step = 4},
		IncreaseGlobalCounter{Name = "g_P210_PointerC", Step = 4},
		IncreaseGlobalCounter{Name = "g_P210_PointerD", Step = 4},
	}
}


--- Mistakes-Made-Management
--- Es gibt auf dieser Karte drei Fehler-Zähler:
--- "g_P210_MinorMistakesMade"
--- "g_P210_MediumMistakesMade"
--- "g_P210_MajorMistakesMade"
--- Hat der Spieler 10 Minor Mistakes gemacht, wird der der Medium-Zähler hochgezählt
--- Hat der Spieler 10 Medium Mistakes gemacht, wird der Major-Zähler hochgezählt

OnEvent
{
	Conditions =
	{
	  IsGlobalCounter{Name = "g_P210_MinorMistakesMade", Value = 10, Operator = IsGreaterOrEqual},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_MediumMistakesMade"},
		ResetGlobalCounter{Name = "g_P210_MinorMistakesMade"},
	}
}

OnEvent
{
	Conditions =
	{
	  IsGlobalCounter{Name = "g_P210_MediumMistakesMade", Value = 10, Operator = IsGreaterOrEqual},
	},
	Actions =
	{
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
		ResetGlobalCounter{Name = "g_P210_MediumMistakesMade"},
	}
}




--------------------------------------------------------
-------------  MAINQUEST-MANAGEMENT  -------------------
--------------------------------------------------------

--- Beim ersten Betreten der Karte:
OnOneTimeEvent
{
	Actions =
	{
		QuestSolve {QuestId = 875}, -- die Questen von Kathai werden gesolved
		QuestSolve {QuestId = 873}, -- die Questen von Kathai werden gesolved
		QuestSolve {QuestId = 779}, -- die Questen von Kathai werden gesolved
		QuestBegin {QuestId = 900}, -- Mainquest begonnen "Durch die Uhrwerkhallen"
		QuestBegin {QuestId = 901}, -- Unterquest "Öffne das Eingangstor"
		QuestBegin {QuestId = 913}, -- Unterquest "Finde ein Portal nach Darkwind Keep und verlasse die CC"
		SetRewardFlagTrue {Name = "P210KarteErreicht"},
	}
}

--- Sobald der Spieler die Halle der Augen durchquert hat
OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange{X = 178 , Y = 325 , Range = 5 , FigureType = FigureAvatar, UpdateInterval = 10} 
	},
	Actions =
	{
		QuestSolve {QuestId = 902}, -- Unterquest "Durchquere die Halle der Augen"
		QuestBegin {QuestId = 903}, -- Unterquest "Schleiche an den Wächtern vorbei"
		SetGlobalFlagTrue {Name = "g_P210_PlayerCrossedHallOfEyes"},
	}
}

--- Sobald der Spieler an den Wächtern vorbei ist
OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange{X = 252 , Y = 255 , Range = 5 , FigureType = FigureAvatar, UpdateInterval = 20} 
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P210_Room5Crossed"},
		QuestSolve {QuestId = 903}, -- Unterquest "Schleiche an den Wächtern vorbei"
		QuestBegin {QuestId = 904}, -- Unterquest "Durchquere die Spinnengrube oder such einen Weg um die Grube herum"
	}
}

--- Wenn Spinnentor oder 5-Luftmünzen-Tor geöffnet wird 
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
		IsGlobalFlagTrue{Name = "g_P210_Room6SpiderGateOpen"},
		IsGlobalFlagTrue{Name = "g_P210_AirCoinGateOpen"},
		},
	},
	Actions =
	{
		QuestSolve {QuestId = 904}, -- Unterquest "Durchquere die Spinnengrube oder such einen Weg um die Grube herum"
	}
}

--- Sobald der Spieler das abgeschlossene Tor zum SkeletonCamp entdeckt hat
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P210_Room5SkeletonCampDoorSeen"},
		IsGlobalFlagFalse{Name = "g_P210_SecurityFlagPGotSkeletonKey"},
		Negated(QuestState{QuestId = 905, State = StateSolved}),
	},
	Actions =
	{
		QuestBegin {QuestId = 905}, -- Unterquest "Finde einen Gegenstand, um den Eingang in die Halle der Toten zu öffnen"
	}
}

--- Sobald der Spieler den Schlüsselstein für die Halle der Toten findet
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 7221},
	},
	Actions =
	{
		QuestSolve {QuestId = 905}, -- Unterquest "Finde einen Gegenstand, um den Eingang in die Halle der Toten zu öffnen"
		SetGlobalFlagTrue{Name = "g_P210_SecurityFlagPGotSkeletonKey"},		
		QuestBegin {QuestId = 906}, -- Unterquest "Durchquere die Halle der Toten"
	}
}


--- Sobald der Spieler das Skelettcamp durchquert hat
OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange{X = 136 , Y = 231 , Range = 5 , FigureType = FigureAvatar, UpdateInterval = 20} 
	},
	Actions =
	{
		QuestSolve {QuestId = 906}, -- Unterquest "Durchquere die Halle der Toten"
		QuestBegin {QuestId = 907}, -- Unterquest "Steig die schwarzweißen Stufen hinab, meide Blutlachen und Kadaver"
		SetGlobalFlagTrue {Name = "g_P210_PlayerCrossedRoom4"},
	}
}

--- Sobald der Spieler das Schachbrett überquert hat
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_Room7ChessboardDone"},
	},
	Actions =
	{
		QuestSolve {QuestId = 907}, -- Unterquest "Steig die schwarzweißen Stufen hinab, meide Blutlachen und Kadaver"
	}
}

-- Sobald der Spieler mit Xalaban gesprochen hat
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "npc_P210_PlayerSpokenWithXalabar"},
	},
	Actions =
	{
		QuestBegin {QuestId = 914}, -- Unterquest "Die Auseinandersetzung mit Xalabar"
		QuestBegin {QuestId = 911}, -- Unterquest "Entscheide, ob du für Xalabar das Szepter der Winde suchen willst"
	}
}



-- Sobald der Spieler von Xalaban den KeyStone erhält
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P210_XalabanGaveLabKey"},
	},
	Actions =
	{
		QuestSolve {QuestId = 911}, -- Unterquest "Entscheide, ob du für Xalabar das Szepter der Winde suchen willst"
		QuestBegin {QuestId = 908}, -- Unterquest "Dringe in das Höhlensystem im Osten vor"
		QuestBegin {QuestId = 909}, -- Unterquest "Bring die fünf Köpfe vor dem Tor zur Schatzkammer gleichzeitig zum Leuchten"
		QuestBegin {QuestId = 910}, -- Unterquest "Brig das Szepter der Winde und bring es Xalabar"
	}
}


-- Sobald der Spieler in das Höhlensystem vordringt
OnOneTimeEvent
{
	Conditions =
	{	
		QuestState {QuestId = 908, State = StateActive},
		IsGlobalFlagTrue{Name = "g_P210_LabDoorOpen"},
	},
	Actions =
	{
		QuestSolve {QuestId = 908}, -- Unterquest "Dringe in das Höhlensystem im Osten vor"
	}
}


-- Sobald der Spieler alle fünf Köpfe gleichzeitig zum Leuchten bringt
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 909, State = StateActive},
		IsGlobalFlagTrue {Name = "g_P210_OpenFiveHeadGate"},
	},
	Actions =
	{
		QuestSolve {QuestId = 909}, -- Unterquest "Bring die fünf Köpfe vor dem Tor zur Schatzkammer gleichzeitig zum Leuchten"
	}
}

-- Falls der Spieler Xalaban angreift
OnOneTimeEvent
{
	Conditions =
	{
		--QuestState {QuestId = 910, State = StateActive},
		IsGlobalFlagTrue{Name = "g_P210_AtWarWithKathai"},
	},
	Actions =
	{
		QuestChangeState{QuestId = 908, State = StateUnknown}, -- Unterquest "Dringe in das Höhlensystem im Osten vor"
		QuestChangeState{QuestId = 909, State = StateUnknown}, -- Unterquest "Bring die fünf Köpfe vor dem Tor zur Schatzkammer gleichzeitig zum Leuchten"
		QuestChangeState{QuestId = 910, State = StateUnknown}, -- Unterquest "Brig das Szepter der Winde und bring es Xalabar"
		QuestBegin {QuestId = 914}, -- Unterquest "Die Auseinandersetzung mit Xalabar"
		QuestSolve {QuestId = 911}, -- Unterquest "Entscheide, ob du für Xalabar das Szepter der Winde suchen willst"
		QuestBegin {QuestId = 912}, -- Unterquest "Töte Xalabar"
	}
}

-- Sobald Xalabar tot ist
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 912, State = StateActive},
		Negated(FigureAlive{NpcId = 9083}),
	},
	Actions =
	{
		QuestSolve {QuestId = 912}, -- Unterquest "Töte Xalabar"
		QuestSolve {QuestId = 914}, -- Unterquest "Die Auseinandersetzung mit Xalabar"
	}
}

--------------------------------------------------------
----- MAINQUEST-MANAGEMENT ENDS HERE -------------------
--------------------------------------------------------





------------------------------
----------- Cutszene 1: Xalaban
---- wird gestartet, wenn der Spieler in die Hallen eintritt

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange{X = 100 , Y = 356 , Range = 5 , FigureType = FigureAvatar, UpdateInterval = 10} 
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_nP210_ShowXalabanCutscene"}
	}
}
-------------------------------


---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
--- Raum 2: Zerbitengeister-Aktionen, sobald Lichkönig Ankthar am Monument herbeigerufen wird

OnOneTimeEvent
{
	Conditions =
	{
		IsCreoActive{ CreoId = 2319 },
	},
	Actions =
	{
		SetGlobalFlagTrue{ Name = "g_P210_ZerbitsRoom2Spawn"},
		IncreaseGlobalCounter {Name ="g_210_Room2ZerbitsOutcriesAnkthar"},
	}    
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_210_Room2ZerbitsOutcriesAnkthar", Value = 1, Operator = Equal},
	},
	Actions =
	{
		Outcry {NpcId = 9377, String = "Er ist es! Ankthar ist zurückgekehrt!", Tag = "oca2zerbiteghostP210_001"},
		IncreaseGlobalCounter {Name ="g_210_Room2ZerbitsOutcriesAnkthar"},
		SetGlobalTimeStamp {Name ="g_210_OutcriesTimeStamp"},
	}    
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_210_Room2ZerbitsOutcriesAnkthar", Value = 2, Operator = Equal},
		IsGlobalTimeElapsed {Name ="g_210_OutcriesTimeStamp", Seconds = 8}
	},
	Actions =
	{
		Outcry {NpcId = 9377, String = "Aber er erkennt uns nicht. Er weiß nicht, wo er ist.", Tag = "oca2zerbiteghostP210_002"},
		IncreaseGlobalCounter {Name ="g_210_Room2ZerbitsOutcriesAnkthar"},
		SetGlobalTimeStamp {Name ="g_210_OutcriesTimeStamp"},
	}    
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_210_Room2ZerbitsOutcriesAnkthar", Value = 3, Operator = Equal},
		IsGlobalTimeElapsed {Name ="g_210_OutcriesTimeStamp", Seconds = 8}
	},
	Actions =
	{
		Outcry {NpcId = 9377, String = "Er hat alles vergessen. Hokans Marter hat seinen Geist verwirrt.", Tag = "oca2zerbiteghostP210_003"},
		IncreaseGlobalCounter {Name ="g_210_Room2ZerbitsOutcriesAnkthar"},
		SetGlobalTimeStamp {Name ="g_210_OutcriesTimeStamp"},
	}    
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name ="g_210_Room2ZerbitsOutcriesAnkthar", Value = 4, Operator = Equal},
		IsGlobalTimeElapsed {Name ="g_210_OutcriesTimeStamp", Seconds = 8}
	},
	Actions =
	{
		Outcry {NpcId = 9377, String = "Nun ist er nur noch ein Sklave der Rune.", Tag = "oca2zerbiteghostP210_004"},
		IncreaseGlobalCounter {Name ="g_210_Room2ZerbitsOutcriesAnkthar"},
	}    
}
----------------------------- Ankthar-Aktionen Raum 2 ENDS HERE ---------------------------------
-------------------------------------------------------------------------------------------------



-----------------------------------------------------------
------  STEINZUNGE IST ZU BEGINN IN HEAD 0 (RAUM 1)  ------
-----------------------------------------------------------

OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{ Name = "g_210_TongueInHead0" },
	}    
}




-----------------------------------------------------------
-----------------------------------------------------------
--- 		AUGENSCHALTER
-----------------------------------------------------------
-----------------------------------------------------------

--- Initialisierung: Set 1
--- Zu Beginn sind alle Augenschalter offen

OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210Room1aEye01On"},
		SetGlobalFlagTrue{Name = "g_P210Room1aEye02On"},
		SetGlobalFlagTrue{Name = "g_P210Room1aEye03On"},
		SetGlobalFlagTrue{Name = "g_P210Room1aEye04On"},
		SetGlobalFlagTrue{Name = "g_P210Room1aEye05On"},
		SetGlobalFlagTrue{Name = "g_P210Room1aEye06On"},
		SetGlobalFlagTrue{Name = "g_P210Room1aEye07On"},
		SetGlobalFlagTrue{Name = "g_P210Room1aEye08On"},
		SetGlobalFlagTrue{Name = "g_P210Room1aEye09On"},
	}
}


--- Set 1 - Effekt, wenn eines der Augen offen ist
OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		Negated(
		UND9{
		IsGlobalFlagFalse{Name = "g_P210Room1aEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye09On", UpdateInterval = 30}
		}
		)
	},
	OnActions	=
	{
		SetEffect { X = 132 , Y = 344 , Effect = "Lightning", Length = 0, TargetType = World },     
		SetGlobalFlagFalse { Name = "g_P210_EyesSet1Solved" },
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210Room1aEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1aEye09On", UpdateInterval = 30},
	},
	OffActions	=
	{
		StopEffect { X = 132 , Y = 344 , TargetType = World },
		SetGlobalFlagTrue { Name = "g_P210_EyesSet1Solved" },
		SetRewardFlagTrue { Name = "AugenSet1Solved" },
	}
}

--- Initialisierung: Set 2
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210Room1bEye01On"},
		SetGlobalFlagTrue{Name = "g_P210Room1bEye02On"},
		SetGlobalFlagFalse{Name = "g_P210Room1bEye03On"},
		SetGlobalFlagTrue{Name = "g_P210Room1bEye04On"},
		SetGlobalFlagFalse{Name = "g_P210Room1bEye05On"},
		SetGlobalFlagFalse{Name = "g_P210Room1bEye06On"},
		SetGlobalFlagFalse{Name = "g_P210Room1bEye07On"},
		SetGlobalFlagFalse{Name = "g_P210Room1bEye08On"},
		SetGlobalFlagFalse{Name = "g_P210Room1bEye09On"},
	}
}

--- Set 2 - Effekt, wenn eines der Augen offen ist
OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		Negated(
		UND9{
		IsGlobalFlagFalse{Name = "g_P210Room1bEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye09On", UpdateInterval = 30}
		}
		)
	},
	OnActions	=
	{
		SetEffect { X = 155 , Y = 337 , Effect = "Lightning", Length = 0, TargetType = World },     
		SetGlobalFlagFalse { Name = "g_P210_EyesSet2Solved" },
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210Room1bEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1bEye09On", UpdateInterval = 30},
	},
	OffActions	=
	{
		StopEffect { X = 155 , Y = 337 , TargetType = World },
		SetGlobalFlagTrue { Name = "g_P210_EyesSet2Solved" },
		SetRewardFlagTrue { Name = "AugenSet2Solved" },
	}
}


--- Initialisierung: Set 3
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P210Room1cEye01On"},
		SetGlobalFlagFalse{Name = "g_P210Room1cEye02On"},
		SetGlobalFlagFalse{Name = "g_P210Room1cEye03On"},
		SetGlobalFlagTrue{Name = "g_P210Room1cEye04On"},
		SetGlobalFlagFalse{Name = "g_P210Room1cEye05On"},
		SetGlobalFlagTrue{Name = "g_P210Room1cEye06On"},
		SetGlobalFlagFalse{Name = "g_P210Room1cEye07On"},
		SetGlobalFlagFalse{Name = "g_P210Room1cEye08On"},
		SetGlobalFlagFalse{Name = "g_P210Room1cEye09On"},
	}
}


--- Set 3 - Effekt, wenn eines der Augen offen ist
OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		Negated(
		UND9{
		IsGlobalFlagFalse{Name = "g_P210Room1cEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye09On", UpdateInterval = 30}
		}
		)
	},
	OnActions	=
	{
		SetEffect { X = 132 , Y = 371 , Effect = "Lightning", Length = 0, TargetType = World },     
		SetGlobalFlagFalse { Name = "g_P210_EyesSet3Solved" },
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210Room1cEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1cEye09On", UpdateInterval = 30},
	},
	OffActions	=
	{
		StopEffect { X = 132 , Y = 371 , TargetType = World },
		SetGlobalFlagTrue { Name = "g_P210_EyesSet3Solved" },
		SetRewardFlagTrue { Name = "AugenSet3Solved" },
	}
}

--- Initialisierung: Set 4
OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210Room1dEye01On"},
		SetGlobalFlagFalse{Name = "g_P210Room1dEye02On"},
		SetGlobalFlagFalse{Name = "g_P210Room1dEye03On"},
		SetGlobalFlagTrue{Name = "g_P210Room1dEye04On"},
		SetGlobalFlagTrue{Name = "g_P210Room1dEye05On"},
		SetGlobalFlagFalse{Name = "g_P210Room1dEye06On"},
		SetGlobalFlagFalse{Name = "g_P210Room1dEye07On"},
		SetGlobalFlagFalse{Name = "g_P210Room1dEye08On"},
		SetGlobalFlagFalse{Name = "g_P210Room1dEye09On"},
	}
}


--- Set 4 - Effekt, wenn eines der Augen offen ist
OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		Negated(
		UND9{
		IsGlobalFlagFalse{Name = "g_P210Room1dEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye09On", UpdateInterval = 30}
		}
		)
	},
	OnActions	=
	{
		SetEffect { X = 156 , Y = 384 , Effect = "Lightning", Length = 0, TargetType = World },     
		SetGlobalFlagFalse { Name = "g_P210_EyesSet4Solved" },
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210Room1dEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room1dEye09On", UpdateInterval = 30},
	},
	OffActions	=
	{
		StopEffect { X = 156 , Y = 384 , TargetType = World },
		SetGlobalFlagTrue { Name = "g_P210_EyesSet4Solved" },
		SetRewardFlagTrue { Name = "AugenSet4Solved" },
	}
}

--- Überprüfen, ob Spieler über die Augenplatten läuft
OnOneTimeEvent
{
	UpdateInterval = 15,
	Conditions =
	{
		PlayerUnitInRange{ X = 132 , Y = 344 , Range = 2 , FigureType = FigureAll, UpdateInterval = 15},
		IsGlobalFlagFalse { Name = "g_P210_EyesSet1Solved" },
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_Set1EyesTouched"},
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
		RemoveObject{ X = 140, Y = 353, Object = 3064 }
	}
}

OnOneTimeEvent
{
	UpdateInterval = 15,
	Conditions =
	{
		PlayerUnitInRange{ X = 155 , Y = 337 , Range = 2 , FigureType = FigureAll, UpdateInterval = 15},
		IsGlobalFlagFalse { Name = "g_P210_EyesSet2Solved" },
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_Set2EyesTouched"},
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
		RemoveObject{ X = 173, Y = 344, Object = 3068 }
	}
}

OnOneTimeEvent
{
	UpdateInterval = 15,
	Conditions =
	{
		PlayerUnitInRange{ X = 132 , Y = 371 , Range = 2 , FigureType = FigureAll, UpdateInterval = 15},
		IsGlobalFlagFalse { Name = "g_P210_EyesSet3Solved" },
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_Set3EyesTouched"},
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
		RemoveObject{ X = 147, Y = 386, Object = 3065 }
	}
}

OnOneTimeEvent
{
	UpdateInterval = 15,
	Conditions =
	{
		PlayerUnitInRange{ X = 156 , Y = 384 , Range = 2 , FigureType = FigureAll, UpdateInterval = 15},
		IsGlobalFlagFalse { Name = "g_P210_EyesSet4Solved" },
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_Set4EyesTouched"},
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
		RemoveObject{ X = 168, Y = 381, Object = 3150 }
	}
}

---------------- ENDE AUGENBODENPLATTEN ------------------
----------------------------------------------------------


---- RAUM 2: Lichtorgel / Senso ----
---- Wenn Spieler die Lichtorgel korrekt nachspielt, öffnen sich die Good oder Bad Gates
---- je nachdem, ob er Phoenixstein- oder Schattenschwert-Traeger ist

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "P210_Room2RightComboLit", Value = 5, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_Room2GoodGatesOpen"},
		SetRewardFlagTrue{Name = "Room2SensoSolved"},
		RemoveDialog {NpcId = 8640 }, 
		RemoveDialog {NpcId = 8641 },
		RemoveDialog {NpcId = 8642 },
		RemoveDialog {NpcId = 8643 },
		RemoveDialog {NpcId = 8644 },
		RemoveDialog {NpcId = 8645 },
		RemoveDialog {NpcId = 8646 },
		RemoveDialog {NpcId = 8647 },
		RemoveDialog {NpcId = 8648 },
		RemoveDialog {NpcId = 8649 },
		RemoveDialog {NpcId = 8650 },
		RemoveDialog {NpcId = 8651 },
		RemoveDialog {NpcId = 8652 },            
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter{Name = "P210_Room2RightComboLit", Value = 5, Operator = IsEqual},
		IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_Room2BadGatesOpen"},
		SetRewardFlagTrue{Name = "Room2SensoSolved"},
		RemoveDialog {NpcId = 8640 }, 
		RemoveDialog {NpcId = 8641 },
		RemoveDialog {NpcId = 8642 },
		RemoveDialog {NpcId = 8643 },
		RemoveDialog {NpcId = 8644 },
		RemoveDialog {NpcId = 8645 },
		RemoveDialog {NpcId = 8646 },
		RemoveDialog {NpcId = 8647 },
		RemoveDialog {NpcId = 8648 },
		RemoveDialog {NpcId = 8649 },
		RemoveDialog {NpcId = 8650 },
		RemoveDialog {NpcId = 8651 },
		RemoveDialog {NpcId = 8652 }, 
	}
}
----------------------------------------------




---- Raum 7 : Schachbrett
---- Sobald Spieler Schachbrett einmal durchlaufen hat, öffnen sich die beiden Türen, um seine
---- Helden nachziehen zu können

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange{ X = 98 , Y = 160 , Range = 7 , FigureType = FigureAvatar, UpdateInterval = 20},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_Room7ChessboardDone"},
		SetRewardFlagTrue { Name = "Room7ChessboardCrossed" },
	}
}

---------------------------------------------





---------------------------------------------
--- Raum 3
--- Sobald einer der Köpfe im Labyrinth aktiviert wurde,
--- wird die Single-Head-Glowing-Cutscene gezeigt.
--- Es wird insgesamt nur dreimal die Cutscene gezeigt,
--- danach muß es der Spieler selbst kapiert haben

OnOneTimeEvent
{
	UpdateInterval = 20,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_210_Room3Head1On" },
		Negated(IsGlobalCounter{Name = "g_P210_HeadCutscenesShown", Value = 3, Operator = IsGreaterOrEqual}),
		
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_nP210_ShowHeadGlow"},
		IncreaseGlobalCounter {Name = "g_P210_HeadCutscenesShown" }
	}
}


OnOneTimeEvent
{
	UpdateInterval = 20,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_210_Room3Head2On" },
		Negated(IsGlobalCounter{Name = "g_P210_HeadCutscenesShown", Value = 3, Operator = IsGreaterOrEqual}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_nP210_ShowHeadGlow"},
		IncreaseGlobalCounter {Name = "g_P210_HeadCutscenesShown" }
	}
}

OnOneTimeEvent
{
	UpdateInterval = 20,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_210_Room3Head3On" },
		Negated(IsGlobalCounter{Name = "g_P210_HeadCutscenesShown", Value = 3, Operator = IsGreaterOrEqual}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_nP210_ShowHeadGlow"},
		IncreaseGlobalCounter {Name = "g_P210_HeadCutscenesShown" }
	}
}

OnOneTimeEvent
{
	UpdateInterval = 20,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_210_Room3Head4On" },
		Negated(IsGlobalCounter{Name = "g_P210_HeadCutscenesShown", Value = 3, Operator = IsGreaterOrEqual}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_nP210_ShowHeadGlow"},
		IncreaseGlobalCounter {Name = "g_P210_HeadCutscenesShown" }
	}
}

OnOneTimeEvent
{
	UpdateInterval = 20,
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_210_Room3Head5On" },
		Negated(IsGlobalCounter{Name = "g_P210_HeadCutscenesShown", Value = 3, Operator = IsGreaterOrEqual}),
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_nP210_ShowHeadGlow"},
		IncreaseGlobalCounter {Name = "g_P210_HeadCutscenesShown" }
	}
}

--------------------------------
--- Wenn alle 5 Köpfe leuchten, öffnet sich das Tor
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_210_Room3Head1On" },
		IsGlobalFlagTrue { Name = "g_210_Room3Head2On" },
		IsGlobalFlagTrue { Name = "g_210_Room3Head3On" },
		IsGlobalFlagTrue { Name = "g_210_Room3Head4On" },
		IsGlobalFlagTrue { Name = "g_210_Room3Head5On" },
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P210_ShowFiveHeadGateOpen"},
		SetRewardFlagTrue { Name = "Room3HeadDoorOpened" },
	}
}

---------------------------------------------
----------------------------------------------------------



----------------------------------------------------------
---------- RAUM 8                                  -------
---------- Sobald Spieler einmal an den drehenden Köpfen -
---------- vorbei ist, werden die                  -------
---------- östlichen abgeschaltet                  -------
----------------------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange{ X = 265 , Y = 168 , Range = 3 , FigureType = FigureAll, UpdateInterval = 30},
	},
	Actions =
	{
		SetRewardFlagTrue { Name = "TurningHeadsCrossed" },
		SetGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead1Trap"},
		SetGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead5Trap"},
		SetGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead6Trap"},
		SetGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead7Trap"},
		SetGlobalFlagTrue{ Name = "g_P210_Room8PlayerInHead8Trap"},
		StopEffect { X = 227, Y = 180, TargetType = World },
		StopEffect { X = 222, Y = 180, TargetType = World },
		StopEffect { X = 217, Y = 180, TargetType = World },
		StopEffect { X = 222, Y = 165, TargetType = World },
		StopEffect { X = 217, Y = 165, TargetType = World },
		StopEffect { X = 217, Y = 159, TargetType = World },
		StopEffect { X = 232, Y = 160, TargetType = World },
		StopEffect { X = 227, Y = 165, TargetType = World },
		StopEffect { X = 237, Y = 165, TargetType = World },
		StopEffect { X = 242, Y = 165, TargetType = World },
		StopEffect { X = 237, Y = 160, TargetType = World },
		StopEffect { X = 247, Y = 160, TargetType = World },
		StopEffect { X = 252, Y = 175, TargetType = World },
		StopEffect { X = 257, Y = 165, TargetType = World },
		StopEffect { X = 257, Y = 170, TargetType = World },
		StopEffect { X = 257, Y = 165, TargetType = World },
		StopEffect { X = 252, Y = 165, TargetType = World },
		StopEffect { X = 247, Y = 165, TargetType = World },
		StopEffect { X = 247, Y = 170, TargetType = World },
		StopEffect { X = 247, Y = 175, TargetType = World },
	}
}



-----------------------------------------------------------
-----------------------------------------------------------
--- 		AUGENSCHALTER IN RAUM 9
-----------------------------------------------------------
-----------------------------------------------------------

--- Initialisierung: Set Z
--- Zu Beginn ist nur der Augenschalter in der Mitte auf

OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagFalse{Name = "g_P210Room9zEye01On"},
		SetGlobalFlagFalse{Name = "g_P210Room9zEye02On"},
		SetGlobalFlagFalse{Name = "g_P210Room9zEye03On"},
		SetGlobalFlagFalse{Name = "g_P210Room9zEye04On"},
		SetGlobalFlagTrue{Name = "g_P210Room9zEye05On"},
		SetGlobalFlagFalse{Name = "g_P210Room9zEye06On"},
		SetGlobalFlagFalse{Name = "g_P210Room9zEye07On"},
		SetGlobalFlagFalse{Name = "g_P210Room9zEye08On"},
		SetGlobalFlagFalse{Name = "g_P210Room9zEye09On"},
	}
}


--- Set 1 - Effekt, wenn eines der Augen offen ist
OnToggleEvent 
{
	UpdateInterval = 30,
	OnConditions =
	{
		Negated(
		UND9{
		IsGlobalFlagFalse{Name = "g_P210Room9zEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye09On", UpdateInterval = 30}
		}
		)
	},
	OnActions	=
	{
		SetEffect { X = 301 , Y = 203 , Effect = "Lightning", Length = 0, TargetType = World },     
		SetGlobalFlagFalse { Name = "g_P210_EyesSet99Solved" },
	},
	OffConditions =
	{
		IsGlobalFlagFalse{Name = "g_P210Room9zEye01On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye02On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye03On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye04On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye05On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye06On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye07On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye08On", UpdateInterval = 30},
		IsGlobalFlagFalse{Name = "g_P210Room9zEye09On", UpdateInterval = 30},
	},
	OffActions	=
	{
		StopEffect { X = 301 , Y = 203 , TargetType = World },
		SetGlobalFlagTrue { Name = "g_P210_EyesSet99Solved" },
	}
}

OnOneTimeEvent
{
	UpdateInterval = 15,
	Conditions =
	{
		PlayerUnitInRange{ X = 301 , Y = 203 , Range = 2 , FigureType = FigureAll, UpdateInterval = 15},
		IsGlobalFlagFalse { Name = "g_P210_EyesSet99Solved" },
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_Set99EyesTouched"},
		IncreaseGlobalCounter{Name = "g_P210_MajorMistakesMade"},
	}
}

---------------------------------------------------------------------------

--- I--------------------------I
--- I         Raum 9:          I
--- I      Stelenrätsel        I
--- I--------------------------I
---
--- Zu Beginn sind die Stelen 2 und 6 an

OnOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue{Name = "P210Room9Stele02On"},
		SetGlobalFlagTrue{Name = "P210Room9Stele06On"},
	}
}

-----------------------------------


--- I----------------------------------------I
--- I               Sidequest                I
--- I        Vermächtnis der Zerbiten        I
--- I----------------------------------------I
---
--- 

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "g_P210_RuneAnktharReturned"},
		QuestState{QuestId = 1034, State = StateActive}

	},
	Actions = 
	{
		QuestSolve{QuestId = 1034}
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 1041, State = StateActive},
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "g_P210_StartCutsceneVermaechtnis"},
		QuestSolve{QuestId = 1041},
		QuestBegin{QuestId = 1069},
	},
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
