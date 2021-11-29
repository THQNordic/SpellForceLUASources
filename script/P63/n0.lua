function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p63/n2994_CutsceneRohen.lua")				
dofile("script/p63/n0_CutsceneTheBeginning.lua")		
dofile("script/p63/n3112_CutsceneRandolfI.lua")			
dofile("script/p63/n3112_CutsceneRandolfII.lua")		
dofile("script/p63/n3110_CutsceneVillageAttack.lua")
dofile("script/p63/n3030_CutsceneSartarius.lua")
dofile("script/p63/n2860_CutsceneGabarJourney.lua")


-- fürs skelett spawning in reise 4 (easteregg) :)
LibiStartStunde = 0
LibiEndStunde = 4


-- globales story state, hier beginn reise 1
OneTimeInitAction( SetGlobalState{Name = "Plot", State = "JourneyOne"} )
--DebugInitAction( SetGlobalFlagTrue{Name = "PreviewVersion"} )

--- Q424 MAIN QUEST BEGINS HERE --------------------------------------------
--MainQuest starten
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 424 , State = StateUnknown}
	},
	Actions =	
	{
		QuestBegin{QuestId = 424},
		QuestBegin{QuestId = 425},
	}
}
--Bote besiegt?
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 426 , State = StateActive},
		FigureDead{NpcId = 2916},
	},
	Actions =	
	{
		QuestBegin{QuestId = 427},
		QuestSolve{QuestId = 426},
	}
}
--Item gelootet?
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 427 , State = StateActive},
		PlayerHasItem{ItemId = 3197},
	},
	Actions =	
	{
		QuestBegin{QuestId = 428},
		QuestSolve{QuestId = 427},
		QuestBegin{QuestId = 429},
	}
}
--Monument geclaimt?
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 429 , State = StateActive},
		IsMonumentInUse{X = 193 , Y = 292 , Range = 5 , UpdateInterval = 20},
	},
	Actions =	
	{
		QuestBegin{QuestId = 435},
		QuestSolve{QuestId = 429},
		QuestBegin{QuestId = 436},
	}
}
--Goblinlager zerstört? 
OnOneTimeEvent
{
	Conditions =	
	{
--		QuestState{QuestId = 436 , State = StateActive},
		IsGlobalFlagTrue{Name = "GobblinCamp"},

	},
	Actions =	
	{
		QuestBegin{QuestId = 437},
		QuestSolve{QuestId = 435},
		QuestSolve{QuestId = 436},
		QuestSolve{QuestId = 429},
		QuestSolve{QuestId = 428},
	}
}

--Dorf befreit?  
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 438 , State = StateActive},
		FigureDead {NpcId = 3117},
		FigureDead {NpcId = 3116},		
		FigureDead {NpcId = 3115},
		FigureDead {NpcId = 3114},
		FigureDead {NpcId = 3113},
		FigureDead {NpcId = 3144},
		FigureDead {NpcId = 3145},
		FigureDead {NpcId = 3146},
		FigureDead {NpcId = 3147},
		FigureDead {NpcId = 3148},
		FigureDead {NpcId = 3149},
		FigureDead {NpcId = 3150},
		FigureDead {NpcId = 3151},
		FigureDead {NpcId = 3152},
		FigureDead {NpcId = 3153},
	},
	Actions =	
	{
		QuestBegin{QuestId = 439},
		QuestSolve{QuestId = 438},
		QuestSolve{QuestId = 437},
		SetRewardFlagTrue {Name = "AngriffDerHoehlenorks"} 
	}
}
--Greyfell erreicht?
OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 439 , State = StateActive},
		PlayerUnitInRange {X = 380 , Y = 240 , Range = 7 , FigureType = FigureAvatar , UpdateInterval = 2 },
	},
	Actions =	
	{
		QuestBegin{QuestId = 440},
		QuestSolve{QuestId = 439},
	}
}


OnOneTimeEvent
{
	UpdateInterval = 2,
	Conditions =	
	{
		QuestState{QuestId = 442 , State = StateActive},
		FigureInRange {X = 395 , Y = 265 , Range = 7 , NpcId = Avatar},
--		FigureInRangeNpc {TargetNpcId = 3032 , Range = 7 , NpcId = Avatar, UpdateInterval = 5},
	},
	Actions =	
	{
		QuestBegin{QuestId = 443},
		QuestSolve{QuestId = 442},
	}
}

-- Höhlenorcs zurückgeschlagen
OnOneTimeEvent
{
	Conditions =
	{
		ODER(QuestState{QuestId = 443 , State = StateActive} , QuestState{QuestId = 442 , State = StateActive}),
		FigureDead {NpcId = 3120},
		FigureDead {NpcId = 3121},		
		FigureDead {NpcId = 3122},
		FigureDead {NpcId = 3123},
		FigureDead {NpcId = 3124},
		FigureDead {NpcId = 3125},
		FigureDead {NpcId = 3126},		
		FigureDead {NpcId = 3127},
		FigureDead {NpcId = 3128},
		FigureDead {NpcId = 3129},
		FigureDead {NpcId = 3130},
		FigureDead {NpcId = 3131},
		FigureDead {NpcId = 3134},
		FigureDead {NpcId = 3135},
		FigureDead {NpcId = 3136},
		FigureDead {NpcId = 3137},
		FigureDead {NpcId = 3138},
		FigureDead {NpcId = 3139},
		FigureDead {NpcId = 3140},
		FigureDead {NpcId = 3141},
		FigureDead {NpcId = 3142},
		FigureDead {NpcId = 3143},
	},
	Actions =	
	{
		QuestBegin{QuestId = 444},
		QuestSolve{QuestId = 443},
		QuestSolve{QuestId = 442},
		SetGlobalFlagTrue {Name = "OrksTownDead"},
	}
}
--- Q424 MAIN QUEST ENDS HERE --------------------------------------------


---------------------------------------------
----------------- ZAUBERWERK - QUEST

--Checker ob Spieler Augengläser hat und Queste
---- -Q335 -Q336 -Q337  - Zauberwerk-Quest/Augengläser
OnOneTimeEvent
{	UpdateInterval = 1,
	Conditions =	
	{	
		PlayerHasItem{ItemId = 2893 },
		QuestState{QuestId = 337 , State = StateActive}
	},
	Actions =	
	{
		QuestBegin{QuestId = 338},
		QuestSolve{QuestId = 337}
	}
}

--Checker ob Spieler Federkiel hat und Queste
---- -Q335 -Q339 -Q351  - Zauberwerk-Quest/Federkiel
OnOneTimeEvent
{
	UpdateInterval = 1,
	Conditions =	{
		PlayerHasItem{ItemId = 2001 },
		QuestState{QuestId = 351 , State = StateActive}
		},
	Actions =	{
		QuestSolve{QuestId = 351},
		QuestBegin{QuestId = 340}
		}
}

--Checker ob Spieler Beschwörerkreide hat und Queste
---- -Q335 -Q341 -Q345  - Zauberwerk-Quest/Beschwörerkreide
OnOneTimeEvent
{
	UpdateInterval = 1,
	Conditions =	{
		PlayerHasItem{ItemId = 2896 },
		QuestState{QuestId = 350 , State = StateActive}
		},
	Actions =	{
		QuestBegin{QuestId = 342},
		QuestSolve{QuestId = 350}
		}
}

------------------- ZAUBERWERK - QUEST - ENDE
-------------------------------------------------


----------------------------------------------------------
------------------ KRANKER EINSIEDLER - QUEST ------------

----- Sicko-Hermit erst ab Reise 2 anschalten
OnToggleEvent 
{
	OnConditions =
	{
		QuestState {QuestId = 110, State = StateUnknown},
	},
	OnActions =
	{
		RemoveDialog {NpcId = 2865},
	},
	OffConditions =
	{
		Negated(QuestState {QuestId = 110, State = StateUnknown}),
	},
	OffActions =
	{
		EnableDialog {NpcId = 2865},
		SetDialogType{NpcId = 2865 , Type = SideQuest},
	}
}

------ Kranker Einsiedler besiegt?
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 2865},
		QuestState{QuestId = 366, State = StateActive} ,
	},
	Actions =
	{
		QuestSolve {QuestId = 366},
		QuestSolve {QuestId = 358},
	}	
}

-------------- KRANKER EINSIEDLER ends here --------
----------------------------------------------------



---------------------------------------------------
------------------- SCHWARZEIBE - QUEST -----------

----- Zarim erst ab Reise 2 anschalten
OnToggleEvent 
{
	OnConditions =
	{
		QuestState {QuestId = 110, State = StateUnknown},
	},
	OnActions =
	{
		RemoveDialog {NpcId = 3044},
	},
	OffConditions =
	{
		Negated(QuestState {QuestId = 110, State = StateUnknown}),
	},
	OffActions =
	{
		EnableDialog {NpcId = 3044},
		SetDialogType{NpcId = 3044 , Type = SideQuest},
		}   
}
-----------  SCHWARZEIBE - QUEST ends here ---------------------------
----------------------------------------------------------------------



---------------------------------------------
------------------- ECHOS - QUEST -----------

----- Sandor und Goran  erst ab Reise 2 anschalten
OnToggleEvent 
{
	OnConditions =
	{
		QuestState {QuestId = 110, State = StateUnknown},
	},
	OnActions =
	{
		RemoveDialog {NpcId = 2867},
		RemoveDialog {NpcId = 2872},
	},
	OffConditions =
	{
		Negated(QuestState {QuestId = 110, State = StateUnknown}),
	},
	OffActions =
	{
		EnableDialog {NpcId = 2867},
		EnableDialog {NpcId = 2872},
		SetDialogType{NpcId = 2867 , Type = SideQuest},
	   	SetDialogType{NpcId = 2872 , Type = SideQuest},
	   }
}
----------------------------------------

-- !! Echos Questabfragen in Flags umwandeln
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SouthStoneSolved"}, 
		IsGlobalFlagTrue {Name = "SouthWestStoneSolved"}, 
		IsGlobalFlagTrue {Name = "MidNorthStoneSolved"}, 
		QuestState{QuestId = 325, State = StateActive} ,
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "FlagPlayerHasThreeStonesDuringEchoes"},
		QuestBegin {QuestId = 329},
		SetPlayerFlagFalse {Name = "CPlayerHasThreeStones"},
	}	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SouthStoneSolved"}, 
		IsGlobalFlagTrue {Name = "SouthWestStoneSolved"}, 
		IsGlobalFlagTrue {Name = "MidNorthStoneSolved"}, 
		QuestState{QuestId = 325, State = StateUnknown} ,
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "CPlayerHasThreeStones"},
	}	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "SouthStoneSolved"}, 
		IsGlobalFlagFalse {Name = "SouthWestStoneSolved"}, 
		IsGlobalFlagFalse {Name = "MidNorthStoneSolved"},
	},
	Actions =
	{
		SetPlayerFlagTrue {Name = "CNoStoneTouched"},
	}	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "OneStoneTouched"},
	},
	Actions =
	{
		SetPlayerFlagFalse {Name = "CNoStoneTouched"},
	}	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SouthStoneSolved"},
		QuestState {QuestId = 325, State = StateActive},
	},
	Actions =
	{
		QuestSolve {QuestId = 328},
	}	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "SouthWestStoneSolved"},
		QuestState {QuestId = 325, State = StateActive},
	},
	Actions =
	{
		QuestSolve {QuestId = 327},
	}	
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "MidNorthStoneSolved"},
		QuestState {QuestId = 325, State = StateActive},
	},
	Actions =
	{
		QuestSolve {QuestId = 326},
	}	
}


OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 333, State = StateActive},
		FigureDead {NpcId = 2894},
		PlayerHasItem {ItemId = 3042},
	},
	Actions =
	{
		QuestSolve {QuestId = 333},
		QuestBegin {QuestId = 377},
		SetRewardFlagTrue {Name = "EchosShinTarGuar"},
		SetGlobalFlagFalse{Name = "SandorMustFollowAvatar"},
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState {QuestId = 332, State = StateActive},
	},
	Actions =
	{
		RemoveDialog {NpcId = 2867},
	}
}



-------------------------- ECHOS-QUEST - ENDE
-------------------------------------------------


---------------------------------------------------------
------------------------- AMRA UND LEA ------------------
---------------------------------------------------------

--Amra und Lea Content, Anfang
OnToggleEvent 
{
	OnConditions =
	{
		QuestState {QuestId = 110, State = StateUnknown},
	},
	OnActions =
	{
		RemoveDialog {NpcId = 2896},
		RemoveDialog {NpcId = 2897},
	},
	OffConditions =
	{
		Negated(QuestState {QuestId = 110, State = StateUnknown}),
	},
	OffActions =
	{
		EnableDialog {NpcId = 2896},
		EnableDialog {NpcId = 2897},
		SetDialogType{NpcId = 2896 , Type = SideQuest},
		SetDialogType{NpcId = 2897 , Type = SideQuest},
	}
}



----!!! Amra und Lea Testdaten
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		--QuestState {QuestId = 385, State = StateActive},
--	},
--	Actions =
--	{
--		QuestBegin {QuestId = 110},
--	}
--}


-------------------------------------------------------------
--------------------- AMRA UND LEA - ENDE -------------------
-------------------------------------------------------------


-------------------------------------------------------------
------------------ Q395 BLUT-QUEST begins here


--- Tombard soll Maul halten, bis der Spieler von Adhira zu ihm geschickt wird
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 397, State = StateUnknown},
	},
	Actions =
	{
		RemoveDialog{NpcId = 2992}
	}
}
-------------------------------


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
-------------------


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
------------------

---- Prüfen, ob der Spieler das Blut der Spinne hat --
OnOneTimeEvent
{
	Conditions =
	{
		PlayerHasItem {ItemId = 3165 },
		QuestState {QuestId = 406, State = StateActive},
	},
	Actions =
	{
		QuestSolve{QuestId = 406} ,
	}
}
----------

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
-------

---- Hat der Spieler Tombard gekillt?

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 398, State = StateActive},
		FigureDead {NpcId = 2992 },
	},
	Actions =
	{
		QuestSolve{QuestId = 398},
		QuestSolve{QuestId = 395},
	}
}

-----------------------------------------
------ Q395 BLUT-QUEST ends here
-----------------------------------------


-------------- Tanara disablen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "TanaraKannSprechen"},
	},
	Actions =
	{
		RemoveDialog {NpcId = 2861},
	}
}

-------------- Tanara enablen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "TanaraKannSprechen"},
	},
	Actions =
	{
		EnableDialog {NpcId = 2861},
		SetDialogType{NpcId = 2861 , Type = SideQuest},
	}
}

-------Feine Stoffe  BEGINS HERE
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
		QuestBegin {QuestId = 526},
	}	
}
--Dunkle Seide gefunden?
OnOneTimeEvent
{
Conditions =	{
				PlayerHasItem{ItemId = 2511},
				QuestState{QuestId = 524 , State = StateActive},
				},
Actions =		{
				QuestSolve{QuestId = 524},
				}
}
--alles da?
OnOneTimeEvent
{
Conditions =	{
				QuestState{QuestId = 525 , State = StateSolved},
				QuestState{QuestId = 524 , State = StateSolved},
				},
Actions =		{
				QuestBegin{QuestId = 526},
				}
}
-------Feine Stoffe ENDS HERE
-------------------------------------------

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

---NEBENQUEST Q266 Solver
OnOneTimeEvent
{
Conditions = 
	{
	QuestState{QuestId = 267 , State = StateActive},
	QuestState{QuestId = 555 , State = StateActive},
	},
Actions =	
	{
	QuestSolve{QuestId = 267},
	QuestSolve{QuestId = 266},
	}
}

----------------------------------------------------------
--
--	... alter clan attack, spinnenattacke
--
----------------------------------------------------------
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		PlayerUnitInRange {X = 392, Y = 272, Radius = 10},
--	},
--	Actions =
--	{
--		ClanAttack {Number = 5, SourceClan = 27, TargetX = 392, TargetY = 285},
--		ClanAttack {Number = 5, SourceClan = 26, TargetX = 416, TargetY = 283},
--		ClanAttack {Number = 5, SourceClan = 25, TargetX = 428, TargetY = 265},
--		ClanAttack {Number = 5, SourceClan = 24, TargetX = 393, TargetY = 306},
--		ClanAttack {Number = 5, SourceClan = 23, TargetX = 422, TargetY = 282},
--		ClanAttack {Number = 5, SourceClan = 22, TargetX = 427, TargetY = 241},
--		ClanAttack {Number = 5, SourceClan = 21, TargetX = 428, TargetY = 265},
--	}
--}


-- ==================================================================================================================
-- ====================== OUTCRIES ============================================================================================
-- ==================================================================================================================

OnOneTimeEvent
{
	Conditions =	
	{
		QuestState{QuestId = 322 , State = StateActive}
		--IsGlobalState {Name = "Plot", State = "JourneyThree", UpdateInterval = 10},
	},
	Actions =	
	{
		Outcry{ Tag = "outcryGuardGrey001"       , NpcId = 3032, String = "Der Runenkrieger ist zurück! Schnell Ihr müsst ins Haupthaus des Ordens kommen!"             , Color = ColorWhite },
	}
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "WulfgarGuardNowAggressive", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "OrksTownDead", UpdateInterval = 10},
	},
	Actions = 
	{
		Outcry{ Tag = "outcryGuardGrey002", NpcId = 3032, String = "Da sind sie!", Color = ColorWhite },
		Outcry{ Tag = "outcryCommGrey001", NpcId = 3260, String = "Haltet sie von der Stadt fern!", Color = ColorWhite },
	},
}

EndDefinition()

end
