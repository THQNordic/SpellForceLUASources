function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Laden des Spawnfiles
dofile("script/p4/n0_CutsceneLookOutGoblin.lua")
dofile("script/p4/n1362_CutsceneEinarFinalBattle.lua")

--DebugInitAction(		SetGlobalFlagTrue{Name = "AfterSpawn"} )


OneTimeInitAction(ResetPlayerCounter{Name = "DeadandFreeElves"})



--Initialisieren von Quest Status
---- -Q18-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 18 , State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 18},
		QuestBegin{QuestId = 449},
		}
}
---Hauptquest Eloni und komplett Solver
---- -Q28- -Q27- -Q26
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 27 , State = StateSolved},
		QuestState{QuestId = 28 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 28},
		QuestSolve{QuestId = 26}
		}
}


--Hier kommen die Abfragen ob die Camps zerstört sind
---- -Q19- -Q20- -Q21-
OnOneTimeEvent
{
	Conditions = 	
	{
		QuestState{QuestId = 19 , State = StateActive},
		IsGlobalFlagTrue{Name = "MainCamp1"},
		IsGlobalFlagTrue{Name = "MainCamp2"},
		IsGlobalFlagTrue{Name = "MainCamp3"},
		IsGlobalFlagTrue{Name = "MainCamp4"},
	}, 	
	Actions =	
	{
		QuestSolve{QuestId = 19 , ActivateNextQuest = FALSE}
	}
}

OnOneTimeEvent
{
	Conditions = 	
	{
		QuestState{QuestId = 20 , State = StateActive},
		FigureDead {NpcId = 3255},
		IsGlobalFlagTrue{Name = "WoodCamp1"},
		IsGlobalFlagTrue{Name = "WoodCamp2"},
		IsGlobalFlagTrue{Name = "WoodCamp3"},
		IsGlobalFlagTrue{Name = "WoodCamp4"},
	}, 
	Actions =	
	{
		QuestSolve{QuestId = 20 , ActivateNextQuest = FALSE}
	}
}


OnOneTimeEvent
{
	Conditions = 	
	{
		QuestState{QuestId = 21 , State = StateActive},
		IsGlobalFlagTrue{Name = "Reinforcement1"},
		IsGlobalFlagTrue{Name = "Reinforcement2"},
		FigureDead{NpcId = 3255},
	}, 
	Actions =	
	{
		QuestSolve{QuestId = 21 , ActivateNextQuest = FALSE}
	}
}


---Solver für Mainquest Part 1, Lager zerstört
---- -Q23- -Q22- -Q19- -Q20- -Q21-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 19 , State = StateSolved},
		QuestState{QuestId = 20 , State = StateSolved},
		QuestState{QuestId = 21 , State = StateSolved},
		},
Actions =	{
		QuestSolve{QuestId = 23},
		QuestBegin{QuestId = 22}
		}
}

---Rewardvergabe und Solver Part 2 MainQuest Einar
---- -Q22-
OnOneTimeEvent
{
Conditions = 	{
		IsPlayerFlagTrue{Name = "GibRewardSiegelring"},
		--QuestState{QuestId = 22 , State = StateSolved}
		},
Actions =	{
		TransferItem{GiveItem = 2328, Flag = Give},
		}
}

---Solver für die MainQuest komplett 
---- -Q22- -Q23- -Q18-
--OnOneTimeEvent
--{
--Conditions =	{
--		QuestState{QuestId = 22 , State = StateSolved},
--		QuestState{QuestId = 23 , State = StateSolved}
--		},
--Actions =	{
--		QuestSolve{QuestId = 18}
--		}
--}
--Anschalten des HQDone für EinarsDialog
OnOneTimeEvent
{
Conditions =	{
		IsGlobalFlagFalse{Name = "Q23HQDone"},
		QuestState{QuestId = 19 , State = StateSolved},
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q23HQDone"}
		}
}
--Und wieder aus
OnOneTimeEvent
{
Conditions =	{
		IsGlobalFlagTrue{Name = "Q23HQDone"},
		PlayerUnitInRange{X = 248 , Y = 342 ,Range = 10 , FigureType = FigureAvatar , UpdateInterval = 10}
		},
Actions =	{
		SetGlobalFlagFalse{Name = "Q23HQDone"}
		}
}


		

--Hier wird geprüft ob der Spieler schon Elfen gerettet hat, bevor er die Quest beginnt 
--Workaround für singleCondition-Limit im Allclear-Export
---- -Q24- -Q25-
OnOneTimeEvent
{
Conditions =	{
		IsPlayerCounter{Name = "FreedElves" , Value = 0 ,  Operator = IsNotEqual}, 
		IsPlayerFlagTrue{Name = "FlagSinwenQuestion1"},
		Negated(QuestState{QuestId = 24 ,  State = StateActive})
		}, 
Actions = 	{
		SetPlayerFlagTrue{Name = "FlagElfquestGivenAlreadyFree"}
		}
}

OnOneTimeEvent
{
Conditions =	{
		IsPlayerCounter{Name = "FreedElves" , Value = 0 , Operator = IsEqual}, 
		IsPlayerFlagTrue{Name = "FlagSinwenQuestion1"},
		Negated(QuestState{QuestId = 24 , State = StateSolved})
		}, 
Actions = 	{
		SetPlayerFlagTrue{Name = "FlagElfquestGivenNoneFree"}
		}
}
--Siegbedingung für Elfenquest prüfen
---- -Q24 -Q25-
OnOneTimeEvent
{
Conditions =	{
		IsPlayerCounter{Name = "DeadandFreeElves" , Value = 10 , Operator = IsEqual},
		IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsNotEqual},
		QuestState{QuestId = 24 , State = StateActive},
		QuestState{QuestId = 25 , State = StateActive}
		}, 
Actions =	{
		QuestSolve{QuestId = 25 , ActivateNextQuest = FALSE}, 
		QuestBegin{QuestId = 462}
		}
}
OnOneTimeEvent
{
Conditions =	{
		IsPlayerCounter{Name = "DeadElves" , Value = 10 , Operator = IsEqual},
		QuestState{QuestId = 24 , State = StateActive},
		QuestState{QuestId = 25 , State = StateActive}
		}, 
Actions =	{
		QuestChangeState{QuestId = 25 , State = StateUnsolvable}, 
		QuestChangeState{QuestId = 24 , State = StateUnsolvable}, 
		}
}

--Failbedingung für Elfenquest
---- -Q24- -Q25-
--OnOneTimeEvent
--{
--Conditions =	{
--		IsPlayerCounter{Name = "DeadElves" , Value = 0 , Operator = IsNotEqual}, 
--		IsPlayerCounter{Name = "DeadandFreeElves", Value = 10 , Operator = IsEqual},
--		QuestState{QuestId = 24 , State = StateActive},
--		QuestState{QuestId = 25 , State = StateActive}
--		}, 
--Actions =	{
--		QuestChangeState{QuestId = 24 , State = StateUnsolvable}, 
--		QuestChangeState{QuestId = 25 , State = StateUnsolvable}, 
--		}
--}
		
--Jetzt wird das Sterben der Elfen überprüft
---- -Q24- -Q25-
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1366},
		IsPlayerFlagFalse{Name = "Elf1366Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1},
		}
}

OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1367},
		IsPlayerFlagFalse{Name = "Elf1367Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}

OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1368},
		IsPlayerFlagFalse{Name = "Elf1368Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}

OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1369},
		IsPlayerFlagFalse{Name = "Elf1369Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1370},
		IsPlayerFlagFalse{Name = "Elf1370Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1371},
		IsPlayerFlagFalse{Name = "Elf1371Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1372},
		IsPlayerFlagFalse{Name = "Elf1372Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1373},
		IsPlayerFlagFalse{Name = "Elf1373Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1374},
		IsPlayerFlagFalse{Name = "Elf1374Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}
OnOneTimeEvent
{
Conditions =	{
		FigureDead{NpcId = 1375},
		IsPlayerFlagFalse{Name = "Elf1375Freed"}
		}, 
Actions =	{
		IncreasePlayerCounter{Name = "DeadElves" , Step = 1}, 
		IncreasePlayerCounter{Name = "DeadandFreeElves" , Step = 1}
		}
}

--Ende des Sterbetests
--Alarm der Orks
OnOneTimeEvent
{
Conditions =	{
		EnemyUnitInRange{X = 324 , Y = 248, Radius = 10 , NpcId = 1364 , UnitId = 0, UpdateInterval = 30}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "KillComandGiven"}
		}
}
--Und losmetzeln
OnOneTimeEvent
{
Conditions =	{
		IsGlobalFlagTrue{Name = "KillComandGiven"}
		},
Actions =	{
		-- hier würde ich mal sagen das es safe ist, da das gemetzel nur stattfindet
		-- wenn spielereinheiten in der nähe sind, zumal die orks ohnehin aggro auf die elfen sind
		AttackTarget{Target = 1370 , NpcId = 1415 , FriendlyFire = FALSE},
		AttackTarget{Target = 1366 , NpcId = 1416 , FriendlyFire = FALSE},
		AttackTarget{Target = 1371 , NpcId = 1417 , FriendlyFire = FALSE},
		AttackTarget{Target = 1374 , NpcId = 1418 , FriendlyFire = FALSE},
		AttackTarget{Target = 1375 , NpcId = 1419 , FriendlyFire = FALSE}
		}
}

--SINWEN BLOCK BEGINS HERE


--Checker ob Spieler Beschwörerkreide hat und Queste
---- -Q335 -Q341 -Q345  - Zauberwerk-Quest/Beschwörerkreide
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2896 },
		QuestState{QuestId = 350 , State = StateActive}
		},
Actions =	{
		QuestBegin{QuestId = 342},
		QuestSolve{QuestId = 350}
		}
}


---Prüfen Sinwen bekannt, aber Item-Queste noch nicht gelöst
---- -Q77-
OnOneTimeEvent
{
Conditions =	{
		Negated(QuestState{QuestId = 77 , State = StateSolved}),
		IsPlayerFlagTrue{Name = "FlagSinwenQuestion1"}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "SinwenKnownButNoQ77Solv"}
		}
}

---Prüfen ob Elfen noch nicht gerettet sind
---- -Q77-
OnOneTimeEvent
{
Conditions =	{
		Negated(QuestState{QuestId = 24 , State = StateUnknown}),
		Negated(QuestState{QuestId = 24 , State = StateActive}),
		IsPlayerCounter{Name = "DeadandFreeElves" , Value = 10 , Operator = IsEqual, UpdateInterval = 60}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q77ElvesFree"}
		}
}


---Prüfen ob Rauchquarz
---- -Q79-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2191},
		QuestState{QuestId = 79 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 79}
		}
}

---Prüfen ob Silbermond
---- -Q80-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2193},
		QuestState{QuestId = 80 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 80}
		}
}

---Prüfen ob Sternenfeuer
---- -Q81-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2194},
		QuestState{QuestId = 81 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 81}
		}
}

---Prüfen ob Trollschädel
---- -Q83-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2205},
		QuestState{QuestId = 83 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 83}
		}
}

---Prüfen ob Kriecherblut
---- -Q84-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2201},
		QuestState{QuestId = 84 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 84}
		}
}

---Prüfen ob Ewiges Feuer
---- -Q85-
OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 2200},
		QuestState{QuestId = 85 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 85}
		}
}

---Prüfen ob alle nachtglanz Zutaten da
---- -Q78-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 81 , State = StateSolved},
		QuestState{QuestId = 79 , State = StateSolved},
		QuestState{QuestId = 80 , State = StateSolved},
		},
Actions =	{
		QuestBegin{QuestId = 461}
		}
}

---Prüfen ob alle Maske Zutaten da
---- -Q82-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 85 , State = StateSolved},
		QuestState{QuestId = 84 , State = StateSolved},
		QuestState{QuestId = 83 , State = StateSolved},
		},
Actions =	{
		QuestBegin{QuestId = 460}
		}
}
---Bannwerk komplett solven
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 82 , State = StateSolved},
		QuestState{QuestId = 78 , State = StateSolved},
		},
Actions =	{
		QuestSolve{QuestId = 77}
		}
}

--Shamanenzirkel Cast-Auslöser
OnEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 321, Y = 211, Range = 9},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "Conjuration"},
	}
}


-- Die Wächter beginnen zu casten
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "Conjuration"},
		FigureAlive{NpcId = 2846},
		FigureAlive{NpcId = 2847},
		FigureAlive{NpcId = 2848},
		FigureAlive{NpcId = 2849},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "CasterStopper"},
	}
}
OnToggleEvent 
{
	UpdateInterval = 3,
	OnConditions =
	{
		IsGlobalFlagTrue{Name = "Conjuration"},
		FigureAlive{NpcId = 2846},
		FigureAlive{NpcId = 2847},
		FigureAlive{NpcId = 2848},
		FigureAlive{NpcId = 2849},
		Negated (IsGlobalTimeElapsed {Name = "CasterStopper", Seconds = 7}),
	},
	OnActions	=
	{
		CastSpell{Spell = 1556, Target = 2846, TargetType = Figure, X = 0, Y = 0, NpcId = 2846},
		CastSpell{Spell = 1556, Target = 2847, TargetType = Figure, X = 0, Y = 0, NpcId = 2847},
		CastSpell{Spell = 1556, Target = 2848, TargetType = Figure, X = 0, Y = 0, NpcId = 2848},
		CastSpell{Spell = 1556, Target = 2849, TargetType = Figure, X = 0, Y = 0, NpcId = 2849},
		SetEffect {Effect = "Fog", Length = 66, NpcId = Avatar},
	},
	OffConditions =
	{
		IsGlobalFlagTrue{Name = "Conjuration"},
		FigureAlive{NpcId = 2846},
		FigureAlive{NpcId = 2847},
		FigureAlive{NpcId = 2848},
		FigureAlive{NpcId = 2849},
		Negated(IsGlobalTimeElapsed {Name = "CasterStopper", Seconds = 7}),
	},
	OffActions	=
	{
		CastSpell{Spell = 1556, Target = 2846, TargetType = Figure, X = 0, Y = 0, NpcId = 2846},
		CastSpell{Spell = 1556, Target = 2847, TargetType = Figure, X = 0, Y = 0, NpcId = 2847},
		CastSpell{Spell = 1556, Target = 2848, TargetType = Figure, X = 0, Y = 0, NpcId = 2848},
		CastSpell{Spell = 1556, Target = 2849, TargetType = Figure, X = 0, Y = 0, NpcId = 2849},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "CasterStopper", Seconds = 8},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "Hier kommt die Maus"},
	}
}
--SINWEN BLOCK ENDS HERE


---- TWONK-HEAD-BLOCK BEGINS HERE
---- Q 453 
----- Hat Player alle fünf Heads ??

OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3202},
		PlayerHasItem{ItemId = 3203},
		PlayerHasItem{ItemId = 3204},
		PlayerHasItem{ItemId = 3205},
		PlayerHasItem{ItemId = 3206},
		QuestState{QuestId = 453 , State = StateActive}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q453PlayerGotAllHeads"},
		EnableDialog{NpcId = 1362 , Important = TRUE},
		TransferXP{XP = 100, Flag = Give}
		}
}
--------------------------

----- Findet der Spieler den allerersten Kopf

OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3202},
		QuestState{QuestId = 453 , State = StateUnknown}		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
		EnableDialog{NpcId = 1362 , Important = TRUE},
		QuestBegin{QuestId = 453},
		QuestBegin{QuestId = 463} 
		}
}

OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3203},
		QuestState{QuestId = 453 , State = StateUnknown}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
		EnableDialog{NpcId = 1362 , Important = TRUE},
		QuestBegin{QuestId = 453},
		QuestBegin{QuestId = 463}
		}
}

OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3204},
		QuestState{QuestId = 453 , State = StateUnknown}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
		EnableDialog{NpcId = 1362 , Important = TRUE},
		QuestBegin{QuestId = 453},
		QuestBegin{QuestId = 463}
		}
}

OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3205},
		QuestState{QuestId = 453 , State = StateUnknown}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
		EnableDialog{NpcId = 1362 , Important = TRUE},
		QuestBegin{QuestId = 453},
		QuestBegin{QuestId = 463}
		}
}

OnOneTimeEvent
{
Conditions =	{
		PlayerHasItem{ItemId = 3206},
		QuestState{QuestId = 453 , State = StateUnknown}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q453PlayerGotFirstHead"},
		EnableDialog{NpcId = 1362 , Important = TRUE},
		QuestBegin{QuestId = 453},
		QuestBegin{QuestId = 463}
		}
}
--------------------------

---- Hat Spieler Brandels Kopf?

OnOneTimeEvent
{
UpdateInterval = 1,
Conditions =	{
		PlayerHasItem{ItemId = 3206},
		QuestState{QuestId = 455 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 455},
		SetRewardFlagTrue{ Name = "Kopfjagd1Head1"}
		}
}

---- Hat Spieler Darmors Kopf?

OnOneTimeEvent
{
UpdateInterval = 1,
Conditions =	{
		PlayerHasItem{ItemId = 3204},
		QuestState{QuestId = 458 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 458},
		SetRewardFlagTrue{ Name = "Kopfjagd2Head2"}
		}
}

---- Hat Spieler Elijahs Kopf?

OnOneTimeEvent
{
UpdateInterval = 1,
Conditions =	{
		PlayerHasItem{ItemId = 3205},
		QuestState{QuestId = 456 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 456},
		SetRewardFlagTrue{ Name = "Kopfjagd3Head3"}
		}
}

---- Hat Spieler Ragnars Kopf?

OnOneTimeEvent
{
UpdateInterval = 1,
Conditions =	{
		PlayerHasItem{ItemId = 3203},
		QuestState{QuestId = 457 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 457},
		SetRewardFlagTrue{ Name = "Kopfjagd4Head4"}
		}
}

---- Hat Spieler Sergil Kopf?

OnOneTimeEvent
{
UpdateInterval = 1,
Conditions =	{
		PlayerHasItem{ItemId = 3202},
		QuestState{QuestId = 454 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 454},
		SetRewardFlagTrue{ Name = "Kopfjagd5Head5"}
		}
}

----- TWONK-HEAD-BLOCK ENDS HERE

----- Q220 TRICKSTER BEGINS HERE
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 528 , State = StateActive},
		PlayerHasItem{ItemId = 3467}
		},
Actions =	{
		QuestSolve{QuestId = 528},
		QuestBegin{QuestId = 529},
		}
}
----- Q220 TRICKSTER ENDS HERE

--EARTHBLADE
OnOneTimeEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2200 , Amount = 2},
				QuestState{QuestId = 173 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 173},
				}
}
OnOneTimeEvent
{
Conditions = 	{
				QuestState{QuestId = 172 , State = StateSolved},
				QuestState{QuestId = 173 , State = StateSolved},
				QuestState{QuestId = 174 , State = StateSolved},
				QuestState{QuestId = 175 , State = StateSolved},
				QuestState{QuestId = 176 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 176},
				}
}
--EARTHBLADE END
-- Outcries
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {TargetNpcId = 1362, NpcId = 0, Range = 25, UpdateInterval = 30},
	},
	Actions =
	{
		Outcry{ Tag = "outcryEinarLeaf001", NpcId = 1362, String = "He! Ihr da! Hier herüber!", Color = ColorWhite },
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 309, Y = 267, NpcId = 1362, Range = 15},
	},
	Actions =
	{
		Outcry{ Tag = "outcryEinarLeaf002", NpcId = 1362, String = "Dort auf dem Hügel! Gefangene! Schnell, wir müssen sie befreien!", Color = ColorWhite },
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureHasAggro {NpcId = 1364, UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryRonkLeaf001", NpcId = 1364, String = "Arrgh! Sie wagen es! Erschlagt die Geiseln, Krieger! Lasst keine am Leben!", Color = ColorWhite },
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {TargetNpcId = 3255, NpcId = 1362, Range = 25, UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryEinarLeaf003", NpcId = 1362, String = "Bei den Göttern! Seht! Ein Troll! Zum Seelenfluss mit dir, Bestie!", Color = ColorWhite },
		SetGlobalFlagTrue {Name = "UmurukAntwort"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "UmurukAntwort", UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryUrmukLeaf001", NpcId = 3255, String = "Kommt nur zu Urmuk! Urmuk wird Euch zermalmen!", Color = ColorWhite },
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 3255},
	},
	Actions =
	{
		Outcry{ Tag = "outcryEinarLeaf004", NpcId = 1362, String = "Das war’s! Der Schattenhain ist frei!", Color = ColorWhite },
	}
}
EndDefinition()
end
