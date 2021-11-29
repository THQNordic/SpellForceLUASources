-- P203 ... Onyx Shore





----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p203/n32200_CutsceneGefangener.lua")
dofile("script/p203/n32201_CutsceneStart.lua")
dofile("script/p203/n32202_CutsceneHokan.lua")
dofile("script/p203/n0_QuestXP.lua")

dofile("script/Hadeko.lua")
dofile("script/HeiligeStaetteWorkaround.lua")

OnPlatformOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 130, Y = 393, Range = 0}
	},
	Actions =
	{
		ChangeBuildingRace {Race = 152, X = 130, Y = 393},
	}
}


-- Spieler betriit die Karte -- XP
OnOneTimeEvent
{
	Actions =
	{
		SetRewardFlagTrue { Name = "P203KarteErreicht" },
	}
}


-- Ist es der4 Phoenixsteinzweig der Map wird der Grabräuberauftrag ins Log übernommen
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {State = StateActive, QuestId = 778},
	},
	Actions =
	{
		QuestSolve {QuestId = 778},
		QuestSolve {QuestId = 773},
		QuestBegin {QuestId = 801},
		QuestBegin {QuestId = 802},
	}
}

-- Auftrag töte den Grabräuber lösen und nächsten beginnen
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 802, State = StateActive},
		FigureDead {NpcId = 8443},
	},
	Actions =
	{
		QuestSolve {QuestId = 802},
		-- Zwischeneinschub wegen Qa ID ist hoch aber korrekt
		QuestBegin {QuestId = 945},
		SetRewardFlagTrue {Name = "LichkoenigTot"},
	}
}

-- Schattenklinge muss aufbauen und bekommt direkt den nächsten Auftrag
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagFalse {Name = "g_nP201_PhoenixSteinSpieler"},
	},
	Actions =
	{
		QuestBegin {QuestId = 801},
		-- Zwischeneinschub wegen Qa ID ist hoch aber korrekt
		QuestBegin {QuestId = 945},
	}
}

-- Ist die Blockade im Canyon weg, dann Flag setzen zum Öffnen des Osttores
OnOneTimeEvent
{
	Conditions = 
	{
		ODER9
		{
			FigureDead {NpcId = 8447},
			FigureDominated {NpcId = 8447},
		},
		ODER9
		{
			FigureDead {NpcId = 8448},
			FigureDominated {NpcId = 8448},
		},
		ODER9
		{
			FigureDead {NpcId = 8449},
			FigureDominated {NpcId = 8449},
		},
		ODER9
		{
			FigureDead {NpcId = 8450},
			FigureDominated {NpcId = 8450},
		},
		ODER9
		{
			FigureDead {NpcId = 8451},
			FigureDominated {NpcId = 8451},
		},
		ODER9
		{
			FigureDead {NpcId = 8452},
			FigureDominated {NpcId = 8452},
		},
		ODER9
		{
			FigureDead {NpcId = 8453},
			FigureDominated {NpcId = 8453},
		},
		ODER9
		{
			FigureDead {NpcId = 8454},
			FigureDominated {NpcId = 8454},
		},
		ODER9
		{
			FigureDead {NpcId = 8455},
			FigureDominated {NpcId = 8455},
		},
		ODER9
		{
			FigureDead {NpcId = 8456},
			FigureDominated {NpcId = 8456},
		},
		ODER9
		{
			FigureDead {NpcId = 8457},
			FigureDominated {NpcId = 8457},
		},
		ODER9
		{
			FigureDead {NpcId = 8458},
			FigureDominated {NpcId = 8458},
		},
		ODER9
		{
			FigureDead {NpcId = 8459},
			FigureDominated {NpcId = 8459},
		},
		ODER9
		{
			FigureDead {NpcId = 8460},
			FigureDominated {NpcId = 8460},
		},
		ODER9
		{
			FigureDead {NpcId = 8461},
			FigureDominated {NpcId = 8461},
		},
		ODER9
		{
			FigureDead {NpcId = 8462},
			FigureDominated {NpcId = 8462},
		},
		ODER9
		{
			FigureDead {NpcId = 8463},
			FigureDominated {NpcId = 8463},
		},
		ODER9
		{
			FigureDead {NpcId = 8464},
			FigureDominated {NpcId = 8464},
		},
		ODER9
		{
			FigureDead {NpcId = 8465},
			FigureDominated {NpcId = 8465},
		},
		ODER9
		{
			FigureDead {NpcId = 8466},
			FigureDominated {NpcId = 8466},
		},
		ODER9
		{
			FigureDead {NpcId = 8467},
			FigureDominated {NpcId = 8467},
		},
		ODER9
		{
			FigureDead {NpcId = 8468},
			FigureDominated {NpcId = 8468},
		},
		ODER9
		{
			FigureDead {NpcId = 8469},
			FigureDominated {NpcId = 8469},
		},
		ODER9
		{
			FigureDead {NpcId = 8470},
			FigureDominated {NpcId = 8470},
		},
		ODER9
		{
			FigureDead {NpcId = 8471},
			FigureDominated {NpcId = 8471},
		},
		ODER9
		{
			FigureDead {NpcId = 8472},
			FigureDominated {NpcId = 8472},
		},
		ODER9
		{
			FigureDead {NpcId = 8473},
			FigureDominated {NpcId = 8473},
		},
		ODER9
		{
			FigureDead {NpcId = 8474},
			FigureDominated {NpcId = 8474},
		},
		ODER9
		{
			FigureDead {NpcId = 8475},
			FigureDominated {NpcId = 8475},
		},
		ODER9
		{
			FigureDead {NpcId = 8476},
			FigureDominated {NpcId = 8476},
		},
		ODER9
		{
			FigureDead {NpcId = 8477},
			FigureDominated {NpcId = 8477},
		},
		ODER9
		{
			FigureDead {NpcId = 8478},
			FigureDominated {NpcId = 8478},
		},
		ODER9
		{
			FigureDead {NpcId = 8479},
			FigureDominated {NpcId = 8479},
		},
		ODER9
		{
			FigureDead {NpcId = 8480},
			FigureDominated {NpcId = 8480},
		},
		ODER9
		{
			FigureDead {NpcId = 8481},
			FigureDominated {NpcId = 8481},
		},
		ODER9
		{
			FigureDead {NpcId = 8482},
			FigureDominated {NpcId = 8482},
		},
		ODER9
		{
			FigureDead {NpcId = 8483},
			FigureDominated {NpcId = 8483},
		},
		ODER9
		{
			FigureDead {NpcId = 8484},
			FigureDominated {NpcId = 8484},
		},
		ODER9
		{
			FigureDead {NpcId = 8485},
			FigureDominated {NpcId = 8485},
		},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P203BlockadeVernichtet"},
		QuestSolve {QuestId = 803},
		QuestBegin {QuestId = 804},
		SetRewardFlagTrue { Name = "BlockadeDurchbrochen" },
	}
}

-- Der Spieler hat mit dem Dorfältesten geredet und hat die Option genommen die Bestie frei zu lassen--> Questbuch ändern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203_TierFreiLassen"}
	},
	Actions =
	{
		QuestSolve {QuestId = 804},
		QuestBegin {QuestId = 805},
		QuestBegin {QuestId = 807},
		RevealUnExplored {X = 140, Y = 332, Range = 10}
	}
}

-- Der Spieler hat mit dem Dorfältesten geredet und hat die Option genommen die Bestie frei zu lassen--> Questbuch ändern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203TierAngesprochen"}
	},
	Actions =
	{
		QuestSolve {QuestId = 805},
	}
}

-- Der Spieler hat mit dem Dorfältesten geredet und die Resourcen genommen--> Questbuch ändern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203ResourcenGegeben"}
	},
	Actions =
	{
		QuestSolve {QuestId = 804},
		QuestBegin {QuestId = 807},
	}
}

-- Der Gefangene macht sich bemerkbar, wenn der Spieler in der Nähe ist
OnOneTimeEvent
{
	Conditions = 
	{
		PlayerUnitInRange {X = 168, Y = 165, Range = 10, UpdateInterval = 30},
	},
	Actions =
	{
		Outcry {Tag = "oca2uramP203_001", NpcId = 8486, String = "Heda, Runenkrieger! Nun lasst mich schon frei!", Color = ColorWhite}, 
	}
}

-- Der Spieler hat den Gefangenen befreit und die Resourcen genommen--> Questbuch ändern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203_GefangenerFreiResourcen"}
	},
	Actions =
	{
		QuestBegin {QuestId = 806},
	}
}

-- Der Spieler hat die zweiten Resourcen geholt--> Questbuch ändern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203ZweitesMalResourcenGegeben"}
	},
	Actions =
	{
		QuestSolve {QuestId = 806},
	}
}

-- Der Spieler hat den Gefangenen befreit und den Tipp genommen--> Questbuch ändern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_n_P203_TorOeffnen"}
	},
	Actions =
	{
		QuestBegin {QuestId = 808},
	}
}


-- Der Spieler hat den Gefangenen befreit und den Tipp genommen, der AUftrag ist erledigt--> Questbuch ändern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P203SteineWeg"}
	},
	Actions =
	{
		QuestSolve {QuestId = 808},
	}
}


-- Der Spieler hat das Lager zerstört--> Questbuch ändern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P203Camp1Zerstoert"},
		IsGlobalFlagTrue {Name = "g_P203Camp2Zerstoert"},
		IsGlobalFlagTrue {Name = "g_P203Camp3Zerstoert"},
		IsGlobalFlagTrue {Name = "g_P203Camp4Zerstoert"},
		IsGlobalFlagTrue {Name = "g_P203Camp5Zerstoert"},
		IsGlobalFlagTrue {Name = "g_P203Camp6Zerstoert"},
	},
	Actions =
	{
		QuestSolve {QuestId = 807},
		QuestBegin {QuestId = 809},
		SetRewardFlagTrue {Name = "ZerstoerungDesLagers"},
		-- Tor auf Flag
		SetGlobalFlagTrue {Name = "g_P203_LetztesLagerKaputt"},
		Outcry {Tag = "oca2tarioP203_002", NpcId = 8486, String = "Dankt den Ahnen, Freunde! Die Hazim sind besiegt!", Color = ColorWhite}, 		
	}
}

-- Sidequest Vergiftetes Wasser--> Questbuch ändern
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 1029, State = StateSolved},
		FigureDead {NpcId = 11195},
		IsGlobalFlagTrue {Name = "g_p203_Tantaro_Has_Spawned"},
	},
	Actions =
	{
		QuestSolve {QuestId = 1029},
		QuestBegin {QuestId = 1030},
	},
}
			
			
	
			
------------------------------------------------------------------
------------------------------------------------------------------
--Quest Heilige Stätten Q 844
------------------------------------------------------------------
--Nebel am Anfang
OnOneTimeEvent
{
	Conditions = {},
	Actions = 
	{ 
		SetEffect{Effect = "FogForever", X = 216, Y = 316, Length = 0, TargetType = World},
		ChangeObject {X = 217, Y = 316, Object = 809}
	}
}


--Spawning Dämonen Ende
--Quest solved
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P203OnyxBaumWirdKlein", UpdateInterval = 20},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P203OnyxDämonenSpawnStopHlStätte"},
		QuestSolve {QuestId = 1052, ActivateNextQuest = FALSE} -- hl. Stätte Onyx Shore
	}
}


--wenn schon alle gepflanzt, zurück zur Dryade Quest begin
OnOneTimeEvent
{
	Conditions = 
	{ 
		QuestState {QuestId = 1051, State = StateSolved, UpdateInterval = 30}, -- red Waste
		QuestState {QuestId = 1052, State = StateSolved, UpdateInterval = 30}, -- Onyx shore
		QuestState {QuestId = 1053, State = StateSolved, UpdateInterval = 30}, -- darkwind keep
		QuestState {QuestId = 1054, State = StateSolved, UpdateInterval = 30}, --kathai
		QuestState {QuestId = 1055, State = StateUnknown, UpdateInterval = 30}
	},
	Actions = 
	{ 
		QuestBegin {QuestId = 1055}, --zurück zur Dryade1
		SetGlobalFlagTrue {Name = "g_P205FirstShrinesCleansed"}
	}
}



--Baum wächst nach Lösen der Quest
-- nach 2 sekunden: kleiner Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P203OnyxBaumWirdKlein", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P203OnyxBaumwuchsTimer", Seconds = 2, UpdateInterval = 30},
	},
	Actions = 
	{ 
		SetEffect{Effect = "OccludeWhite", X = 217, Y = 316, Length = 3000, TargetType = World},
		ChangeObject {X = 217, Y = 316, Object = 3112},
		SetGlobalFlagTrue{Name = "g_P203OnyxBaumWirdMittel"},
		StopEffect {X = 216, Y = 316, TargetType = World}, --nebel aus
		PlaySound{Sound = SoundSacredFreedom},
	}
}


--nach 30 Minuten: mittlerer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P203OnyxBaumwuchsTimer", Seconds = 300, UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_P203OnyxBaumWirdMittel", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 217, Y = 316, Object = 3111},
		SetGlobalFlagTrue{Name = "g_P203OnyxBaumWirdGross"},
		SetEffect{Effect = "OccludeWhite", X = 217, Y = 316, Length = 3000, TargetType = World}
	}
}


--nach 45 Minuten: großer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P203OnyxBaumwuchsTimer", Seconds = 900, UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_P203OnyxBaumWirdGross", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 217, Y = 316, Object = 3110},
		SetEffect{Effect = "OccludeWhite", X = 217, Y = 316, Length = 3000, TargetType = World}
	}
}

-- Nachträglich eingeführte Camps haben Fake Rts Spawning
-- Ab hier die Effekte für das Spawning setzen und wieder auschalten
-- Linke Reihe suedlichstest Zelt
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 392, Y = 268, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 107, Y = 358, Range = 0},
			PlayerUnitInRange {X = 405, Y = 361, Range = 7},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 399, Y = 270},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 392, Y = 268, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 399, Y = 270, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 399, Y = 270, Length = 3000},
		StopEffect {TargetType = World, X = 399, Y = 270},
		SetGlobalFlagTrue {Name = "g_P203_BelagerungAbschnittEinsKaputt"},
	}
}

-- Linke Reihe Mitte Zelt
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 382, Y = 276, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 107, Y = 358, Range = 0},
			PlayerUnitInRange {X = 405, Y = 361, Range = 7},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 374, Y = 272},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 382, Y = 276, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 374, Y = 272, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 374, Y = 272, Length = 3000},
		StopEffect {TargetType = World, X = 374, Y = 272},
		SetGlobalFlagTrue {Name = "g_P203_BelagerungAbschnittZweiKaputt"},
	}
}


-- Linke Reihe Nord Zelt
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 381, Y = 284, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 107, Y = 358, Range = 0},
			PlayerUnitInRange {X = 405, Y = 361, Range = 7},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 374, Y = 281},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 381, Y = 276, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 374, Y = 281, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 374, Y = 281, Length = 3000},
		StopEffect {TargetType = World, X = 374, Y = 281},
		SetGlobalFlagTrue {Name = "g_P203_BelagerungAbschnittDreiKaputt"},
	}
}

-- Recht Reihe Nord Zelt
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 398, Y = 296, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 107, Y = 358, Range = 0},
			PlayerUnitInRange {X = 405, Y = 361, Range = 7},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 396, Y = 294},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 398, Y = 294, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 396, Y = 294, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 396, Y = 294, Length = 3000},
		StopEffect {TargetType = World, X = 396, Y = 294},
		SetGlobalFlagTrue {Name = "g_P203_BelagerungAbschnittVierKaputt"},
	}
}

-- Recht Reihe Mitte Zelt
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 399, Y = 286, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 107, Y = 358, Range = 0},
			PlayerUnitInRange {X = 405, Y = 361, Range = 7},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 396, Y = 287},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 399, Y = 286, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 396, Y = 287, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 396, Y = 287, Length = 3000},
		StopEffect {TargetType = World, X = 396, Y = 287},
		SetGlobalFlagTrue {Name = "g_P203_BelagerungAbschnittFuenfKaputt"},
	}
}
		
		
-- Recht Reihe Sued Zelt
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 407, Y = 278, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 107, Y = 358, Range = 0},
			PlayerUnitInRange {X = 405, Y = 361, Range = 7},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 405, Y = 277},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 407, Y = 278, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = 405, Y = 277, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 405, Y = 277, Length = 3000},
		StopEffect {TargetType = World, X = 405, Y = 277},
		SetGlobalFlagTrue {Name = "g_P203_BelagerungAbschnittSechsKaputt"},
	}
}		

-- Wenn das Tier frei ist gibt der Dorfaelteste seinen Senf dazu
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_n_P203TierAngesprochen"},
	},
	Actions =
	{
		Outcry {Tag = "oca2tarioP203_001", NpcId = 8486, String = "Das Gora ist erwacht! Es kehrt in sein altes Jagdrevier zurück!", Color = ColorWhite}, 		
	}
}

-- Random rumeier counter
OnPlatformOneTimeEvent
{
	Actions =
	{
		SetGlobalTimeStamp {Name = "n_P203RandomGenerator"}
	}
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
		SetGlobalTimeStamp{Name = "g_SchatzbriefCounter"},
	}
}

EndDefinition()
end


