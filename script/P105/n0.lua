----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

-- Test, wenn nicht alle Fugitives mehr am Leben sind
--OnOneTimeEvent
--{
--	Conditions = 
--	{
--	 },
--	Actions = 
--	{
--		 IncreaseGlobalCounter{Name = "SavedFugees", Step = 12},
--	},
--}

dofile("script/p105/n0_ItemScript.lua")
dofile("script/FahrendeHaendler.lua")

FugiNumber =
{
	[0] = 1,
	[1] = 11,
	[2] = 19,
	[3] = 24,
	[4] = 15,
	[5] = 13,
	[6] = 22,
	[7] = 17,
	[8] = 21,
	[9] = 10,
	[10] = 2,
	[11] = 12,
	[12] = 6,
	[13] = 14,
	[14] = 5,
	[15] = 16,
	[16] = 8,
	[17] = 18,
	[18] = 3,
	[19] = 20,
	[20] = 9,
	[21] = 7,
	[22] = 23,
	[23] = 4,
	[24] = 25,
}


-- Portal für Nachspawnen der Eiselfen
PortalX = 122
PortalY = 107

-- Haltestation 1 der Fugis: Vor Elfentor coords
Fugis1X = 189
Fugis1Y = 90
Spieler1X = 145
Spieler1Y = 96

-- Haltestation 1a der Fugis: Kosmetikhalt nach Elfentor
--Fugis1aX = 203
--Fugis1aY = 132
Fugis1aX = 200
Fugis1aY = 143


-- Haltestation 2 der Fugis: Eistempel coords
Fugis2X = 152
Fugis2Y = 213
Spieler2X = 180
Spieler2Y = 156

-- Haltestation 2 der Fugis: Eistempel coords
Fugis2aX = 136
Fugis2aY = 261


-- Haltestation 3 der Fugis: Vor Elfenstadt coords
Fugis3X = 184
Fugis3Y = 250
Spieler3X = 149
Spieler3Y = 269

-- Endstation der Fugis: Coords in Elfenstadt
Fugis4X =
{
	[0] = 236,
	[1] = 266,
	[2] = 278,
	[3] = 210,
	[4] = 202,
	[5] = 216,
	[6] = 225,
	[7] = 260,
	[8] = 271,
	[9] = 253,
	[10] = 241,
	[11] = 254,
	[12] = 249,
	[13] = 218,
	[14] = 230,
	[15] = 225,
	[16] = 205,
	[17] = 227,
	[18] = 218,
	[19] = 228,
	[20] = 220,
	[21] = 255,
	[22] = 278,
	[23] = 236,
	[24] = 236,
}

Fugis4Y =
{
	[0] = 242,
	[1] = 233,
	[2] = 258,
	[3] = 266,
	[4] = 260,
	[5] = 236,
	[6] = 213,
	[7] = 238,
	[8] = 270,
	[9] = 290,
	[10] = 281,
	[11] = 238,
	[12] = 271,
	[13] = 286,
	[14] = 275,
	[15] = 284,
	[16] = 244,
	[17] = 226,
	[18] = 226,
	[19] = 217,
	[20] = 218,
	[21] = 231,
	[22] = 242,
	[23] = 217,
	[24] = 243,
}

AedarCityX = 200
AedarCityY = 248

TrolllagerX = 372
TrolllagerY = 192

Trolltanz1X = 321
Trolltanz1Y = 209
Trolltanz2X = 325
Trolltanz2Y = 209
Trolltanz3X = 327
Trolltanz3Y = 211
Trolltanz4X = 327
Trolltanz4Y = 216
Trolltanz5X = 323
Trolltanz5Y = 217
Trolltanz6X = 320
Trolltanz6Y = 214

LieferplatzX = 328
LieferplatzY = 204

ElfenstadtMitteX = 236
ElfenstadtMitteY = 256 

---- Die Trolle laufen jetzt nicht mehr bis hoch zum Portal zur Herstellung, sondern nur noch den halben Weg
---- Der Weg war zu weit bzw. wurden sie von den nachspawnenden Camps einfach zu lange aufgehalten
PortalHerstellungX = 381
PortalHerstellungY = 308

-----------------------------------------
-- MAINQUEST: Abfragen, ob der Spieler Wegpunkte erreicht hat
-- Punkt 1
OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange{ X = Spieler1X, Y = Spieler1Y, NpcId = Avatar, Range = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue{ Name = "P105_PlayerReachedPoint1"},
	},
}
-- Punkt 2
OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange{ X = Spieler2X, Y = Spieler2Y, NpcId = Avatar, Range = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue{ Name = "P105_PlayerReachedPoint2"},
	},
}
-- Punkt 3
OnOneTimeEvent
{
	Conditions = 
	{
		FigureInRange{ X = Spieler3X, Y = Spieler3Y, NpcId = Avatar, Range = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue{ Name = "P105_PlayerReachedPoint3"},
	},
}

-- MAINQUEST: Der Marsch beginnt, sobald Lena da ist (= Quest 584 solved, 585 active)

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 584, State = StateActive},
	},
	Actions = 
	{
		QuestSolve{QuestId = 584},
		QuestBegin{QuestId = 585},
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 585 , State = StateActive},
	},
	Actions = 
	{
		QuestSolve{QuestId = 585},
		QuestBegin{QuestId = 681},
		SetGlobalFlagTrue{ Name = "FugisGo"},
		SetRewardFlagTrue{ Name = "FugisBroughtToMap"},
	},
}
-----------------------------------------
-- MAINQUEST: Schlüssel mit Tor geöffnet

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 682 , State = StateActive},
		IsGlobalFlagTrue { Name = "P105_SouthTorAuf" },
	},
	Actions = 
	{
		QuestSolve{QuestId = 682},
	},
}
-- MAINQUEST: Eiselementarspawnpoint zerstört

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 683 , State = StateActive},
		IsGlobalFlagTrue { Name = "P105_IcetempleDestroyed" },
	},
	Actions = 
	{
		QuestSolve{QuestId = 683},
	},
}

-- MAINQUEST: Wenn Spieler von der Herstellung zurückkommt, ist Aedale verstorben

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 687 , State = StateActive},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "P105_AedaleDied"},
	},
}
-- MAINQUEST: Sobald Spieler von Zarzach den Feuertorschlüssel findet, wird Questbuch aktualisiert

OnOneTimeEvent
{
	Conditions = 
	{
		IsItemFlagTrue {Name ="PlayerHasItemFireGateKey"},
	},
	Actions = 
	{
		QuestSolve{QuestId = 689},
		QuestBegin{QuestId = 690},
	},
}




---------------------------------------------------
--- Sobald Spieler den Eistempel zestört, können Fugis zur Stadt laufen
----------------------------------------------------

OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 116, Y = 177, Range = 0})
	},
	Actions = 
	{
		SetGlobalFlagTrue { Name = "P105_IcetempleDestroyed" },
	},
}


-----------------------------------------------------------------
---   Wenn alle Trolle tot sind, Dialog vom Totem entfernen   ---
-----------------------------------------------------------------
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(FigureAlive{NpcId = 7203}),
		Negated(FigureAlive{NpcId = 7204}),
		Negated(FigureAlive{NpcId = 7205}),
		Negated(FigureAlive{NpcId = 7208}),
		Negated(FigureAlive{NpcId = 7209}),
		Negated(FigureAlive{NpcId = 7210}),
	 },
	Actions = 
	{
		RemoveDialog{NpcId = 7202},
	},
}

------------------------------------------------------------
--- 		  Falls Togo beim Wolftöten stirbt,          ---
---		   werden die anderen Trolle freigeschaltet		 ---
------------------------------------------------------------
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(FigureAlive{NpcId = 7205}),
		Negated(IsGlobalCounter{Name = "TogoKillWolf", Value = 0, Operator = IsEqual}),
		
	 },
	Actions = 
	{
		  ResetGlobalCounter{Name = "TogoKillWolf"},
		  SetGlobalFlagFalse{ Name = "P105_TrollsWorkingForMugwar"},
	},
}

-------------------------  TROLLSCHALTER   ----------------------
---                Die ganze Nacht durchtanzen                ---
---	          und dann am Tag faul am Pass rumhängen          ---
--- Verhalten wir über Flag "P105_TrollsNightFever" gesteuert ---                
-----------------------------------------------------------------
---   Wechsel nur, wenn die Trolle keinen aktiven Job haben   ---
-----------------------------------------------------------------


OnEvent
{   
	Conditions = 
	{
		TimeNight(),
		IsGlobalFlagFalse{ Name = "P105_TrollsNightFever"},
		IsGlobalFlagFalse{ Name = "P105_TrollsWorkingForMugwar"},
	 },
	Actions = 
	{
		 SetGlobalFlagFalse{Name = "P105_TrolleAtLagerstaette"},
		 ResetGlobalCounter{Name = "Trolltanz"},
		 IncreaseGlobalCounter{Name = "Trolltanz"},
		 SetGlobalTimeStamp{Name = "TrolltanzTimer"},
		 SetGlobalFlagFalse{Name = "P105_TrolleAtLagerstaette"},
		 SetGlobalFlagTrue{ Name = "P105_TrollsNightFever"},
	 },
} 

OnEvent
{
	Conditions = 
	{	
		Negated(TimeNight()),
		IsGlobalFlagTrue{ Name = "P105_TrollsNightFever"},
		IsGlobalFlagFalse{ Name = "P105_TrollsWorkingForMugwar"},
	},
	Actions = 
	{
		  ResetGlobalCounter{Name = "Trolltanz"},
		  SetGlobalFlagTrue{Name = "P105_TrolleAtLagerstaette"},
		  SetGlobalFlagFalse{ Name = "P105_TrollsNightFever"},
	},
	
}   


------------------------  TROLLTANZ   -------------------
---  Das n0 schlägt den Takt und die Trolle tanzen dazu
---------------------------------------------------------

OnEvent
{
	Conditions = 
	{	
		IsGlobalTimeElapsed {Name = "TrolltanzTimer", Seconds = 5},
		IsGlobalCounter{Name = "Trolltanz", Value = 1, Operator = IsEqual},
	 },
	Actions = 
	{
		 IncreaseGlobalCounter{Name = "Trolltanz"},
		 SetGlobalTimeStamp{Name = "TrolltanzTimer"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "TrolltanzTimer", Seconds = 5},
		IsGlobalCounter{Name = "Trolltanz", Value = 2, Operator = IsEqual},
	 },
	Actions = 
	{
		 IncreaseGlobalCounter{Name = "Trolltanz"},
		 SetGlobalTimeStamp{Name = "TrolltanzTimer"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "TrolltanzTimer", Seconds = 5},
		IsGlobalCounter{Name = "Trolltanz", Value = 3, Operator = IsEqual},
	 },
	Actions = 
	{
		 IncreaseGlobalCounter{Name = "Trolltanz"},
		  SetGlobalTimeStamp{Name = "TrolltanzTimer"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "TrolltanzTimer", Seconds = 5},
		IsGlobalCounter{Name = "Trolltanz", Value = 4, Operator = IsEqual},
	 },
	Actions = 
	{
		 IncreaseGlobalCounter{Name = "Trolltanz"},
		  SetGlobalTimeStamp{Name = "TrolltanzTimer"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "TrolltanzTimer", Seconds = 5},
		IsGlobalCounter{Name = "Trolltanz", Value = 5, Operator = IsEqual},
	 },
	Actions = 
	{
		 IncreaseGlobalCounter{Name = "Trolltanz"},
		  SetGlobalTimeStamp{Name = "TrolltanzTimer"},
	},
}

OnEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "TrolltanzTimer", Seconds = 5},
		IsGlobalCounter{Name = "Trolltanz", Value = 6, Operator = IsEqual},
	 },
	Actions = 
	{
		 ResetGlobalCounter{Name = "Trolltanz"},
		 IncreaseGlobalCounter{Name = "Trolltanz"},
		 SetGlobalTimeStamp{Name = "TrolltanzTimer"},
	},
}

----------------------------------------------------------


---------- Spawnpit Skelette / Wraiths / Spectres ---------
OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 66, Y = 264, Range = 0})
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed"},
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 68, Y = 273, Range = 0})
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed"},
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 59, Y = 279, Range = 0})
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed"},
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 49, Y = 275, Range = 0})
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed"},
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 51, Y = 264, Range = 0})
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed"},
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 59, Y = 267, Range = 0})
	},
	Actions = 
	{
		IncreaseGlobalCounter{Name = "P105_SpawnPitBuildingsDestroyed"},
		
	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		Negated(BuildingInRange {X = 339, Y = 318, Range = 0}),
		Negated(BuildingInRange {X = 334, Y = 322, Range = 0}),
		Negated(BuildingInRange {X = 344, Y = 340, Range = 0}),
		Negated(BuildingInRange {X = 331, Y = 354, Range = 0}),
	},
	Actions = 
	{
		SetRewardFlagTrue{Name = "SkeletonCampDestroyed"},
	},
}



-----------------------------------------------------------

--------------- SIDEQUEST DER WEG NACH TIONDRIA -----------

-----------------------------------------------------------

OnOneTimeEvent
{
	Conditions = 
	{
		
	},
	Actions = 
	{
		RemoveDialog{NpcId = 6799},
		SetDialogType{ NpcId = 6803, Type = SideQuest},
		--QuestBegin{QuestId = 608}, --Test
		--QuestSolve{ QuestId = 611}, --Test
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "SQP105_FlinksZelleOeffnen"},
	},
	Actions = 
	{
		EnableDialog{NpcId = 6799},
		SetDialogType{ NpcId = 6799, Type = SideQuest},
		
	},
}


OnOneTimeEvent
{
	Conditions = 
	{
		IsItemFlagTrue{Name = "PlayerHasItemDariusBook"},
		QuestState{QuestId = 701, State = StateActive}, --Buchauftrag bekommen	
	},
	Actions = 
	{
		QuestSolve {QuestId = 701 }, 
		QuestBegin {QuestId = 702 },
		SetRewardFlagTrue { Name = "SQTiondriaBuchDariusGefunden" },
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 702, State = StateSolved}, --Buch abgegeben

	},
	Actions = 
	{
		
		SetItemFlagFalse{ Name = "PlayerHasItemDariusBook"},
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 707, State = StateSolved},  --Seiten abgegeben

	},
	Actions = 
	{
		
		SetItemFlagFalse{ Name = "PlayerHasItemPage119"},
		SetItemFlagFalse{ Name = "PlayerHasItemPage120"},
		SetItemFlagFalse{ Name = "PlayerHasItemPage121"},
	},
}
--Übergabe der Steine
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 709, State = StateActive}, 

	},
	Actions = 
	{
		TransferItem {GiveItem = 4232, Flag = Give},
		
	},
}
--Übergabe des FlinksCellKey
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 708, State = StateActive}, 

	},
	Actions =
	{
		
		TransferItem {GiveItem = 4230, Flag = Give},
	
	}
}
--Remove FlinksCellKey
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 708, State = StateSolved}, 

	},
	Actions =
	{
		
		SetItemFlagFalse {Name = "PlayerHasItemFlinksCellKey"},
	
	}
}



OnOneTimeEvent
{
	Conditions = 
	{
		IsItemFlagTrue { Name = "PlayerHasItemFarnhardtsTreasure"},
		QuestState{QuestId = 712, State = StateActive}, --Skelettauftrag bekommen	
	},
	Actions = 
	{
		QuestSolve {QuestId = 712 }, 
		QuestBegin {QuestId = 714 },
		
	},
}

OnOneTimeEvent
{
	Conditions = 
	{
		
		QuestState{QuestId = 710, State = StateActive}, --Glutfänge entdeckt	
	},
	Actions = 
	{
		 SetGlobalFlagTrue{Name = "Frage1P105"},		
	},
}

--!!! Fake Spawning für Weroelfe suedlich von Tirganach 1

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 233, Y = 174, Range = 0}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 237, Y = 171},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 233, Y = 174, Range = 0}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 237, Y = 171, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 237, Y = 171, Length = 3000},
		StopEffect {TargetType = World, X = 237, Y = 171},
		StopEffect {TargetType = World, X = 237, Y = 171},
	}
}


--!!! Fake Spawning für Weroelfe suedlich von Tirganach 2

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 275, Y = 124, Range = 0}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 272, Y = 125},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 275, Y = 124, Range = 0}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 272, Y = 125, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 272, Y = 125, Length = 3000},
		StopEffect {TargetType = World, X = 272, Y = 125},
		StopEffect {TargetType = World, X = 272, Y = 125},
	}
}


--!!! Fake Spawning für Weroelfe suedlich von Tirganach 3

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 319, Y = 146, Range = 0}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 316, Y = 150},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 319, Y = 146, Range = 0}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 316, Y = 150, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 316, Y = 150, Length = 3000},
		StopEffect {TargetType = World, X = 316, Y = 150},
		StopEffect {TargetType = World, X = 316, Y = 150},
	}
}


--!!! Fake Spawning für Weroelfe suedlich von Tirganach 3

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 307, Y = 174, Range = 0}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 305, Y = 174},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 307, Y = 174, Range = 0}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 305, Y = 174, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 305, Y = 174, Length = 3000},
		StopEffect {TargetType = World, X = 305, Y = 174},
		StopEffect {TargetType = World, X = 305, Y = 174},
	}
}

--!!! Fake Spawning für Weroelfe suedlich von Tirganach 3

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 345, Y = 170, Range = 0}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 345, Y = 166},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 345, Y = 170, Range = 0}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 345, Y = 166, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 345, Y = 166, Length = 3000},
		StopEffect {TargetType = World, X = 345, Y = 166},
		StopEffect {TargetType = World, X = 345, Y = 166},
	}
}


EndDefinition()
end


