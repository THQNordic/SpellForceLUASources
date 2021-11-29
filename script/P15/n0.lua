function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p15/n2496_CutsceneKorshar.lua")



--Queststus initialisieren

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 225 , State = StateUnknown},	
	},
	Actions =
	{
		QuestBegin{QuestId = 225},
		QuestBegin{QuestId = 235},
		QuestBegin{QuestId = 237},
		QuestBegin{QuestId = 238},
		RevealUnExplored{X = 114 , Y = 299, Range = 15},
		RevealUnExplored{X = 98, Y = 198, Range = 15},
		RevealUnExplored{X = 62 , Y = 245, Range = 15},
		RevealUnExplored{X = 200 , Y = 324, Range = 15},
		RevealUnExplored{X = 122 , Y = 245, Range = 15},
	}
}
--- Greydusk solven
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 483 , State = StateActive},	
	},
	Actions =
	{
		QuestSolve{QuestId = 483},
		QuestSolve{QuestId = 190},
	}
}
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange{X = 396 , Y = 230 , Range = 3 , FigureType = FigureAvatar , UpdateInterval = 5},	
	},
	Actions =
	{
		SetGlobalFlagTrue{Name = "PlayerImPalast"},
	}
}

	
--MAIN QUEST 225 BEGINS HERE


--Angriff der Untoten starten?
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 238 , State = StateActive, UpdateInterval = 10},
		FigureDead{NpcId = 3445},
		FigureDead{NpcId = 3446},
		FigureDead{NpcId = 3447},
		FigureDead{NpcId = 3448},
		FigureDead{NpcId = 3449},
--		FigureDead{NpcId = 2417},
--		IsGlobalFlagTrue {Name = "Nordarmee"},
--		IsGlobalFlagTrue {Name = "Suedarmee"},
--		IsGlobalFlagTrue {Name = "Turmarmee"},
--		FigureDead{NpcId = 2418},
	},
	Actions =		
	{
		SetGlobalFlagTrue{Name = "Q237UndeadAttack"},
		RevealUnExplored{X = 240 , Y = 237, Range = 15},
		QuestSolve{QuestId = 238},
		QuestSolve{QuestId = 237},
		QuestBegin{QuestId = 239},
		SetRewardFlagTrue{ Name = "KlagendeSteine1BisTor"},
		Outcry{ Tag = "outcrySkeletHowlM001", NpcId = 2508, String = "Öffnet das Tor!", Color = ColorWhite },
	}
}
--Angriff auslösen
OnOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue{Name = "Q237UndeadAttack", UpdateInterval = 10},
		QuestState{QuestId = 239 , State = StateActive, UpdateInterval = 10},
	},
	Actions =		
	{
		ClanAttack{Number = 10, SourceClan = 23, TargetX = 174, TargetY = 241},
		Outcry{ Tag = "outcrySkeletHowlM002", NpcId = 2508, String = "Lasst die Horde ausrücken! Zerfetzt sie!", Color = ColorWhite },
	}
}
-- Festungserstürmung solven und weiter über Lavasee
OnEvent
{
Conditions =	{
				FigureInRange{X = 343 , Y = 223 , NpcId = Avatar , Range = 5},
				FigureDead{NpcId = 2483},
				QuestState{QuestId = 239 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 239},
				QuestSolve{QuestId = 235},
				QuestBegin{QuestId = 240},
				}
}
--AlternativSolver, wenn Spieler einfach durchspurtet
OnEvent
{
Conditions =	{
				FigureInRange{X = 399 , Y = 231 , NpcId = Avatar , Range = 5},
				QuestState{QuestId = 239 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 239},
				QuestSolve{QuestId = 235},
				QuestSolve{QuestId = 240},
				QuestBegin{QuestId = 241},
				}
}
--Solver normal für Ankunft im Sanktuarium
OnEvent
{
Conditions =	{
				FigureInRange{X = 399 , Y = 231 , NpcId = Avatar , Range = 5},
				QuestState{QuestId = 240 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 240},
				QuestBegin{QuestId = 241},
				}
}
--Solver für Erreichen Thronsaal
OnEvent
{
Conditions =	{
				QuestState{QuestId = 241 , State = StateActive},
				FigureInRange{X = 446 , Y = 224 , NpcId = Avatar , Range = 8 , UpdateInterval = 10},
				},
Actions =		{
				QuestSolve{QuestId = 241},
				QuestBegin{QuestId = 236},
				}
}
-- Korhs Ausschrei
OnOneTimeEvent 
{
	Conditions =
	{
		FigureHasAggro { NpcId = 2496 , UpdateInterval = 10},
	},
	Actions =
	{
		Outcry{ Tag = "outcryKorsharHowlM001", NpcId = 2496, String = "Das ist das Ende Deiner Reise! Du wirst meinen Herrn nie erreichen!", Color = ColorWhite },
	}
}

--Solver für Korshs Tod
OnOneTimeEvent
{
Conditions =	{
				FigureDead{NpcId = 2496},
				QuestState{QuestId = 236 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 236},
				QuestSolve{QuestId = 225},
				SetRewardFlagTrue{ Name = "KlagendeSteine2Korshar"}
				}
}
				
--Start für Whipser
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 242 , State = StateUnknown},
				FigureDead{NpcId = 2496},
				},
Actions =		{
				QuestBegin{QuestId = 242},
				QuestBegin{QuestId = 247},
				}
}


--MAIN QUEST 225 ENDS HERE

--Q210 MASKE DES BELIAL BEGINS HERE
--Solver für Korshs Tod, MaskenQuest
OnOneTimeEvent
{
Conditions =	{
				FigureDead{NpcId = 2496},
				QuestState{QuestId = 216 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 216},
				QuestBegin{QuestId = 217},
				}
}
--Solver für Maske Korshar Part
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2337},
--				PlayerHasItem{ItemId = 2615},
				QuestState{QuestId = 217 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 217},
				QuestSolve{QuestId = 215},
				SetRewardFlagTrue{ Name = "MaskeDesBelial2"}
				}
}
-- Solver für Maske gesamt
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2337},
				PlayerHasItem{ItemId = 2615},
				QuestState{QuestId = 212 , State = StateSolved},
				QuestState{QuestId = 215 , State = StateSolved},
				QuestState{QuestId = 218 , State = StateUnknown},
				},
Actions =		{
				QuestSolve{QuestId = 211},
				QuestBegin{QuestId = 218},
				}
}
--Q210 MASKE DES BELIAL ENDS HERE

--HOMUNCULUS QUEST BEGINS HERE
--Solver der Tränen für die Erdenklinge
OnEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2541},
				QuestState{QuestId = 175 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 175},
				}
}
--Solver für Octagon
OnOneTimeEvent
{
UpdateInterval = 10,
Conditions = 	{
				PlayerHasItem{ItemId = 2625},
				QuestState{QuestId = 231 , State = StateActive , UpdateInterval = 5},
				},
Actions =		{
				QuestSolve{QuestId = 231},
				QuestBegin{QuestId = 232},
				}
}
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
--Homunculus erwecken
OnOneTimeEvent
{
Conditions = 	{
				IsGlobalFlagTrue{Name = "Q183HomunculusAwake"},
				},
Actions =		{
				ChangeUnit{Unit = 964 , NpcId = 2480},
				
				}
}
--Homunculus wieder schlafen legen
OnOneTimeEvent
{
	Conditions = 	
	{
		IsGlobalTimeElapsed{Name = "Q183HomunculusGoingToSleep" , Seconds = 30},
	},
	Actions =		
	{
		ChangeUnit{Unit = 965 , NpcId = 2480},
		SetEffect{TargetType = World, X = 206 , Y = 336, Length = 0, Effect = "Materialize"},
	},
}
--Effekt abschalten
OnOneTimeEvent
{
Conditions = 	{
				IsGlobalTimeElapsed{Name = "Q183HomunculusGoingToSleep" , Seconds = 33}
				},
Actions =		{
				StopEffect{TargetType = World, X = 206 , Y = 336},
				}
}
--HOMUNCULUS QUEST ENDS HERE

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 391, State = StateActive},
		IsGlobalFlagTrue {Name = "AmraSpawn"},
		FigureDead {NpcId = 2912},
	},
	Actions =
	{
		QuestSolve {QuestId = 391},
		QuestSolve {QuestId = 379},
	}
}

------------------- EARTHBLADE SOLVER BEGIN
--Tränen einses seelenlosen Wesens
OnEvent
{
Conditions = 	{
				PlayerHasItem{ItemId = 2541},
				QuestState{QuestId = 175 , State = StateActive},
				
				},
Actions =		{
				QuestSolve{QuestId = 175},
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

----------- SEELENSTEIN-Quest -------------------------------------
---- Prüfen, ob der Spieler alle fünf Seelensteine und Quest hat  ---
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 2384 },
		PlayerHasItem {ItemId = 2620 },
		PlayerHasItem {ItemId = 2386 },
		PlayerHasItem {ItemId = 2627 },
		PlayerHasItem {ItemId = 2614 },
		QuestState{QuestId = 470 , State = StateActive}
	},
	Actions =
	{
		QuestBegin{QuestId = 471},
		QuestSolve{QuestId = 470}
	}
}
-------
--------- SEELENSTEIN-Quest ends here


EndDefinition()
end
