
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p109/n0_ItemScript.lua") 

-- cutscene rename 
--dofile("script/p109/n6817_CutsceneWarzoneEntry.lua")

dofile("script/p109/n32016_CutsceneWarzoneEntry.lua")
dofile("script/FahrendeHaendler.lua")


PlatformInitAction (SetGlobalTimeStamp {Name = "KarteBetretenP108"})
OneTimeInitAction  (SetRewardFlagTrue {Name = "P109KarteErreicht"})

-- Zwerge wieder dem Spieler geben wenn er auf die Platform zurück kommt
OnPlatformOneTimeEvent 
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "P109_Chef_SchonGewechselt"},
		SetGlobalFlagTrue {Name = "TruppSpawn"},
	}
}

--!!! Fake Spawning für Trolldorf

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 446, Y = 249, Range = 15},
		IsGlobalTimeElapsed {Name = "WarZoneSpawnTimer", Seconds = 1},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WarzoneFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 447, Y = 250},
		SetEffect{Effect = "Campfire", X = 442, Y = 248},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 446, Y = 249, Range = 15}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "WarzoneFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 447, Y = 250, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 447, Y = 250, Length = 3000},
		StopEffect {TargetType = World, X = 447, Y = 250},
		StopEffect {TargetType = World, X = 442, Y = 248},
		SetGlobalFlagTrue {Name = "WarzoneTrollLagerKaputt"},
		EnableDialog {NpcId = 6396},
	}
}


--!!! Fake Spawning für Trolljäger

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 446, Y = 249, Range = 15},
		IsGlobalTimeElapsed {Name = "WarZoneSpawnTimer", Seconds = 1},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WarzoneHunterFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 441, Y = 324},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 435, Y = 325, Range = 15}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "WarzoneHunterFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 441, Y = 324, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 441, Y = 324, Length = 3000},
		StopEffect {TargetType = World, X = 441, Y = 324},
	}
}

--!!! Fake Spawning für Gobbos

OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 446, Y = 249, Range = 15},
		IsGlobalTimeElapsed {Name = "WarZoneSpawnTimer", Seconds = 1},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WarzoneGobbosFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 427, Y = 417},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 427, Y = 417, Range = 15}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "WarzoneGobbosFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 427, Y = 417, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 427, Y = 417, Length = 3000},
		StopEffect {TargetType = World, X = 427, Y = 417},
	}
}

--Fakle SPawning für DE Stadt
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 244, Y = 155, Range = 30},
		IsGlobalTimeElapsed {Name = "WarZoneSpawnTimer", Seconds = 1},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "WarzoneDEFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 268, Y = 148},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 244, Y = 155, Range = 30}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "WarzoneDEFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 268, Y = 148, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 268, Y = 148, Length = 3000},
		StopEffect {TargetType = World, X = 268, Y = 148},
	}
}

-- Spieler hat das Portal im Norden entdeckt und bekommt xp
OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 242, Y = 462, Range = 15},
	},
	Actions =
	{
		SetRewardFlagTrue {Name = "P109PortalErreicht"},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 2,
	Conditions =
	{
		Negated(BuildingInRange {X = 276, Y = 224, Range = 0, UpdateInterval = 2})
	},
	Actions =
	{
		RemoveObject {X = 271, Y = 226, Object = 900},
		RemoveObject {X = 272, Y = 226, Object = 900},
		RemoveObject {X = 272, Y = 227, Object = 900},
		RemoveObject {X = 273, Y = 227, Object = 900},
		RemoveObject {X = 273, Y = 228, Object = 900},
		RemoveObject {X = 271, Y = 225, Object = 900},
		RemoveObject {X = 270, Y = 225, Object = 900},
		RemoveObject {X = 270, Y = 224, Object = 900},
		RemoveObject {X = 269, Y = 224, Object = 900},
		SetEffect {TargetType = World, X = 271, Y = 225, Length = 1750, Effect = "DarkMight"},
		SetEffect {TargetType = World, X = 270, Y = 224, Length = 550, Effect = "Explo"},
		SetEffect {TargetType = World, Effect = "BuildingFire", X = 271, Y = 226, Length = 1500},
		SetEffect {TargetType = World, Effect = "BuildingFire", X = 272, Y = 226, Length = 1500},
		SetEffect {TargetType = World, Effect = "BuildingFire", X = 273, Y = 228, Length = 1500},
		SetEffect {TargetType = World, Effect = "BuildingFire", X = 269, Y = 224, Length = 1500},
		--RemoveObject {X = 278, Y = 230, Object = 900},
		--RemoveObject {X = 279, Y = 229, Object = 900},
		SetGlobalFlagTrue {Name = "P109_DunkelElfenTorZerstört"},
		QuestSolve {QuestId = 693},
		QuestBegin {QuestId = 692},
		SetGlobalTimeStamp {Name = "P109_LenaOutcry"},
		SetRewardFlagTrue {Name = "TorZerstoert"},
	}
	
}

-- Belohnung fürs Zwerge befreien
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
	},
	Actions =
	{
		SetRewardFlagTrue {Name = "ZwergeBefreit"},
	}
}

-- Belohnung fürs Trolle verhauen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "EinsMegaTrollCamp"},
		IsGlobalFlagTrue {Name = "ZweiMegaTrollCamp"},
		IsGlobalFlagTrue {Name = "DreiMegaTrollCamp"},
	},
	Actions =
	{
		SetRewardFlagTrue {Name = "TrollcampZerstoert"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 290, Y = 219, Range = 15},
		IsGlobalFlagTrue {Name = "ZwergeBefreitP108"},
	},
	Actions =
	{
		Outcry{Tag = "ocLena_P109_003", NpcId = 6817, String = "Passt auf, sie haben euer Vorhaben bemerkt! Sie greifen an!", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 449, Y = 244, Range = 15},
		IsGlobalFlagFalse {Name = "ZwergeBefreitP108"},
	},
	Actions =
	{
		Outcry{Tag = "ocBorondir_P109_001", NpcId = 6396, String = "Trollpack, elendiges! Kein Bier, kein Fleisch ... nur Tod in dieser Wüstenei!", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {NpcId = 6396, X = 363, Y = 297, Range = 15}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "ZwergeMachtDasFickendeTorAuf"},
	}
	
}




-----------------------------------------------------------------------------------------
----- 							    NEBENQUEST WERWÖLFE                             -----
-----------------------------------------------------------------------------------------

--Items vorhanden?
--Phiole im Inventar

OnOneTimeEvent
{
	Conditions =
	{
		
	 
	},
	Actions =
	{
		--RemoveDialog{NpcId = 7226},
		SetDialogType{ NpcId = 7257, Type = SideQuest},
		SetDialogType{ NpcId = 7226, Type = SideQuest},
		RemoveDialog {NpcId = 7236},
		RemoveDialog {NpcId = 7237},
		RemoveDialog {NpcId = 7238},
	}
}

REM =[[
OnOneTimeEvent
{
	Conditions =
	{
	 	QuestState{ QuestId = 646, State = StateActive}, 
	},
	Actions =
	{
		EnableDialog{NpcId = 7226},
		SetDialogType{ NpcId = 7226, Type = SideQuest},
	}
}

]]



OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{ Name = "PlayerHasItemBlutphiole"},
	 
	},
	Actions =
	{
		
		QuestSolve{QuestId = 650},
		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{ Name = "PlayerHasItemSanduhr"},
	 
	},
	Actions =
	{
		
		QuestSolve{QuestId = 651},
		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsItemFlagTrue{ Name = "PlayerHasItemKerze"},
	 
	},
	Actions =
	{
		
		QuestSolve{QuestId = 649},
		
	}
}


-- Wenn alle Gegenstände den Gargoyles abgenommen wurde
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{ QuestId = 649, State = StateSolved}, 
		QuestState{ QuestId = 650, State = StateSolved},
		QuestState{ QuestId = 651, State = StateSolved},
	 
	},
	Actions =
	{
		QuestSolve{QuestId = 648},
		QuestBegin{QuestId = 652},
		QuestBegin{QuestId = 653},
		QuestBegin{QuestId = 654},
		QuestBegin{QuestId = 655},
		EnableDialog {NpcId = 7236, Important = TRUE},
		EnableDialog {NpcId = 7237, Important = TRUE},
		EnableDialog {NpcId = 7238, Important = TRUE},
		
	}
	
}
-- Wenn alle Gegenstände richtig in den Tempeln platziert wurde
OnOneTimeEvent
{
	Conditions =
	{
		QuestState{ QuestId = 653, State = StateSolved}, 
		QuestState{ QuestId = 654, State = StateSolved},
		QuestState{ QuestId = 655, State = StateSolved},
	 
	},
	Actions =
	{
		QuestSolve{QuestId = 652},
		QuestBegin{QuestId = 731},

	}
	
}


--WerwolfVerwandlung Counter Initialisierung
OnPlatformOneTimeEvent
{
	Conditions =
	{
		Negated(QuestState{ QuestId = 652, State = StateSolved}), 
		TimeDay(), 
	},
	Actions =
	{
		IncreaseGlobalCounter { Name = "WerwolfVerwandlungP109" }, 
	}
	
}


--Verwandlung von Menschen in Werwölfe und zurück

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		Negated(QuestState{ QuestId = 652, State = StateSolved}), 
		TimeNight(), 
		FigureAlive { NpcId = 7212},
		FigureAlive { NpcId = 7213},
		FigureAlive { NpcId = 7214},
		FigureAlive { NpcId = 7215},
		FigureAlive { NpcId = 7216},
		FigureAlive { NpcId = 7217},
		FigureAlive { NpcId = 7218},
		FigureAlive { NpcId = 7219},
		FigureAlive { NpcId = 7220},
		FigureAlive { NpcId = 7221},
		FigureAlive { NpcId = 7222},
		FigureAlive { NpcId = 7223},
		IsGlobalCounter { Name = "WerwolfVerwandlungP109", Operator = IsEqual, Value = 0, UpdateInterval = 60} --Wenn der Zähler auf 0 steht 
	},
	Actions =	
	{
		ChangeUnit { Unit = 1660, NpcId = 7212, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7212},
		ChangeUnit { Unit = 1661, NpcId = 7213, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7213},
		ChangeUnit { Unit = 1663, NpcId = 7214, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7214},
		ChangeUnit { Unit = 1644, NpcId = 7215, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7215},
		ChangeUnit { Unit = 1661, NpcId = 7216, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7216},
		ChangeUnit { Unit = 1663, NpcId = 7217, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7217},
		ChangeUnit { Unit = 1644, NpcId = 7218, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7218},
		ChangeUnit { Unit = 1660, NpcId = 7219, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7219},
		ChangeUnit { Unit = 1661, NpcId = 7220, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7220},
		ChangeUnit { Unit = 1663, NpcId = 7221, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7221},
		ChangeUnit { Unit = 1644, NpcId = 7222, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7222},
		ChangeUnit { Unit = 1660, NpcId = 7223, ChangeLevel = TRUE},
		ChangeRace { Race =  195, NpcId = 7223},
		IncreaseGlobalCounter { Name = "WerwolfVerwandlungP109" }, 
		
	}
	
}

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		Negated(QuestState{ QuestId = 652, State = StateSolved}), 
		TimeDay(),
		FigureAlive { NpcId = 7212},
		FigureAlive { NpcId = 7213},
		FigureAlive { NpcId = 7214},
		FigureAlive { NpcId = 7215},
		FigureAlive { NpcId = 7216},
		FigureAlive { NpcId = 7217},
		FigureAlive { NpcId = 7218},
		FigureAlive { NpcId = 7219},
		FigureAlive { NpcId = 7220},
		FigureAlive { NpcId = 7221},
		FigureAlive { NpcId = 7222},
		FigureAlive { NpcId = 7223},
		IsGlobalCounter { Name = "WerwolfVerwandlungP109", Operator = IsGreaterOrEqual, Value = 1, UpdateInterval = 60} --Wenn der Zähler auf 0 steht 
	},
	Actions =	
	{
		ChangeUnit { Unit = 1160, NpcId = 7212},
		ChangeRace { Race =  152, NpcId = 7212},
		ChangeUnit { Unit = 1160, NpcId = 7213},
		ChangeRace { Race =  152, NpcId = 7213},
		ChangeUnit { Unit = 1160, NpcId = 7214},
		ChangeRace { Race =  152, NpcId = 7214},
		ChangeUnit { Unit = 1160, NpcId = 7215},
		ChangeRace { Race =  152, NpcId = 7215},
		ChangeUnit { Unit = 1160, NpcId = 7216},
		ChangeRace { Race =  152, NpcId = 7216},
		ChangeUnit { Unit = 1160, NpcId = 7217},
		ChangeRace { Race =  152, NpcId = 7217},
		ChangeUnit { Unit = 1160, NpcId = 7218},
		ChangeRace { Race =  152, NpcId = 7218},
		ChangeUnit { Unit = 1160, NpcId = 7219},
		ChangeRace { Race =  152, NpcId = 7219},
		ChangeUnit { Unit = 1160, NpcId = 7220},
		ChangeRace { Race =  152, NpcId = 7220},
		ChangeUnit { Unit = 1160, NpcId = 7221},
		ChangeRace { Race =  152, NpcId = 7221},
		ChangeUnit { Unit = 1160, NpcId = 7222},
		ChangeRace { Race =  152, NpcId = 7222},
		ChangeUnit { Unit = 1160, NpcId = 7223},
		ChangeRace { Race =  152, NpcId = 7223},
		ResetGlobalCounter { Name = "WerwolfVerwandlungP109" }, 
		
	}

}

OnPlatformOneTimeEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		QuestState{ QuestId = 652, State = StateSolved}, 
		FigureAlive { NpcId = 7212},
		FigureAlive { NpcId = 7213},
		FigureAlive { NpcId = 7214},
		FigureAlive { NpcId = 7215},
		FigureAlive { NpcId = 7216},
		FigureAlive { NpcId = 7217},
		FigureAlive { NpcId = 7218},
		FigureAlive { NpcId = 7219},
		FigureAlive { NpcId = 7220},
		FigureAlive { NpcId = 7221},
		FigureAlive { NpcId = 7222},
		FigureAlive { NpcId = 7223},
		
	},
	Actions =	
	{
		ChangeUnit { Unit = 1160, NpcId = 7212},
		ChangeRace { Race =  152, NpcId = 7212},
		ChangeUnit { Unit = 1160, NpcId = 7213},
		ChangeRace { Race =  152, NpcId = 7213},
		ChangeUnit { Unit = 1160, NpcId = 7214},
		ChangeRace { Race =  152, NpcId = 7214},
		ChangeUnit { Unit = 1160, NpcId = 7215},
		ChangeRace { Race =  152, NpcId = 7215},
		ChangeUnit { Unit = 1160, NpcId = 7216},
		ChangeRace { Race =  152, NpcId = 7216},
		ChangeUnit { Unit = 1160, NpcId = 7217},
		ChangeRace { Race =  152, NpcId = 7217},
		ChangeUnit { Unit = 1160, NpcId = 7218},
		ChangeRace { Race =  152, NpcId = 7218},
		ChangeUnit { Unit = 1160, NpcId = 7219},
		ChangeRace { Race =  152, NpcId = 7219},
		ChangeUnit { Unit = 1160, NpcId = 7220},
		ChangeRace { Race =  152, NpcId = 7220},
		ChangeUnit { Unit = 1160, NpcId = 7221},
		ChangeRace { Race =  152, NpcId = 7221},
		ChangeUnit { Unit = 1160, NpcId = 7222},
		ChangeRace { Race =  152, NpcId = 7222},
		ChangeUnit { Unit = 1160, NpcId = 7223},
		ChangeRace { Race =  152, NpcId = 7223},
		
		
	}

}



-----------------------------------------------------------------------------
----- 				   Angriffe auf Aufbaumonument 1 & 2                -----
-----------------------------------------------------------------------------


OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		
		TimeNightBeforeMidnight(),    
		IsMonumentInUse {X = 106, Y = 391, Range = 0, UpdateInterval = 10},
		IsMonumentInUse {X =  48, Y = 115, Range = 0, UpdateInterval = 10},
		IsGlobalCounter { Name = "WerwolfAngriff1P109", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht 
		Negated(QuestState{ QuestId = 652, State = StateSolved}), 
	},
	Actions =	
	{
		
		
		Goto { X = 106 , Y = 391 , NpcId = 7212 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 106 , Y = 391 , NpcId = 7213 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 106 , Y = 391 , NpcId = 7220 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 106 , Y = 391 , NpcId = 7222 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 48 ,  Y = 115 , NpcId = 7215 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 48 ,  Y = 115 , NpcId = 7216 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 48 ,  Y = 115 , NpcId = 7221 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 48 , Y =  115 , NpcId = 7223 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		
		IncreaseGlobalCounter { Name = "WerwolfAngriff1P109" }, 
	},
	
}

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		ODER(TimeOfDay  {Hour = 1, Minute = 0, TimeFrame = 1, UpdateInterval  = 10}, TimeDay()),    
		IsGlobalCounter { Name = "WerwolfAngriff1P109", Operator = IsEqual, Value = 1, UpdateInterval = 60} -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		ResetGlobalCounter { Name = "WerwolfAngriff1P109" }, --Der GeisterAngriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal in der Nacht ein Angriff gestartet wird 
	}
	
}
--- Angriffe wenn nur das Monument 2 geclaimed wurde
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
	
		TimeNightBeforeMidnight(),    
		IsMonumentInUse {X = 106, Y = 391, Range = 0, UpdateInterval = 10},
		--IsMonumentInUse {X =  48, Y = 115, Range = 0, UpdateInterval = 10},
		IsGlobalCounter { Name = "WerwolfAngriff2P109", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht 
		Negated(QuestState{ QuestId = 652, State = StateSolved}), 
	},
	Actions =	
	{
		
		
		Goto { X = 106 , Y = 391 , NpcId = 7212 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 106 , Y = 391 , NpcId = 7213 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 106 , Y = 391 , NpcId = 7220 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 106 , Y = 391 , NpcId = 7222 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto { X = 48 ,  Y = 115 , NpcId = 7215 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		--Goto { X = 48 ,  Y = 115 , NpcId = 7216 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		--Goto { X = 48 ,  Y = 115 , NpcId = 7221 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		--Goto { X = 48 , Y =  115 , NpcId = 7223 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		
		IncreaseGlobalCounter { Name = "WerwolfAngriff2P109" }, 
	},
	
}

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		ODER(TimeOfDay  {Hour = 1, Minute = 0, TimeFrame = 1, UpdateInterval  = 10}, TimeDay()),    
		IsGlobalCounter { Name = "WerwolfAngriff2P109", Operator = IsEqual, Value = 1, UpdateInterval = 60} -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		ResetGlobalCounter { Name = "WerwolfAngriff2P109" }, --Der GeisterAngriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal in der Nacht ein Angriff gestartet wird 
	}
	
}
-- Angriffe wenn nur das Monument 1 geclaimed wurd
OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		
		TimeNightBeforeMidnight(),    
		--IsMonumentInUse {X = 106, Y = 391, Range = 0, UpdateInterval = 10},
		IsMonumentInUse {X =  48, Y = 115, Range = 0, UpdateInterval = 10},
		IsGlobalCounter { Name = "WerwolfAngriff3P109", Operator = IsEqual, Value = 0, UpdateInterval = 60}, --Wenn der Zähler auf 0 steht 
		Negated(QuestState{ QuestId = 652, State = StateSolved}), 
	},
	Actions =	
	{
		
		
		--Goto { X = 106 , Y = 391 , NpcId = 7212 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto { X = 106 , Y = 391 , NpcId = 7213 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		--Goto { X = 106 , Y = 391 , NpcId = 7220 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		--Goto { X = 106 , Y = 391 , NpcId = 7222 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous}, 
		Goto { X = 48 ,  Y = 115 , NpcId = 7215 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 48 ,  Y = 115 , NpcId = 7216 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 48 ,  Y = 115 , NpcId = 7221 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		Goto { X = 48 , Y =  115 , NpcId = 7223 , Range = 5 , WalkMode = Run , GotoMode = GotoContinuous},
		
		IncreaseGlobalCounter { Name = "WerwolfAngriff3P109" }, 
	},
	
}

OnEvent
{
	NotInDialog = FALSE ,
	Conditions = 
	{
		ODER(TimeOfDay  {Hour = 1, Minute = 0, TimeFrame = 1, UpdateInterval  = 10}, TimeDay()),    
		IsGlobalCounter { Name = "WerwolfAngriff3P109", Operator = IsEqual, Value = 1, UpdateInterval = 60} -- Wenn der Zähler auf 1 steht
	},
	Actions =	
	{
		ResetGlobalCounter { Name = "WerwolfAngriff3P109" }, --Der GeisterAngriffszähler wird auf 0 zurückgesetzt, damit nur 1 mal in der Nacht ein Angriff gestartet wird 
	}
	
}

----------------------------
--
--	QuestBlock
--
----------------------------
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 691, State = StateActive}
	}, 
	Actions =
	{
		QuestBegin {QuestId = 693},
		QuestSolve {QuestId = 691},
	}
}



	
	


--OnOneTimeEvent
--{
--	Conditions =
--	{
--		IsGlobalFlagTrue {Name = "P109LenaFollow"},
--	},
--	Actions =
--	{
--		Outcry{Tag = "ocLena_P109_001", NpcId = 6817, String = "Durchforstet das Land, ich werde hier ausharren.", Color = ColorWhite},
--	}
--}

OnEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "ZwergenDeadCounter", Value = 1, Operator = IsGreaterOrEqual},
		IsGlobalFlagFalse  {Name = "OutcrySperre"},
	},
	Actions =
	{
		Outcry{Tag = "ocBorondir_P109_002", NpcId = 6396, String = "Verflixt! Das ging ins Auge! Kommt hierher zurück, ich gebe Euch noch ein paar meiner Leute!", Color = ColorWhite},
		SetGlobalFlagTrue {Name = "OutcrySperre"},
	}
}




EndDefinition()
end


