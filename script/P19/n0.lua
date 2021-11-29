function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p19/n2850_CutscenePhoenixDelivery.lua")
dofile("script/p19/n3782_CutsceneMedusaAttack.lua")

--- Cutscene Init Action -------
--OneTimeInitAction( ChangeRace {NpcId = 2838, Race = 152} )
--OneTimeInitAction( ChangeRace {NpcId = 2839, Race = 152} )
--OneTimeInitAction( ChangeRace {NpcId = 2840, Race = 152} )
--OneTimeInitAction( ChangeRace {NpcId = 2841, Race = 152} )

	

OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 382, Y = 317})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 362, Y = 273})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 373, Y = 213})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 346, Y = 228})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 318, Y = 200})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 365, Y = 120})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 241, Y = 53})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 212, Y = 48})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 195, Y = 56})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 187, Y = 85})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 162, Y = 143})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 250, Y = 184})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 279, Y = 208})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 202, Y = 205})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 179, Y = 224})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 155, Y = 256})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 139, Y = 294})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 146, Y = 298})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 152, Y = 349})
OneTimeInitAction (SetEffect{Effect = "PlasmaSmoke", Length = 0, TargetType = World, X = 76, Y = 208})

---Queststate Init !!TO DO!! Raus wenn durchspielbar

DebugInitAction(	QuestBegin{QuestId = 265}	)
DebugInitAction(	QuestBegin{QuestId = 318}	)
DebugInitAction(	QuestBegin{QuestId = 552}	)
-- Wächter zeigen
OnPlatformOneTimeEvent
{
Conditions = {
			QuestState{QuestId = 322 , State = StateUnknown},
			},
Actions = {
			RevealUnExplored{X = 272 , Y = 325 , Range = 10}
			}
}
--Godwall Solven
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 253 , State = StateActive},
	},
Actions =	
	{
	QuestSolve{QuestId = 253},
	QuestSolve{QuestId = 248},
	}
}

--Phönix weiter
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 552, State = StateActive},
	QuestState{QuestId = 553, State = StateUnknown},
	},
Actions =	
	{
	QuestSolve{QuestId = 552},
	QuestBegin{QuestId = 553},
	}
}
--MAINQUEST Q294 Vier Splitter BEGINS HERE
--Einzelsplitter starten

OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 302 , State = StateUnknown, UpdateInterval = 6},
	IsPlayerFlagTrue{Name = "Q294InfoShardsGiven" , UpdateInterval = 6},
	},
Actions =	
	{
	QuestBegin{QuestId = 296},
	QuestBegin{QuestId = 297},
	QuestBegin{QuestId = 298},
	QuestBegin{QuestId = 299},
	QuestBegin{QuestId = 301},
	QuestBegin{QuestId = 306},
	QuestBegin{QuestId = 302},
	QuestBegin{QuestId = 303},
	}
}
--SpringDance solver > Auch auf Godwall
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 296 , State = StateActive, UpdateInterval = 4},
	PlayerHasItem{ItemId = 2634, UpdateInterval = 4},
	},
Actions =	
	{
	QuestSolve{QuestId = 297},
	QuestSolve{QuestId = 296},
	}
}
--SummerWind solver > Auch auf Wildfire
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 298 , State = StateActive},
	PlayerHasItem{ItemId = 2666},
	},
Actions =	
	{
	QuestSolve{QuestId = 300},
	QuestSolve{QuestId = 299},
	QuestSolve{QuestId = 298},
	}
}
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
	QuestSolve{QuestId = 306},
	QuestSolve{QuestId = 307},
	QuestSolve{QuestId = 334},
	QuestSolve{QuestId = 301},
	}
}
--WinterSilence solver > Auch auf BlazingStones
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 302 , State = StateActive},
	PlayerHasItem{ItemId = 2746},
	},
Actions =	
	{
	QuestSolve{QuestId = 303},
	QuestSolve{QuestId = 304},
	QuestSolve{QuestId = 302},
	}
}
--Solver für alle Splitter, auf zum Wächter
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 296 , State = StateSolved},
	QuestState{QuestId = 298 , State = StateSolved},
	QuestState{QuestId = 301 , State = StateSolved},
	QuestState{QuestId = 302 , State = StateSolved},
	},
Actions =	
	{
	QuestSolve{QuestId = 295},
	QuestBegin{QuestId = 308},
	}
}
--MAINQUEST Q294 Vier Splitter ENDS HERE

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

-------EVERWHITE SILK BEGINS HERE
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem{ItemId = 3437 , Amount = 2},
		QuestState{QuestId = 525 , State = StateActive}
	},
	Actions =
	{
		QuestSolve {QuestId = 525},
	}
	
}
--alles da?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 525 , State = StateSolved},
				QuestState{QuestId = 524 , State = StateSolved},
				QuestState{QuestId = 526 , State = StateUnknown},
				},
Actions =		{
				QuestBegin{QuestId = 526},
				}
}
-------EVERWHITE SILK ENDS HERE

---- SIDEQUEST Q395 BLUT begins here
---- Q 395, Q 396 ---

---- Prüfen, ob der Spieler das Blut des Dämons hat --

OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 2540 },
		QuestState {QuestId = 399, State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 399} ,
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
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{QuestId = 406 , State = StateSolved},
		QuestState{QuestId = 399 , State = StateSolved},
		QuestState{QuestId = 400 , State = StateSolved},
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "Q395AllBlood"},
	}
}

------- SIDEQUEST Q395 BLUT ends here
EndDefinition()
end
