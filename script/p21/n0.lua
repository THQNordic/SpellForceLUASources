function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)


dofile("script/p21/n2800_CutsceneSethAssassin.lua")


--Queststatus initliasisieren
OnOneTimeEvent
{
	Conditions =
			{
			QuestState{QuestId = 272 , State = StateUnknown},
			},
	Actions =
			{
			QuestBegin{QuestId = 268},
			QuestBegin{QuestId = 272},
			}
}
--Fake Phoenix Starter Default OFF
--OnOneTimeEvent
--{
--	Conditions =
--			{
--			QuestState{QuestId = 294 , State = StateUnknown},
--			},
--	Actions =
--			{
--			QuestBegin{QuestId = 294},
--			QuestBegin{QuestId = 295},
--			QuestBegin{QuestId = 296},
--			QuestBegin{QuestId = 298},
--			QuestBegin{QuestId = 301},
--			QuestBegin{QuestId = 302},
--			QuestBegin{QuestId = 303},
--			QuestBegin{QuestId = 306},
--			QuestBegin{QuestId = 299},
--			QuestBegin{QuestId = 297},
--			}
--}

--MAINQUEST Q268 WOLF AND DRAGON BEGINS HERE

OnOneTimeEvent
{
	Conditions =
			{
			QuestState{QuestId = 274 , State = StateActive},
			PlayerUnitInRange{X = 220 , Y = 68 , FigureType = FigureAll ,  Range = 5 , UpdateInterval = 30}
			},
	Actions =
			{
			QuestBegin{QuestId = 276},
			}
}


OnOneTimeEvent
{
	Conditions =
			{
			QuestState{QuestId = 277 , State = StateActive},
			PlayerUnitInRange{X = 103 , Y = 313 , FigureType = FigureAvatar ,  Range = 10 , UpdateInterval = 30}
			},
	Actions =
			{
			QuestSolve{QuestId = 277},
			QuestSolve{QuestId = 273},
			QuestSolve{QuestId = 268}
			}
}

--Halicos tot then solve
--OnOneTimeEvent
--{
--	Conditions =
--			{
--			QuestState{QuestId = 278 , State = StateActive},
--			FigureDead{NpcId = 2793},
--			},
--	Actions =
--			{
--			QuestChangeState{QuestId = 278 , State = StateUnsolvable},
--			}
--}
--MAINQUEST Q268 WOLF AND DRAGON ENDS HERE

--SIDEQUEST Q266 WOLFSIGN BEGINS HERE
--Erstes Mal erkennen
OnOneTimeEvent
{
	Conditions =
			{
			IsPlayerFlagFalse{Name = "Q266FirstTimeSign"},
			PlayerHasItem{ItemId = 2630},
			QuestState{QuestId = 266 , State = StateActive},
			},
	Actions =
			{
			SetPlayerFlagTrue{Name = "Q266FirstTimeSign"},
			}	
}
--Frage nach Verkauf an/aus
OnToggleEvent
{
	OnConditions =
		{
		IsPlayerFlagFalse{Name = "Q266HasSign"},
		PlayerHasItem{ItemId = 2630},
		QuestState{QuestId = 267 , State = StateActive},
		},
	OnActions =
		{
		SetPlayerFlagTrue{Name = "Q266HasSign"},
		},
	OffConditions =
		{
		IsPlayerFlagTrue{Name = "Q266HasSign"},
		Negated(PlayerHasItem{ItemId = 2630 , UpdateInterval = 20}),
		},
	OffActions =
		{
		SetPlayerFlagFalse{Name = "Q266HasSign"},
		}
}
--SIDEQUEST Q266 WOLFSIGN ENDS HERE

--MAINQUEST Q294 Vier Splitter BEGINS HERE
--AutumLight solver > Auch auf Farlorns
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 301 , State = StateActive},
	PlayerHasItem{ItemId = 2797},
	},
Actions =	
	{
--	QuestSolve{QuestId = 334},
--	QuestSolve{QuestId = 307},
	QuestSolve{QuestId = 301},
	}
}
--SummerWind solver > Auch auf Farlorns
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 300 , State = StateActive},
	PlayerHasItem{ItemId = 2666},
	},
Actions =	
	{
	QuestSolve{QuestId = 300},
--	QuestSolve{QuestId = 299},
	QuestSolve{QuestId = 298},
	}
}
-- Solver für Armun
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 299 , State = StateActive},
	PlayerHasItem{ItemId = 2666},
	},
Actions =	
	{
	QuestSolve{QuestId = 300},
	QuestSolve{QuestId = 299},
	QuestSolve{QuestId = 298},
	}
}

--MAINQUEST Q294 Vier Splitter ENDS HERE


---- SIDEQUEST Q395 BLUT begins here
---- Q 395, Q 396 ---


---- Prüfen, ob der Spieler das Blut des Drachen hat --

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 3166 },
		QuestState {QuestId = 400, State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 400} ,
	}
}


---- Prüfen, ob der Spieler das Blut aller drei Monster hat (Blut-Quest) ---

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 2540 },
		PlayerHasItem {ItemId = 3165 },
		PlayerHasItem {ItemId = 3166 },
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "Q395AllBlood"},
	}
}

------- SIDEQUEST Q395 BLUT ends here


--SIDEQUEST Q279 Steinbrecher BEGINS HERE
--Solver für Phiole
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 289, State = StateActive},
		PlayerHasItem{ItemId = 2668},
	},
	Actions =	
	{
		QuestSolve{QuestId = 289},
		QuestSolve{QuestId = 288}
	}
}

--- gehe zu brok starten
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 286, State = StateSolved},
		QuestState{QuestId = 284, State = StateSolved},
		QuestState{QuestId = 283, State = StateSolved},
		QuestState{QuestId = 288, State = StateSolved},
		PlayerHasItem{ItemId = 2750},
		PlayerHasItem{ItemId = 2751},
		PlayerHasItem{ItemId = 2752},
		PlayerHasItem{ItemId = 2668},
	},
	Actions =	
	{
		QuestBegin{QuestId = 290}
	}
}
--Wenn Avatar da Cutscene starten und Avatar auf safe schicken
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 291, State = StateActive},
		FigureInRange{X = 91 , Y = 274 , NpcId = 2798 , Range = 3},
		FigureInRange{X = 91 , Y = 274 , NpcId = Avatar , Range = 10},
	},
	Actions =	
	{
		SetGlobalFlagTrue{Name = "Q279DetonationCutsceneStart"},
		Goto{X = 92 , Y = 275 , NpcId = Avatar, Range = 1 , GotoMode = GotoContinous},
		SetGlobalFlagTrue{Name = "Q279WalkToRocks"}
	}
}
--Brok läuft zur Steinblockade
--OnOneTimeEvent
--{
--	Conditions = 
--	{
--		QuestState{QuestId = 291, State = StateActive},
--		IsGlobalFlagTrue{Name = "Q279DetonationCutsceneStart" , UpdateInterval = 10},
--	},
--	Actions =	
--	{
--		
--	}
--}
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {X = 87, Y = 266, NpcId = 2798 , Range = 2},
		IsGlobalFlagTrue{Name = "Q279DetonationCutsceneStart"},
		IsGlobalFlagFalse {Name = "Explosionsschalter"},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "BorkSprengung"},
		SetGlobalFlagTrue{Name = "BorkSprengung"},
	}
		
	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "BorkSprengung", Seconds = 10},
	},
	Actions =
	{
		SetEffect {TargetType =World, X = 88, Y = 264, Length = 1750, Effect = "DarkMight"},
		SetEffect {TargetType =World, X = 88, Y = 266, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 89, Y = 267, Length = 1500, Effect = "Explo"},
		SetEffect {TargetType =World, X = 84, Y = 266, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 82, Y = 267, Length = 1500, Effect = "Explo"},
		SetEffect {TargetType =World, X = 86, Y = 264, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 89, Y = 263, Length = 1500, Effect = "Explo"},
		SetEffect {TargetType =World, X = 83, Y = 265, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 88, Y = 266, Length = 1500, Effect = "Explo"},
		SetEffect {TargetType =World, X = 84, Y = 261, Length = 1500, Effect = "BuildingFire"},
		SetEffect {TargetType =World, X = 82, Y = 267, Length = 1500, Effect = "BuildingFire"},
		SetGlobalFlagTrue {Name = "Explosionsschalter"},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 1,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Explosionsschalter", UpdateInterval = 1},
	},
	Actions =
	{
		SetEffect {TargetType =World, X = 88, Y = 266, Length = 7500, Effect = "Fog"},
		SetEffect {TargetType =World, X = 89, Y = 264, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 89, Y = 267, Length = 1000, Effect = "Explo"},
		SetEffect {TargetType =World, X = 85, Y = 266, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 82, Y = 267, Length = 1000, Effect = "Explo"},
		SetEffect {TargetType =World, X = 85, Y = 264, Length = 550, Effect = "Explo"},
		SetEffect {TargetType =World, X = 89, Y = 263, Length = 1000, Effect = "Explo"},
		SetEffect {TargetType =World, X = 84, Y = 265, Length = 550, Effect = "BuildingFire"},
		SetEffect {TargetType =World, X = 88, Y = 266, Length = 1000, Effect = "Explo"},
		
		RemoveObject {X = 85, Y = 267, Object = 845},
		RemoveObject {X = 85, Y = 268, Object = 844},
		RemoveObject {X = 86, Y = 268, Object = 844},
		RemoveObject {X = 86, Y = 267, Object = 844},
		RemoveObject {X = 87, Y = 267, Object = 844},
		RemoveObject {X = 87, Y = 266, Object = 844},
		RemoveObject {X = 88, Y = 267, Object = 844},
		RemoveObject {X = 88, Y = 266, Object = 844},
		RemoveObject {X = 89, Y = 267, Object = 844},
		RemoveObject {X = 89, Y = 266, Object = 844},
		RemoveObject {X = 82, Y = 264, Object = 839},
		RemoveObject {X = 84, Y = 261, Object = 839},
		RemoveObject {X = 84, Y = 263, Object = 842},
		RemoveObject {X = 85, Y = 265, Object = 845},
		RemoveObject {X = 84, Y = 264, Object = 842},
		RemoveObject {X = 86, Y = 264, Object = 843},
		RemoveObject {X = 86, Y = 265, Object = 846},
		--RemoveObject {X = 88, Y = 264, Object = 844},
		--RemoveObject {X = 86, Y = 267, Object = 844},
		--RemoveObject {X = 86, Y = 267, Object = 844},
		--RemoveObject {X = 86, Y = 263, Object = 844},
		--RemoveObject {X = 88, Y = 264, Object = 844},
		RemoveObject {X = 84, Y = 266, Object = 839},
		RemoveObject {X = 86, Y = 264, Object = 839},
		SetGlobalFlagFalse {Name = "Explosionsschalter"},
		QuestSolve{QuestId = 291},
		QuestSolve{QuestId = 279},
		SetGlobalFlagTrue {Name = "TravelOn"},
		SetGlobalFlagTrue {Name = "GreyfellFarlornGateOpen"}
	}
}


--SIDEQUEST Q279 Steinbrecher ENDS HERE


------------------- EARTHBLADE SOLVER BEGIN
--Steine des ewigen Feuers
OnEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2200 , Amount = 2},
				QuestState{QuestId = 173 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 173},
				}
}
--Dämonenblut
OnEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2540},
				QuestState{QuestId = 174 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 174},
				}
}
--Alles
OnEvent
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
------------------- EARTHBLADE SOLVER END


---NEBENQUEST Q512 Thar BEGINS HERE
--Solver Thar
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 513 , State = StateActive},
	PlayerHasItem{ItemId = 3357}
	},
Actions =	
	{
	QuestSolve{QuestId = 513},
	QuestBegin{QuestId = 514},
	}
}
---NEBENQUEST Q512 Thar ENDS HERE

---NEBENQUEST Q515 Drachenpanzer BEGINS HERE
--Solver Drache
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 517 , State = StateActive},
	PlayerHasItem{ItemId = 2667}
	},
Actions =	
	{
	QuestSolve{QuestId = 517},
	QuestBegin{QuestId = 518},
	}
}
---NEBENQUEST Q515 Drachenpanzer ENDS HERE
EndDefinition()
end


