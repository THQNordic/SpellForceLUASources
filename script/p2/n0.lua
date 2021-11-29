function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


--DebugInitAction(		SetGlobalFlagTrue{Name = "AfterSpawn"} )


---Queststatus initialisieren -Q26-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 26 ,  State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 26},
		QuestBegin{QuestId = 448},
		}
}
---Liannon solven
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 262 ,  State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 262},
		QuestSolve{QuestId = 14},
		}
}
---Toröffnen anschalten
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3178}
		},
Actions =	{
		QuestBegin{QuestId = 452},
		}
}
REM = [[
-- Goblin Spawn Location "disablen" wenn spawnboss tot ist
OnOneTimeEvent
{
	Conditions = {
		FigureDead{NpcId = 1800},
	}, 
	Actions = { 
		StopEffect{X = 233, Y = 144},
		SetEffect{Effect = "AreaHit", TargetType = World, X = 233, Y = 144},
	}
}
]]

--SUPPORT RANGERS PART BEGINS HERE

--Spawn und aufmarsch abschalten, wenn alle gespawnt und aufmarschiert sind und vice versa
OnToggleEvent
{
UpdateInterval = 20 ,
OnConditions = 	{
		IsGlobalFlagFalse{Name = "EloniSupportRangersAllDead"},
		QuestState{QuestId = 26 , State = StateActive}, 
		FigureDead{NpcId = 1930},
		FigureDead{NpcId = 1931},
		FigureDead{NpcId = 1932},
		},
OnActions = 	{
		SetGlobalFlagTrue{Name = "EloniSupportRangersAllDead"},
		SetGlobalFlagTrue{Name = "EloniSupportRangersCheckForRespawn"},
		SetGlobalFlagFalse{Name = "EloniSupportRangersMustChangeOwner"},
		},
OffConditions = {
		IsGlobalFlagTrue{Name = "EloniSupportRangersSpawning", UpdateInterval = 10},
		FigureInRange{X = 187, Y = 239, NpcId = 1930 , Range = 0},
		FigureInRange{X = 186, Y = 240, NpcId = 1931 , Range = 0},
		FigureInRange{X = 186, Y = 238, NpcId = 1932 , Range = 0},
		 },
OffActions = 	{
		SetGlobalFlagFalse{Name = "EloniSupportRangersAllDead"},
		SetGlobalFlagFalse{Name = "EloniSupportRangersSpawning"},
		SetGlobalFlagFalse{Name = "EloniSupportRangersDeadAndTimerOk"},
		SetGlobalFlagTrue{Name = "EloniSupportRangersMustChangeOwner"},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1930},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1931},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1932},
		},
}

OnPlatformOneTimeEvent
{
Conditions =	{
		FigureAlive{NpcId = 1930},
		IsGlobalFlagTrue{Name = "EloniSupportRangersMustChangeOwner", UpdateInterval = 10},
				},
Actions =		{
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1930},
				}
}
OnPlatformOneTimeEvent
{
Conditions =	{
		FigureAlive{NpcId = 1931},
		IsGlobalFlagTrue{Name = "EloniSupportRangersMustChangeOwner", UpdateInterval = 10},
				},
Actions =		{
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1931},
				}
}
OnPlatformOneTimeEvent
{
Conditions =	{
		FigureAlive{NpcId = 1932},
		IsGlobalFlagTrue{Name = "EloniSupportRangersMustChangeOwner", UpdateInterval = 10},
				},
Actions =		{
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1932},
				}
}


--Prüfen ob alle hinüber sind und der Timer schon um, wg Dialogsteuerung

OnEvent
{
Conditions =	{
		IsGlobalFlagTrue{Name = "EloniSupportRangersCheckForRespawn"},
		IsGlobalFlagTrue{Name = "EloniSupportRangersAllDead"},
		IsGlobalTimeElapsed{Name = "EloniSupportRangersTimer", Seconds = 300, UpdateInterval = 60}
		},

Actions =	{
		SetGlobalFlagTrue{Name = "EloniSupportRangersDeadAndTimerOk"},
		SetGlobalFlagFalse{Name = "EloniSupportRangersCheckForRespawn"} 
		}
}

--Einmal den Spawn gleich freigeben (erstes mal)
OneTimeInitAction(	SetGlobalFlagTrue{Name = "EloniSupportRangersDeadAndTimerOk"} )


----SUPPORT RANGERS PART ENDS HERE
--Torsatz anschalten
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 27 , State = StateActive},
				FigureInRange{X = 314 , Y = 148, NpcId = 1400 , Range = 5 , UpdateInterval = 20}
				},
Actions =		{
				SetGlobalFlagTrue{Name = "Q26GateSentenceOn"},
				}
}
--Zarn tot?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 451 , State = StateActive},
				FigureDead{NpcId = 1801},
				},
Actions =		{
				QuestBegin{QuestId = 452},
				QuestSolve{QuestId = 451},
				}
}
--Hauptquest subbereich solven
---- -Q133-
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 27 , State = StateActive},
		--Negated(EnemyUnitInRange{X = 188 , Y = 289 , Radius = 10 , NpcId = 1399 , UnitId = 0}),
		--Negated(BuildingInRange{X = 188 , Y = 289, Range = 10 , Owner = OwnerNpc , BuildingId = 0}),
		IsGlobalFlagTrue {Name = "ElonieBridgeI"},
		IsGlobalFlagTrue {Name = "ElonieBridgeII"},
		IsGlobalFlagTrue {Name = "ElonieBridgeIII"},
	},
	Actions =		
	{
		QuestSolve{QuestId = 133},
		QuestBegin{QuestId = 132}
	}
}
--Village Safe Flag setzen
OnToggleEvent
{
	OnConditions =	
	{
		--Negated(EnemyUnitInRange{X = 188 , Y = 289 , Radius = 10 , NpcId = 1399 , UnitId = 0})
		IsGlobalFlagTrue {Name = "ElonieBridgeI"},
		IsGlobalFlagTrue {Name = "ElonieBridgeII"},
		IsGlobalFlagTrue {Name = "ElonieBridgeIII"},
	},
	OnActions =		
	{
		SetGlobalFlagTrue{Name = "Q132VillageSafe"}
	},
	OffConditions =	
	{
		--EnemyUnitInRange{X = 188 , Y = 289 , Radius = 10 , NpcId = 1399 , UnitId = 0}
		IsGlobalFlagFalse {Name = "ElonieBridgeI"},
		IsGlobalFlagFalse {Name = "ElonieBridgeII"},
		IsGlobalFlagFalse {Name = "ElonieBridgeIII"},
	},
	OffActions =	
	{
		SetGlobalFlagFalse{Name = "Q132VillageSafe"}
	}
}
---Hauptquest Part 1 Solver 
---- -Q27- -Q28-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 27 , State = StateActive},
		QuestState{QuestId = 133 , State = StateSolved},
		QuestState{QuestId = 132 , State = StateSolved},
		IsPlayerFlagTrue{Name = "QuestSolveSaveVillage" , UpdateInterval = 5},
		},
Actions =	{
		QuestSolve{QuestId = 27},
		QuestBegin{QuestId = 28}
		}
}


--Hauptquest Reward von Lycande
---- -Q26-
OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "RewardFlagLycandeSaveVillage"}
		},
Actions =	{
		TransferItem{GiveItem = 783 , Flag = Give},
		TransferItem{GiveItem = 257 , Flag = Give},
		TransferItem{GiveItem = 277 , Flag = Give},
		TransferItem{GiveItem = 949 , Flag = Give},
		TransferItem{GiveItem = 251 , Flag = Give},
		TransferItem{GiveItem = 1263 , Flag = Give},
		TransferItem{GiveItem = 1267 , Flag = Give},
		TransferXP{XP = 40 , Flag = Give},
		}
}

--Quest zu den Schützen im Osten als unlösbar setzten, wenn Lian stirbt 
---- -Q33-
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1411},
		QuestState{QuestId = 33 , State = StateActive},
		},
Actions =	{
		QuestChangeState{QuestId = 33 , State = StateUnsolvable}
		}
}

--Quest zu den Schützen im Wald als unlösbar setzten, wenn Elendin stirbt 
---- -Q31-
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1500},
		QuestState{QuestId = 31 , State = StateActive},
		},
Actions =	{
		QuestChangeState{QuestId = 31 , State = StateUnsolvable}
		}
}

--Quest zu den Schützen im Nordosten als unlösbar setzten, wenn Silvenstirbt 
---- -Q35-
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1505},
		QuestState{QuestId = 35 , State = StateActive},
		},
Actions =	{
		QuestChangeState{QuestId = 35 , State = StateUnsolvable}
		}
}




---Quests vergeben wenn Sidahan ihre Flags setzt, Abgleich mit möglichen Questzuständen 
---- -Q29- -Q30- -Q32- -Q34-
OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "GiveQuestRescueElfTroops"},
		QuestState{QuestId = 29 , State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 29}
		}
}

OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "GiveQuestFindForestGroup"},
		QuestState{QuestId = 30 , State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 30}
		}
}

OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "GiveQuestFindEastGroup"},
		QuestState{QuestId = 32 , State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 32}
		}
}

OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "GiveQuestFindNorthEastGroup"},
		QuestState{QuestId = 34 , State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 34}
		}
}

----Check für das Solven der Sidequest Schützen 
---Erst für kompletten Misserfolg 
---- -Q31- -Q33- -Q35- -Q29-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 31 , State = StateUnsolvable},
		QuestState{QuestId = 33 , State = StateUnsolvable},
		QuestState{QuestId = 35 , State = StateUnsolvable},
		},
Actions =	{
		QuestChangeState{QuestId = 29 , State = StateUnsolvable}
		}
}

---Dann die anderen Zustände 
---- -Q31- -Q33- -Q35- -Q29-
OnOneTimeEvent
{
Conditions =	{
		Negated(QuestState{QuestId = 31 , State = StateUnknown}),
		Negated(QuestState{QuestId = 31 , State = StateActive}),
		Negated(QuestState{QuestId = 33 , State = StateUnknown}),
		Negated(QuestState{QuestId = 33 , State = StateActive}),
		Negated(QuestState{QuestId = 35 , State = StateUnknown}),
		Negated(QuestState{QuestId = 35 , State = StateActive}),
		},
Actions =	{
		QuestSolve{QuestId = 29}
		}
}
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 31 , State = StateSolved},
		QuestState{QuestId = 33 , State = StateSolved},
		FigureDead{NpcId = 1505}
		},
Actions =	{
		QuestSolve{QuestId = 29}
		}
}
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 31 , State = StateSolved},
		QuestState{QuestId = 35 , State = StateSolved},
		FigureDead{NpcId = 1500}
		},
Actions =	{
		QuestSolve{QuestId = 29}
		}
}
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 33 , State = StateSolved},
		QuestState{QuestId = 35 , State = StateSolved},
		FigureDead{NpcId = 1411}
		},
Actions =	{
		QuestSolve{QuestId = 29}
		}
}
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 33 , State = StateSolved},
		FigureDead{NpcId = 1505},
		FigureDead{NpcId = 1411}
		},
Actions =	{
		QuestSolve{QuestId = 29}
		}
}
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 31 , State = StateSolved},
		FigureDead{NpcId = 1500},
		FigureDead{NpcId = 1505}
		},
Actions =	{
		QuestSolve{QuestId = 29}
		}
}
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 35 , State = StateSolved},
		FigureDead{NpcId = 1500},
		FigureDead{NpcId = 1411}
		},
Actions =	{
		QuestSolve{QuestId = 29}
		}
}




--Locke der Dryade gefunden / Kranker-Einsiedler-Quest
-- Q358 -Q367 -Q368
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 368 , State = StateActive},
		PlayerHasItem{ItemId = 2903}
		},
Actions =	{
		QuestSolve{QuestId = 368 },
		QuestBegin{QuestId = 369 }
		}
}

------------------------------------------------------------------------------------------------------------------------
-- FORMER STORMCLEAVER QUEST STATES .............................................................................
------------------------------------------------------------------------------------------------------------------------

--DREAMQUEST BLOCK BEGINS HERE
--Sharknars tod prüfen
---- -Q73- -Q74- -Q75-
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 2906},
		QuestState{QuestId = 74 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 74},
		QuestBegin{QuestId = 75}
		}
}

--Traumdieb tod prüfen
---- -Q73- -Q75- -Q76-
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1936},	-- traumdieb behält alte npcid bei
		QuestState{QuestId = 75 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 75},
		QuestBegin{QuestId = 76}
		}
}

--Obsidian und Quest prüfen
---- -Q73- -Q76-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2166},
		QuestState{QuestId = 76 , State = StateActive}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q73GotObsidianandQuest"}
		}
}



--HOMUNCULUS QUEST SOLVER
--Solver für Obsidian

OnEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2166},
				QuestState{QuestId = 233 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 233},
				QuestBegin{QuestId = 234},
				}
}

--DREAMQUEST BLOCK ENDS HERE


-- MERCHANT vs. OGRE QUEST (WHATEVeR)

--Solver ob Tor offen WORKAROUND !TO DO! Wenn Tore da sind, hier richtig prüfen
---- -Q67- -Q68-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 67 , State = StateActive, UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "EloniGateSWOpen" , UpdateInterval = 20},
		},
Actions =	{
		QuestSolve{QuestId = 67},
		QuestBegin{QuestId = 68},
		TransferXP{XP = 40 , Flag = Give},
		}
}

--Solver ob der Spieler die oger Erreicht hat
---- -Q68- -Q69-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 68 , State = StateActive, UpdateInterval = 30},
		--FigureInRange{ X = 183 , Y = 116 , NpcId = Avatar , Range = 12},
		ODER(
			FigureHasAggro{NpcId = 3019, UpdateInterval = 10}, FigureHasAggro{NpcId = 3020, UpdateInterval = 10}
			),
		},
Actions =	{
		QuestSolve{QuestId = 68},
		QuestBegin{QuestId = 69},
		TransferXP{XP = 40 , Flag = Give}
		}
}

--Solver für oger (Beide brüder tot)
---- -Q69- -Q70-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 69 , State = StateActive},
		FigureDead{NpcId = 3019},
		FigureDead{NpcId = 3020},
		},
Actions =	{
		QuestSolve{QuestId = 69},
		QuestBegin{QuestId = 70},
		TransferXP{XP = 80 , Flag = Give}
		}
}

--Solver für Steinbruch und kompletter Solve der Freetrader, Spawnflag für Shadira & Co
---- -Q70- -Q66-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 70 , State = StateActive},
		-- irgendwie nicer wenn die aus der mine gelaufen kommen...
		Negated(BuildingInRange{X = 190 , Y = 112 , Range = 0 , Owner = OwnerNpc, BuildingId = 0})
		--Negated(EnemyUnitInRange{X = 184 , Y = 117 , Range = 9, UpdateInterval = 30})
		},
Actions =	{
		QuestSolve{QuestId = 70},
		QuestSolve{QuestId = 66},
		TransferXP{XP = 150 , Flag = Give},
		SetGlobalFlagTrue{Name = "Q66SpawnFreetraders"},
		}
}

--Rewardvergabe Jenquai
---- -Q66-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 66 , State = StateSolved},
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q66RewardSentence"}
		}
}


--SHADIRA BLOCK BEGINS HERE
--Rewards


--Reward Ring Rouge
---- -Q72- -Q1-
OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "Q72GiveRingRouge"}
		},
Actions =	{
		TransferItem{GiveItem = 637 , Flag = Give},
		}
}

--Reward Ring Rouge
---- -Q72- -Q1-
OnOneTimeEvent
{
Conditions =	{
		IsPlayerFlagTrue{Name = "Q72GiveRingEveryone"}
		},
Actions =	{
		TransferItem{GiveItem = 641 , Flag = Give},
		}
}

--Check für Ariafrost
---- -Q71- -Q1-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2155},
		QuestState{QuestId = 71 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 71},
		QuestBegin{QuestId = 72}
		}
}
--SHADIRA BLOCK ENDS HERE


-- erste Elfengruppe (Osten) Race ändern
-- alle Elfen neutral
OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 360,Y = 48, FigureType = FigureAvatar , Radius = 5 , UpdateInterval = 20},
	},
	Actions =
	{
		ChangeRace {NpcId = 1411, Race = 152},
		ChangeRace {NpcId = 1412, Race = 152},
		ChangeRace {NpcId = 1413, Race = 152},
		ChangeRace {NpcId = 1414, Race = 152},
		ChangeRace {NpcId = 1862, Race = 152},
		
		ChangeRace {NpcId = 1500, Race = 152},
		ChangeRace {NpcId = 1501, Race = 152},
		ChangeRace {NpcId = 1502, Race = 152},
		ChangeRace {NpcId = 1503, Race = 152},
		ChangeRace {NpcId = 1504, Race = 152},
		
		ChangeRace {NpcId = 1505, Race = 152},
		ChangeRace {NpcId = 1506, Race = 152},
		ChangeRace {NpcId = 1507, Race = 152},
		ChangeRace {NpcId = 1508, Race = 152},
		ChangeRace {NpcId = 1509, Race = 152},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 333,Y = 270, Radius = 15},	
	},
	Actions =
	{
		ChangeRace {NpcId = 1411, Race = 134},
		ChangeRace {NpcId = 1412, Race = 134},
		ChangeRace {NpcId = 1413, Race = 134},
		ChangeRace {NpcId = 1414, Race = 134},
		ChangeRace {NpcId = 1862, Race = 134},
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 263,Y = 230, Radius = 15}, 
	},
	Actions =
	{
		
		ChangeRace {NpcId = 1500, Race = 134},
		ChangeRace {NpcId = 1501, Race = 134},
		ChangeRace {NpcId = 1502, Race = 134},
		ChangeRace {NpcId = 1503, Race = 134},
		ChangeRace {NpcId = 1504, Race = 134},
		
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 351,Y = 405, Radius = 10},
	},
	Actions =
	{
		
		ChangeRace {NpcId = 1505, Race = 134},
		ChangeRace {NpcId = 1506, Race = 134},
		ChangeRace {NpcId = 1507, Race = 134},
		ChangeRace {NpcId = 1508, Race = 134},
		ChangeRace {NpcId = 1509, Race = 134},
	}
}

-- StepTrigger
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 213, Y = 328, Range = 10},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "OrcAttackEloni"},
	}
}


-- Outcries
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "EloniMonumentClaimedTimer", Seconds = 3000, UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "ElonieBridgeI", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "ElonieBridgeII", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "ElonieBridgeIII", UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{Tag = "outcrySidahanElo001", NpcId = 1400, String = "Beeilt Euch! Je länger Ihr wartet, desto besser sind sie vorbereitet!", Color = ColorWhite },
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "OrcAttackEloni", UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{Tag = "outcryLycandeElo001", NpcId = 1399, String = "Ein Gegenangriff! Wappnet Euch! Rasch!", Color = ColorWhite },
	}
}
	
EndDefinition()
end


