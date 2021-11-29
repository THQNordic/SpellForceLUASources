function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Laden des Rts-Spawnskriptes
dofile("script/p5/n1956_CutsceneTyrnar.lua")
dofile("script/p5/n1957_CutsceneEinar.lua")
dofile("script/p5/n2873_CutsceneIllirias.lua")




DebugInitAction(		SetGlobalFlagTrue{Name = "Q90EinarFollow"} )
DebugInitAction(SetGlobalFlagTrue{Name = "Q18EinarToPortalFinal"} )

--MainQuest starten
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 86 , State = StateUnknown}
		},
Actions =	{
		QuestBegin{QuestId = 86},
		QuestBegin{QuestId = 87},
		SetGlobalFlagTrue{Name = "Q18EinarToPortalFinal"}
		}
}

--Leafshade solven
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 450 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 450},
		QuestSolve{QuestId = 18},
		SetGlobalFlagTrue{Name = "Q18EinarToPortalFinal"}		
		}
}
--Start aller Subquesten, wenn Alfalas da, für QA
--OnOneTimeEvent
--{
--Conditions =	{
--		PlayerHasItem{ItemId = 2360},
--		QuestState{QuestId = 95 , State = StateUnknown},
--		},
--Actions =	{
--		QuestSolve{QuestId = 87},
--		QuestBegin{QuestId = 88},
--		QuestBegin{QuestId = 89},
--		QuestSolve{QuestId = 90},
--		QuestSolve{QuestId = 91},
--		QuestSolve{QuestId = 92},
--		QuestSolve{QuestId = 93},
--		QuestSolve{QuestId = 94},
--		QuestBegin{QuestId = 95},
--		SetPlayerFlagFalse{Name = "Q88HasInfoMonumentsAndBossIll"},
--		SetPlayerFlagFalse{Name = "Q89LordCommanderQuestion"}
--		}
--}


--CAPTAIN BAHIR BLOCK BEGINS HERE
--Monument info gegeben
OnOneTimeEvent
{
UpdateInterval = 10,
Conditions = 	{
		QuestState{QuestId = 86 , State = StateActive},
		Negated(QuestState{QuestId = 88 , State = StateActive}),
		IsPlayerFlagTrue{Name = "Q88InfoMonumentsTaken" , UpdateInterval = 5},
		},
Actions =	{
		QuestBegin{QuestId = 88},
		}
}


--Freigabe und Abschalten des Lord Commander Satzes
OnToggleEvent
{
UpdateInterval = 10 ,
OnConditions = 	{
		Negated(PlayerHasItem{ItemId = 2360}),
		QuestState{QuestId = 89 , State = StateUnknown},
		IsPlayerFlagTrue{Name = "Q89LordQuestionTrue" , UpdateInterval = 3}
		},
OnActions = 	{
		SetPlayerFlagTrue{Name = "Q89LordCommanderQuestion"}
		},
OffConditions = {
		QuestState{QuestId = 89 , State = StateActive},
		},
OffActions = 	{
		SetPlayerFlagFalse{Name = "Q89LordCommanderQuestion"}
		},
}

--Gehe zum Lord
--- -Q95-
--OnOneTimeEvent
--{
--UpdateInterval = 40,
--Conditions =	{
--		IsGlobalFlagTrue{Name = "Q89BahirBringMedicineToTynar" , UpdateInterval = 5},
--		QuestState{QuestId = 95 , State = StateActive}
--		},
--Actions =	{
--
--		Goto{ X = 72 , Y = 398 , NpcId = 1955 , Range = 1 , WalkMode = Run}
--		}
--}

--Prüfen ob Bahir da ist, Effekt und SolveQuest 
---- -Q95-
OnOneTimeEvent
{
UpdateInterval = 10,
Conditions =	{
		FigureInRange{ X = 72 , Y = 398 , NpcId = 1955 , Range = 2},
		IsGlobalFlagTrue{Name = "Q89BahirBringMedicineToTynar"},
--		QuestState{QuestId = 95 , State = StateActive}
		},
Actions =	{
		SetGlobalFlagFalse{Name = "Q89BahirBringMedicineToTynar"},
		SetEffect{TargetType = World, X = 73 , Y = 398, Length = 0, Effect = "Materialize"},
		QuestSolve{QuestId = 95},
		RemoveObject{X = 72 , Y = 398 , Object = 2161},
		}
}
--Effekt abschalten
OnOneTimeEvent
{
UpdateInterval = 40,
Conditions =	{
		QuestState{QuestId = 95 , State = StateSolved}
		},
Actions =	{
		StopEffect{TargetType = World, X = 73 , Y = 398},
		QuestSolve{QuestId = 89},
		QuestBegin{QuestId = 100}
		}
}

--CAPTAIN BAHIR BLOCK ENDS HERE

--TYNAR BLOCK BEGINS HERE
--Tynar bekommt Medizin
---- -Q89-
OnOneTimeEvent
{
Conditions =	{
		IsGlobalFlagTrue{Name = "Q89TynarHasGotMedicine"}
		},
Actions =	{
		SetGlobalFlagTrue{Name = "Q89TynarAllright"},
		QuestSolve{QuestId = 89}
		}
}
--Bedingung für Solve Postenkette
---- -96-
OnOneTimeEvent
{
Conditions =	{
--    	FigureDead{NpcId = 1979},
--    	FigureDead{NpcId = 1980},
--		FigureDead{NpcId = 1982},
		FigureDead{NpcId = 1983},
		QuestState{QuestId = 96 , State = StateActive}
		},
Actions =	{
		QuestSolve{QuestId = 96}
		}
}
--Bedingung für Frage nach den Männern
---- -Q97-
OnToggleEvent
{
UpdateInterval = 20 ,
OnConditions = 	{
		QuestState{QuestId = 89 , State = StateSolved},
		IsPlayerFlagFalse{Name = "Q97MenSentenceOff"}
		},
OnActions = 	{
		SetPlayerFlagTrue{Name = "Q97MenSentenceOff"},
		SetPlayerFlagTrue{Name = "Q97QuestionForMen"}
		},
OffConditions = {
		QuestState{QuestId = 96 , State = StateActive}
		},
OffActions = 	{
		SetPlayerFlagFalse{Name = "Q97QuestionForMen"}
		},
}

--MonumentGroup setup
---- -Q97-
OnToggleEvent
{
UpdateInterval = 20 ,
OnConditions = 	{
		QuestState{QuestId = 97 , State = StateActive},
		IsGlobalFlagTrue{Name = "Q97MonumentGroupGo"},
		},
OnActions = 	{
		SetGlobalFlagTrue{Name = "Q97MonumentTroopsFormUp"},
		SetGlobalFlagFalse{Name = "MonumentGroupMustChangeOwner"},
		},
OffConditions = {
		FigureInRange{X = 96 , Y = 377 , NpcId = 1958 ,Range = 0},
		FigureInRange{X = 96 , Y = 378 , NpcId = 1959 ,Range = 0},
		FigureInRange{X = 96 , Y = 379 , NpcId = 1960 ,Range = 0},
		FigureInRange{X = 96 , Y = 380 , NpcId = 1961 ,Range = 0},
		FigureInRange{X = 96 , Y = 381 , NpcId = 1962 ,Range = 0},
		FigureInRange{X = 95 , Y = 378 , NpcId = 1963 ,Range = 0},
		FigureInRange{X = 95 , Y = 380 , NpcId = 1964 ,Range = 0},
		},
OffActions = 	{
		SetGlobalFlagFalse{Name = "Q97MonumentTroopsFormUp"},
		SetGlobalFlagFalse{Name = "Q97MonumentGroupGo"},
		SetGlobalFlagTrue{Name = "MonumentGroupMustChangeOwner"},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1958},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1959},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1960},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1961},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1962},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1963},
		ChangeOwner{Owner = OwnerPlayer, NpcId = 1964},
		}
}

-- jeden der jungs den owner changen:
for i = 1958, 1964 do
	OnPlatformOneTimeEvent
	{
		Conditions = {
			FigureAlive{NpcId = i},
			IsGlobalFlagTrue{Name = "MonumentGroupMustChangeOwner", UpdateInterval = 10},
		},
		Actions =	{
			ChangeOwner{Owner = OwnerPlayer, NpcId = i},
		},
	}
end


--Monumentgroup Alive/Dead
---- -Q97
OnEvent
{
Conditions = {
		QuestState{QuestId = 97 , State = StateActive},
		FigureDead{NpcId = 1958},
		FigureDead{NpcId = 1959},
		FigureDead{NpcId = 1960},
		FigureDead{NpcId = 1961},
		FigureDead{NpcId = 1962},
		FigureDead{NpcId = 1963},
		FigureDead{NpcId = 1964},
		IsGlobalFlagFalse{Name = "Q97MonumentGroupDead"}
		},
Actions = 	{
		SetGlobalFlagTrue{Name = "Q97MonumentGroupDead"}
		}
}
--Postenkette done Satz
---- -96-
OnOneTimeEvent
{
UpdateInterval = 40,
Conditions =	{
		QuestState{QuestId = 96 , State = StateSolved}
		},
Actions =	{
		SetPlayerFlagTrue{Name = "Q96DoneSentence"}
		}
}



--Q134 PURPURNES BANNER BEGINS HERE
--Goldweberkettchen gefunden?
OnOneTimeEvent
{
UpdateInterval = 40,
Conditions =	{
		PlayerHasItem{ItemId = 2350},
		QuestState{QuestId = 135 , State = StateActive , UpdateInterval = 5},
		},
Actions =	{
		QuestSolve{QuestId = 135},
		QuestBegin{QuestId = 136},
		}
}

--banner schon da?
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 2488},
		QuestState{QuestId = 392 , State = StateActive , UpdateInterval = 5},
			},
	Actions =
	{
		QuestSolve{QuestId = 392},
		QuestBegin{QuestId = 137}
	}
}
--Q134 PURPURNES BANNER ENDS HERE

--TYNAR BLOCK ENDS HERE
--Check für Monumente frei
---- -Q97- -Q98-
OnOneTimeEvent
{
Conditions =	{
--		Negated(BuildingInRange{X = 157 , Y = 370 , Owner = OwnerNpc, Range = 10}),
--		Negated(BuildingInRange{X = 184 , Y = 388 , Owner = OwnerNpc, Range = 10}),
		ODER(IsMonumentInUse{X = 173, Y = 397, Range = 5}, IsMonumentInUse{X = 173, Y = 397, Range = 5}),
		QuestState{QuestId = 97 , State = StateActive},
		},
Actions =	{
		QuestSolve{QuestId = 97},
		QuestSolve{QuestId = 96},
		QuestSolve{QuestId = 88},
--		QuestBegin{QuestId = 98}, wird jetzt nach den Dryaden gestartet
		QuestBegin{QuestId = 467},
		RevealUnExplored{X = 297 , Y = 147 , Range = 20},
		}
}
--Check für Weiter nach Osten
---- -Q98- -Q99-
OnOneTimeEvent
{
Conditions =	{
		FigureInRange{X = 467 , Y = 301 , NpcId = Avatar ,Range = 8},
		QuestState{QuestId = 98 , State = StateActive},
		},
Actions =	{
		QuestSolve{QuestId = 98},
		QuestBegin{QuestId = 99}
		}
}

--Check, ob der Spieler Pouch und Pouchquest hat
---- -Q358- -Q362- -Q363-
OnOneTimeEvent
{
Conditions =	{
		QuestState{QuestId = 363 , State = StateActive},
		PlayerHasItem{ItemId = 2902},
		},
Actions =	{
		QuestSolve{QuestId = 363},
		QuestBegin{QuestId = 364}
		}
}

-- Fake für das RTS Spawning, da die Einheiten Einzelne Homepoints haben und deshalb nicht über RTS-SPawning klappen


OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 146, Y = 289, Range = 0},
		IsGlobalTimeElapsed{Name = "ShielMonumentClaimedTimer", Seconds = 1},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 144, Y = 291},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 146, Y = 289, Range = 0}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "ShielFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 144, Y = 291, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 144, Y = 291, Length = 3000},
		StopEffect {TargetType = World, X = 144, Y = 291},
	}
}
---Festung erobert?
--OnOneTimeEvent
--{
--Conditions =	{
--		Negated(EnemyUnitInRange{X = 297 , Y = 145 , NpcId = 1955 ,Range = 15}),
--		QuestState{QuestId = 467, State = StateActive},
--		},
--Actions =	{
--		QuestSolve{QuestId = 467},
--		QuestBegin{QuestId = 484},
--		QuestBegin{QuestId = 485},
--		TransferItem{GiveItem = 965 , Amount = 1 , Flag = Give},
--		}
--}

--Attackwave zurück
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Attacke", Seconds = 20},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "PostenkettenAlarm"},
	}
}

--Q484 DRYAD QUEST BEGINS HERE----------------
--Lenya prüfen
OnToggleEvent
{
UpdateInterval = 20 ,
OnConditions = 	{
		QuestState{QuestId = 485 , State = StateActive},
		PlayerHasGood{Good = GoodManaHerb , Amount = 1000 , Side = SideLight}
		},
OnActions = 	{
		QuestSolve{QuestId = 485},
		QuestBegin{QuestId = 486},
		},
OffConditions = {
		QuestState{QuestId = 486 , State = StateActive},
		Negated(PlayerHasGood{Good = GoodManaHerb , Amount = 1000 , Side = SideLight}),
		},
OffActions = 	{
		QuestChangeState{QuestId = 486 , State = StateUnknown},
		QuestBegin{QuestId = 485},
		}
}
--Dryaden da?
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue{Name = "Q484SpawnDryads"},
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "PostenkettenAlarm"},
	}
}
--Q484 DRYAD QUEST ENDS HERE----------------

-- Outcries
OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		FigureInRange {X = 123, Y = 416, NpcId = 1957, Range = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryEinarShiel001", NpcId = 1957, String = "Kommt! Folgt mir!", Color = ColorWhite },
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		FigureInRangeNpc {TargetNpcId = 1955, NpcId = 1957, Range = 10, UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryBahirShiel001"      , NpcId = 1955, String = "Männer, seht doch! Einar ist zurück! Wird auch Zeit, dass Ihr Euch hier einfindet, Sergeant!", Color = ColorWhite },
		SetGlobalTimeStamp{Name = "Antworte"},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "Antworte", Seconds = 8},
	},
	Actions =
	{
		Outcry{ Tag = "outcryEinarShiel002", NpcId = 1957, String = "Ich bin ebenfalls erfreut Euch zu sehen, Hauptmann!", Color = ColorWhite },
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "OutcryPostenkette", UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryOrkShiel001", NpcId = 1983, String = "Arrr! Menschen! Los, gebt Nachricht zum Lager! Schnell!", Color = ColorWhite },
	}
}

--Menschgebäude übergeben

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsMonumentInUse {X = 233, Y = 272, Range = 0}, 
	},
	Actions =
	{
		ChangeBuildingOwner {X = 197, Y = 289},
		ChangeBuildingOwner {X = 176, Y = 285},
	}
}
EndDefinition()
end
