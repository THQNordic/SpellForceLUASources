--
--          +-------------------+            .:\:\:/:/:.
--          |   PLEASE DO NOT   |           :.:\:\:/:/:.:
--          |  FEED THE TROLLS  |          :=.' -   - '.=:
--          |                   |          '=(\ @   @ /)='
--          |   Thank you,      |             (  (_)  )
--          |     Phenomic Team |             /`-vvv-'\
--          +-------------------+            /         \
--                  |  |        @@@         / /|,,,,,|\ \
--                  |  |        @@@        /_//  /^\  \\_\
--    @x@@x@        |  |         |/        WW(  (   )  )WW
--    \||||/        |  |        \|          __\,,\ /,,/__
--     \||/         |  |         |         (______Y______)
--/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
----------------------------------------------------------------------

-- Wegpunkte für die Attack Patterns festlegen
g_P206_WestlicherLagereingangX = 101
g_P206_WestlicherLagereingangY = 398

g_P206_OestlicherLagereingangX = 310
g_P206_OestlicherLagereingangY = 385

g_P206_OestlicherSammelpunktX = 381
g_P206_OestlicherSammelpunktY = 355

g_P206_MonumentX = 192
g_P206_MonumentY = 340

g_P206_SeelensteinX = 283
g_P206_SeelensteinY = 466

g_P206_RitualPlatzX = 254
g_P206_RitualPlatzY = 321

-- An den Eisenvorräten
g_P206_ErsterStreunerWPX = 284
g_P206_ErsterStreunerWPY = 345

-- Lenya
g_P206_ZweiterStreunerWPX = 203
g_P206_ZweiterStreunerWPY = 388

--Bäume im Norden des Plateaus
g_P206_DritterStreunerWPX = 169
g_P206_DritterStreunerWPY = 413


--Homepoints der Truppen
g_P206_ErsterTrokanX = 154
g_P206_ErsterTrokanY = 286

g_P206_ZweiterTrokanX = 127
g_P206_ZweiterTrokanY = 286
                
g_P206_DritterTrokanX = 103
g_P206_DritterTrokanY = 285
                
g_P206_VierterTrokanX = 77
g_P206_VierterTrokanY = 307



g_P206_ErsterTrakanX = 363
g_P206_ErsterTrakanY = 352

g_P206_ZweiterTrakanX = 372
g_P206_ZweiterTrakanY = 330

g_P206_DritterTrakanX = 346
g_P206_DritterTrakanY = 312

g_P206_VierterTrakanX = 313
g_P206_VierterTrakanY = 290

g_P206_FuenfterTrakanX = 324
g_P206_FuenfterTrakanY = 277



-- Zeiten nach denen weitere Angriffe auf den Spieler gestartet werden
TrokanAngriffEins = 322
TrokanAngriffZwei = 897
TrokanAngriffDrei = 1198
TrokanAngriffVier = 1465

TrakanAngriffEins = 455
TrakanAngriffZwei = 911
TrakanAngriffDrei = 1223
TrakanAngriffVier = 1566

--Portalkoordinaten
g_P206_PortalX = 297 
g_P206_PortalY = 471


-- Wegpunkte für die Attack Patterns und das Spawnen der Mumien festlegen

--Homepoints der Truppen
g_P206_ErsterMumienX = 320
g_P206_ErsterMumienY = 175
              
g_P206_ZweiterMumienX = 326
g_P206_ZweiterMumienY = 166
              
g_P206_DritterMumienX = 289
g_P206_DritterMumienY = 121

--Angriffspunkte
g_P206_EingangSchluchtX = 286
g_P206_EingangSchluchtY = 74

g_P206_SchluchtPortalX = 210
g_P206_SchluchtPortalY = 83
                
g_P206_SchluchtTorX = 251
g_P206_SchluchtTorY = 184


function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p206/n32380_CutsceneKarawanenFuehrer.lua")
dofile("script/Hadeko.lua")
dofile("script/HeiligeStaetteWorkaround.lua")

-- Die beiden Hauptcharactere laufen nach und das Flag für die Angriffe auf den Spieler wird gesetzt
-- Die Aufträöge der Karte werden gestartet und die Zelte für das Trolllager werden auf die richtige Race gesetzt
OnOneTimeEvent
{
	Actions =
	{
		-- Urias
		Follow {Target = Avatar, NpcId = 8784},
		-- Aysche
		Follow {Target = Avatar, NpcId = 8788},
		-- Attackpatterns für den Spieler
		QuestBegin {QuestId = 818},
		QuestBegin {QuestId = 819},
		ChangeBuildingRace {Race = 4, X = 239, Y = 458},
		ChangeBuildingRace {Race = 4, X = 245, Y = 458},
		-- Vormap lösen
		QuestSolve {QuestId = 890},
		QuestSolve {QuestId = 1058},
		SetGlobalFlagFalse {Name  = "g_P204_UriasInEmpyria"},
		SetRewardFlagTrue {Name = "P206KarteErreicht"},	
		-- Wenn der Spieler die Karte betritt muss eine kleine Verzögerung fuer die CS rein
		SetGlobalTimeStamp {Name = "gt_P206_Cutscene"},
		-- Urias darf jetzt auf Empyria wieder folgen
		SetGlobalFlagTrue {Name = "g_P204_UriasFolgtAufEmpyria"},
	}
}


-- Wenn der Spieler das Monument claimt bleiben Ahörnchen und BHörnchen (Urias und Alyah) erst mal stehen und die Angriffe beginnen
OnOneTimeEvent
{
	Conditions =
	{
		IsMonumentInUse {X = 194, Y = 331, Range = 0}
	},
	Actions =
	{
		--Outcry {Tag = "TagMe1", NpcId = 8784, String = "Wir bleiben erst mal hier, bis der Weg durch die Wüste frei ist", Color = ColorWhite},
		SetGlobalFlagTrue {Name = "g_P206_HauptheldenFolgenNicht"},
		-- Timer für die Angriffsgruppen
		SetGlobalTimeStamp {Name = "g_c_P206_MonumentTimer"},
		QuestSolve {QuestId = 819},
		SetRewardFlagTrue {Name = "RastplatzGefunden"},	
	}
}

-- Die beiden Hauptcharactere bleiben stehen
OnOneTimeEvent
{
	Conditions  =
	{
		IsGlobalFlagTrue {Name = "g_P206_HauptheldenFolgenNicht"},
	},
	Actions =
	{
		-- Urias
		StopFollow {Target = Avatar, NpcId = 8784},
		-- Aysche
		StopFollow {Target = Avatar, NpcId = 8788},
		Goto {NpcId = 8784, X = 204, Y = 348, WalkMode = Run, Range = 5},
		Goto {NpcId = 8788, X = 204, Y = 348, WalkMode = Run, Range = 5},
	}
}

-- nach und nach die Flags für die anderen Angriffsgruppen setzen

		
		
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_MonumentTimer", Seconds = TrokanAngriffEins},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "AP1_TRO"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_MonumentTimer", Seconds = TrakanAngriffEins},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "AP1_TRA"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_MonumentTimer", Seconds = TrokanAngriffZwei},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "2AP1_TRO"},
	}
}

-- nach und nach die Flags für die anderen Angriffsgruppen setzen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_MonumentTimer", Seconds = TrokanAngriffDrei},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "3AP1_TRO"},	
	}
}

-- nach und nach die Flags für die anderen Angriffsgruppen setzen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_MonumentTimer", Seconds = TrokanAngriffVier},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "4AP1_TRO"},
	}
}

-- nach und nach die Flags für die anderen Angriffsgruppen setzen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_MonumentTimer", Seconds = TrakanAngriffZwei},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "2AP1_TRA"},
	}
}

-- nach und nach die Flags für die anderen Angriffsgruppen setzen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_MonumentTimer", Seconds = TrakanAngriffDrei},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "3AP1_TRA"},
	}
}

-- nach und nach die Flags für die anderen Angriffsgruppen setzen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_MonumentTimer", Seconds = TrakanAngriffVier},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "4AP1_TRA"},
		SetGlobalFlagTrue {Name = "5AP1_TRA"},
	}
}

-- Wenn die Brüder Tot sind werden die Angriffe aufs Gegencamp gestartet, dafür die Flags
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TrokanTot"},
		IsGlobalFlagTrue {Name = "g_P206_TrakanTot"}
	},
	Actions =
	{
		-- Hier mal aus der Nomenklatur raus, weil AttackPattern kurze Flags braucht
		SetGlobalFlagFalse {Name = "AP1_TRO"},
		SetGlobalFlagFalse {Name = "AP1_TRA"},
		SetGlobalFlagFalse {Name = "2AP1_TRO"},
		SetGlobalFlagFalse {Name = "2AP1_TRA"},
		SetGlobalFlagFalse {Name = "3AP1_TRO"},
		SetGlobalFlagFalse {Name = "3AP1_TRA"},
		SetGlobalFlagFalse {Name = "4AP1_TRO"},
		SetGlobalFlagFalse {Name = "4AP1_TRA"},
		SetGlobalFlagFalse {Name = "5AP1_TRA"},
	}
}



--Wenn der Spieler den Hebel umgelegt hat sterben Menschen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_AlleBenachrichtigt"},
		IsGlobalFlagTrue {Name = "g_P206_SchalterBenutzt"},
		FigureInRange{X = 270, Y = 250, NpcId = 8716, Range = 5},
		FigureInRange{X = 265, Y = 250, NpcId = 8717, Range = 5},
	},
	Actions =
	{
		-- Erst mal nur Timer um über die Zeiten evtl. auch Angriffswellen etc steuern zu können
		SetGlobalTimeStamp {Name = "g_c_P206_ChefsTot"},
		SetEffect{Effect = "AcidCloud",  Length = 10000, TargetType = World, X = 265, Y = 249},
		SetEffect{Effect = "Fog",  Length = 10000, TargetType = World, X = 263, Y = 250},
	}
}

--Sind ein Paar Sekunden Abgelaufen trifft Trakan und Trokan der Schlag
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_ChefsTot", Seconds = 7},
	},
	Actions =
	{
		--tEffect{Effect = "Lightning",  Length = 1000, TargetType = Figure, NpcId = 8716},
		--tEffect{Effect = "Lightning",  Length = 1000, TargetType = Figure, NpcId = 8717},
		SetGlobalFlagTrue {Name = "AP2_TRO"},
		SetGlobalFlagTrue {Name = "AP2_TRA"},
		SetGlobalFlagTrue {Name = "g_P206_ChefsDespawn"},
		QuestSolve {QuestId = 822},
		QuestBegin {QuestId = 823},
		SetRewardFlagTrue {Name = "FalleAusgeloest"}
	}
}

-- Trokan Lager greift Trakan Lager an Flags per Timer setzen 
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_ChefsTot", Seconds = 50},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "2AP2_TRO"}
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_ChefsTot", Seconds = 123},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "3AP2_TRO"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_ChefsTot", Seconds = 177},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "4AP2_TRO"},
	}
}

-- Trokan Lager greift Trakan Lager an Flags per Timer setzen Ende

-- Trakan Lager greift Trokan Lager an Flags per Timer setzen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_ChefsTot", Seconds = 69},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "2AP2_TRA"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_ChefsTot", Seconds = 115},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "3AP2_TRA"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_ChefsTot", Seconds = 223},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "4AP2_TRA"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_c_P206_ChefsTot", Seconds = 223},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "5AP2_TRA"},
	}
}

-- Trakan Lager greift Trokan Lager an Flags per Timer setzen Ende


-- Ab hier die Effekte für das Spawning setzen und wieder auschalten
-- Oestlicher Teil des Camps Trokan
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_ErsterTrokanX, Y = g_P206_ErsterTrokanY},
		SetGlobalFlagTrue {Name = "g_P206_TroAbschnittEinsKaputt"},
	}
}


-- nicht ganz so Oestlicher Teil des Camps Trokan
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 125, Y = 280, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_ZweiterTrokanX, Y = g_P206_ZweiterTrokanY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 125, Y = 280, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_ZweiterTrokanX, Y = g_P206_ZweiterTrokanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_ZweiterTrokanX, Y = g_P206_ZweiterTrokanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_ZweiterTrokanX, Y = g_P206_ZweiterTrokanY},
		SetGlobalFlagTrue {Name = "g_P206_TroAbschnittZweiKaputt"},
	}
}


-- großer Campteil in der Mitte Trokan
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 99, Y = 273, Range = 20},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_DritterTrokanX, Y = g_P206_DritterTrokanX},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 99, Y = 273, Range = 20}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_DritterTrokanX, Y = g_P206_DritterTrokanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_DritterTrokanX, Y = g_P206_DritterTrokanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_DritterTrokanX, Y = g_P206_DritterTrokanY},
		SetGlobalFlagTrue {Name = "g_P206_TroAbschnittDreiKaputt"},
	}
}

-- die zwei einsamen Zelte Trokan
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_VierterTrokanX, Y = 304, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_VierterTrokanX, Y = g_P206_VierterTrokanY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_VierterTrokanX, Y = g_P206_VierterTrokanY, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_VierterTrokanX, Y = g_P206_VierterTrokanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_VierterTrokanX, Y = g_P206_VierterTrokanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_VierterTrokanX, Y = g_P206_VierterTrokanY},
		SetGlobalFlagTrue {Name = "g_P206_TroAbschnittVierKaputt"},
	}
}






-- Nordcampteil
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 363, Y = 352, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 363, Y = 352},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_ErsterTrakanX, Y = g_P206_ErsterTrakanY},
		SetGlobalFlagTrue {Name = "g_P206_TraAbschnittEinsKaputt"},
	}
}



-- großer Campteil mit Marktstand Trakan
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_ZweiterTrakanX, Y = g_P206_ZweiterTrakanY, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_ZweiterTrakanX, Y = g_P206_ZweiterTrakanY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_ZweiterTrakanX, Y = g_P206_ZweiterTrakanY, Range = 20}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_ZweiterTrakanX, Y = g_P206_ZweiterTrakanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_ZweiterTrakanX, Y = g_P206_ZweiterTrakanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_ZweiterTrakanX, Y = g_P206_ZweiterTrakanY},
		SetGlobalFlagTrue {Name = "g_P206_TraAbschnittZweiKaputt"},
	}
}

-- die vier  Zelte in der Mitte Trakan
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_DritterTrakanX, Y = 318, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_DritterTrakanX, Y = g_P206_DritterTrakanY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_DritterTrakanX, Y = 318, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_DritterTrakanX, Y = g_P206_DritterTrakanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_DritterTrakanX, Y = g_P206_DritterTrakanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_DritterTrakanX, Y = g_P206_DritterTrakanY},
		SetGlobalFlagTrue {Name = "g_P206_TraAbschnittDreiKaputt"},
	}
}

-- Die Gruppe im NordSueden
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_VierterTrakanX, Y = g_P206_VierterTrakanY, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_VierterTrakanX, Y = g_P206_VierterTrakanY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_VierterTrakanX, Y = g_P206_VierterTrakanY, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_VierterTrakanX, Y = g_P206_VierterTrakanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_VierterTrakanX, Y = g_P206_VierterTrakanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_VierterTrakanX, Y = g_P206_VierterTrakanY},
		SetGlobalFlagTrue {Name = "g_P206_TraAbschnittVierKaputt"},
	}
}

-- Suedwestlicher Teil des Camps Trokan
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_FuenfterTrakanX, Y = g_P206_FuenfterTrakanY, Range = 10},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = 324, Y = 277},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_FuenfterTrakanX, Y = g_P206_FuenfterTrakanY, Range = 10}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_FuenfterTrakanX, Y = g_P206_FuenfterTrakanY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_FuenfterTrakanX, Y = g_P206_FuenfterTrakanY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_FuenfterTrakanX, Y = g_P206_FuenfterTrakanY},
		SetGlobalFlagTrue {Name = "g_P206_TraAbschnittFuenfKaputt"},
	}
}

-- Erster Teil Mumienlager
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_ErsterMumienX, Y = g_P206_ErsterMumienY, Range = 5},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_ErsterMumienX, Y = g_P206_ErsterMumienY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_ErsterMumienX, Y = g_P206_ErsterMumienY, Range = 5}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_ErsterMumienX, Y = g_P206_ErsterMumienY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_ErsterMumienX, Y = g_P206_ErsterMumienY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_ErsterMumienX, Y = g_P206_ErsterMumienY},
		SetGlobalFlagTrue {Name = "g_P206_MumienAbschnittEinsKaputt"},
	}
}

-- Zweiter Teil Mumienlager
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_ZweiterMumienX, Y = g_P206_ZweiterMumienY, Range = 5},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_ZweiterMumienX, Y = g_P206_ZweiterMumienY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_ZweiterMumienX, Y = g_P206_ZweiterMumienY, Range = 5}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_ZweiterMumienX, Y = g_P206_ZweiterMumienY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_ZweiterMumienX, Y = g_P206_ZweiterMumienY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_ZweiterMumienX, Y = g_P206_ZweiterMumienY},
		SetGlobalFlagTrue {Name = "g_P206_MumienAbschnittZweiKaputt"},
	}
}

-- Dritter Teil Mumienlager
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = g_P206_DritterMumienX, Y = g_P206_DritterMumienY, Range = 5},
		ODER9
		{
			IsMonumentInUse {X = 194, Y = 331, Range = 0},
			IsGlobalTimeElapsed {Name = "gt_P206_Cutscene", Seconds = 600},
		}
	},
	Actions =
	{
		SetEffect{Effect = "GroundWave", X = g_P206_DritterMumienX, Y = g_P206_DritterMumienY},
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = g_P206_DritterMumienX, Y = g_P206_DritterMumienY, Range = 5}),
	},
	Actions =
	{
		SetEffect{Effect = "Lightning", X = g_P206_DritterMumienX, Y = g_P206_DritterMumienY, Length = 3500},
		SetEffect{Effect = "AreaHit", X = g_P206_DritterMumienX, Y = g_P206_DritterMumienY, Length = 3000},
		StopEffect {TargetType = World, X = g_P206_DritterMumienX, Y = g_P206_DritterMumienY},
		SetGlobalFlagTrue {Name = "g_P206_MumienAbschnittDreiKaputt"},
	}
}


-- hat der Spieler die beiden Bosse von Hand getötet, obwohl er den AUftrag angenommen hat
-- bedeutet das mal wieder Zusatzarbeit und die Quest wird unsolvable
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			IsGlobalFlagTrue {Name = "g_P206_TrokanTot", UpdateInterval = 200},
			IsGlobalFlagTrue {Name = "g_P206_TrakanTot", UpdateInterval = 200},
		},
		QuestState {QuestId = 822, State = StateActive},
		IsGlobalFlagFalse {Name = "g_P206_UnKillTrokanTot"},
		IsGlobalFlagFalse {Name = "g_P206_UnKillTrakanTot"},
	},
	Actions =
	{
		QuestChangeState {QuestId = 822, State = StateUnsolvable},
		QuestBegin {QuestId = 823},
	}
}

-- Wenn alle Lager zerstört sind  wird der nächste Dialog des Karawanenführers freigeschaltet, dafür dieses Flag
-- außerdem wird erst dann die "Der Weg ist Frei" quest gesolved

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittEinsKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittZweiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittDreiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittVierKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittEinsKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittZweiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittDreiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittVierKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittFuenfKaputt"},
		
		-- Nur wenn die beiden Bosse tot sind wird der Auftrag gesolved, weil sonst
		IsGlobalFlagTrue {Name = "g_P206_TrokanTot"},
		IsGlobalFlagTrue {Name = "g_P206_TrakanTot"},
		Negated (QuestState {QuestId = 886, State = StateKnown})
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P206_AlleTraUndTroCampsPlatt"},
		QuestSolve {QuestId = 823},
		QuestBegin {QuestId = 824},
	}
}

-- Extra Zwei, wenn der Spieler nicht den Deal angenommen hat können Tra und Tro nicht sterben (despawn/tausch)
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittEinsKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittZweiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittDreiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittVierKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittEinsKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittZweiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittDreiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittVierKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittFuenfKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_DealAbgelehnt"},
		--QuestState {QuestId = 886, State = StateKnown, UpdateInterval = 2},
		
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "g_P206_KarawaneOhneDialog"},
		Outcry {Tag = "oca2barioP206_005", NpcId = 8790, String = "Die Gazeda sind fort! Träger, marsch!"},
		SetRewardFlagTrue {Name = "AlleinEinenWegGefunden"},	
	}
}

-- Für QuestRewards ohne Quest von Karawanenführer, beide Camps einzeln auf zerstört abfragen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittEinsKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittZweiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittDreiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TroAbschnittVierKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_DealAbgelehnt"},
	},
	Actions =
	{
		SetRewardFlagTrue {Name = "Lager1Kaputtgemacht"},	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittEinsKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittZweiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittDreiKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittVierKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_TraAbschnittFuenfKaputt"},
		IsGlobalFlagTrue {Name = "g_P206_DealAbgelehnt"},
	},
	Actions =
	{
		SetRewardFlagTrue {Name = "Lager2Kaputtgemacht"},	
	}
}


-- Da die beiden Despawnt werden und nicht sterben geht OnDeath nicht, deshalb hier das Todesflag setzen
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 8716},
		QuestState {QuestId = 886, State = StateUnknown, UpdateInterval = 2},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P206_TrokanTot"}
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 8717},
		QuestState {QuestId = 886, State = StateUnknown, UpdateInterval = 2},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P206_TrakanTot"}
	}
}

-- Sind die beiden Tot bevor man mit Bario geredet hat
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TrakanTot"},
		IsGlobalFlagTrue {Name = "g_P206_TrokanTot"},
		QuestState {QuestId = 820, State = StateActive},
	},
	Actions =
	{
		QuestChangeState {QuestId = 820, State = StateUnsolvable},
	}
}

-- Sind die beiden Tot bevor der unterhändler fertig ist, wird die Quest unsolvable
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "g_P206_TrakanTot"},
		IsGlobalFlagTrue {Name = "g_P206_TrokanTot"},
		QuestState {QuestId = 821, State = StateActive},
	},
	Actions =
	{
		QuestChangeState {QuestId = 821, State = StateUnsolvable},
	}
}

-- Auftrag mit dem Händler zu reden solven und Karawanengeleit beginnen und die Begleitung (Urias und Ayshe) wieder starten
-- Mumien roamen wenn die Karawane beginnt loszuziehen
OnOneTimeEvent
{
	Conditions =
	{
		ODER9
		{
			IsGlobalFlagTrue { Name = "g_P206_KarawaneLos"},
			IsGlobalFlagTrue { Name = "g_P206_KarawaneLosOhneDeal"}
		}
	},
	Actions =
	{
		
		SetGlobalFlagFalse {Name = "g_P206_HauptheldenFolgenNicht"},
		Follow {NpcId = 8784, Target = Avatar},
		Follow {NpcId = 8788, Target = Avatar},
		-- Mumienflags
		SetGlobalFlagTrue {Name = "AP1_MUM"},
		SetGlobalFlagTrue {Name = "AP2_MUM"},
		SetGlobalFlagTrue {Name = "AP3_MUM"},
	}
}

-- Noch mal XP für die Karawane mit Deal
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue { Name = "g_P206_KarawaneLos"},
	},
	Actions =
	{
		SetRewardFlagTrue {Name = "KarawaneLosgelaufen"},	
	}
}

-- Wenn der Spieler nicht den Deal eingegangen ist aber alles zerstört hat zieht die Karawane trotzdem los
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "g_P206_KarawaneOhneDialog", Seconds = 6}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P206_KarawaneLosOhneDeal"},
		QuestSolve {QuestId = 886},
		QuestBegin {QuestId = 887},
	}
}

-- Wenn der Spieler nicht den Deal eingegangen ist und er durch das Tor durch ist wird 
OnOneTimeEvent
{
	Conditions =
	{
		PlayerUnitInRange {X = 247, Y = 170, Range = 20},
		QuestState {State = StateActive, QuestId = 887},
	},
	Actions =
	{
		QuestSolve {QuestId = 887},
		QuestBegin {QuestId = 891}
	}
}

-- Ist die Quest Gesolved wird gezählt wieviele Trolle noch leben und dafür werden XP vergeben
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause"},
		IsGlobalCounter {Name = "g_c_P206_ToteTrolle", Value = 0, Operator = IsLessOrEqual}
	},
	Actions =
	{
		-- Alle Trolle da fuer die Dialoge
		SetGlobalFlagTrue {Name = "g_n_P206GanzeKarawaneAngekommen"}
	}
}

-- Ist die Quest Gesolved wird gezählt wieviele Trolle noch leben und dafür werden XP vergeben
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause"},
		IsGlobalCounter {Name = "g_c_P206_ToteTrolle", Value = 5, Operator = IsLessOrEqual},
		IsGlobalCounter {Name = "g_c_P206_ToteTrolle", Value = 0, Operator = IsGreater}
		
	},
	Actions =
	{
		-- Anzahl der Trolle fuer die Dialoge
		SetGlobalFlagTrue {Name = "g_n_P206HalbeKarawaneAngekommen"}
	}
}

-- Ist die Quest Gesolved wird gezählt wieviele Trolle noch leben und dafür werden XP vergeben
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause"},
		IsGlobalCounter {Name = "g_c_P206_ToteTrolle", Value = 10, Operator = IsLessOrEqual},
		IsGlobalCounter {Name = "g_c_P206_ToteTrolle", Value = 5, Operator = IsGreater}
		
	},
	Actions =
	{
		-- Anzahl der Trolle fuer die Dialoge
		SetGlobalFlagTrue {Name = "g_n_P206ViertelKarawaneAngekommen"}
	}
}

-- Ist die Quest Gesolved wird gezählt wieviele Trolle noch leben und dafür werden XP vergeben
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "c_P206_KarawaneZuHause"},
		IsGlobalCounter {Name = "g_c_P206_ToteTrolle", Value = 10, Operator = IsGreaterOrEqual},
	},
	Actions =
	{
		-- Keine Trolle da
		SetGlobalFlagTrue {Name = "g_n_P206KeineKarawaneAngekommen"}
	}
}

-- Wenn Führer und alle Tiere tot sind nimmt keiner die Karawane an und der Auftrag ist gefailed
-- Natürlich nur wenn auch der Auftrag läuft
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 8790},
		FigureDead {NpcId = 9021},
		FigureDead {NpcId = 9012},
		FigureDead {NpcId = 9013},
		FigureDead {NpcId = 9014},
		FigureDead {NpcId = 9015},
		FigureDead {NpcId = 9016},
		FigureDead {NpcId = 9017},
		FigureDead {NpcId = 9018},
		FigureDead {NpcId = 9019},
		FigureDead {NpcId = 9020},
		QuestState {QuestId = 825, State = StateActive},
	},
	Actions =
	{
		QuestChangeState {QuestId = 825, State = StateUnsolvable},
		QuestBegin {QuestId = 891},
		--SetGlobalFlagTrue {Name = "g_p206_DespawnKarawanenannehmer"}
	}
}


-- Wenn der Spieler es irgendwie ohne Aufbau geschafft haben sollte muss die Rasten Quest auf unsolvable
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {State = StateActive, QuestId = 819},
		QuestState {State = StateActive, QuestId = 891}
	},
	Actions =
	{
		QuestChangeState {State = StateUnsolvable, QuestId = 819},
	}
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
		SetEffect{Effect = "FogForever", X = 185, Y = 203, Length = 0, TargetType = World},
		ChangeObject {X = 186, Y = 203, Object = 809}
	}
}


--Spawning Dämonen Ende
--Quest solved
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P206RedWasteBaumWirdKlein", UpdateInterval = 20},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P206RedWasteDämonenSpawnStopHlStätte"},
		QuestSolve {QuestId = 1051, ActivateNextQuest = FALSE} -- hl. Stätte Onyx Shore
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
-- nach 2 Sekunden: kleiner Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P206RedWasteBaumWirdKlein", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P206RedWasteBaumwuchsTimer", Seconds = 2, UpdateInterval = 60},
	},
	Actions = 
	{ 
		ChangeObject {X = 186, Y = 203, Object = 3112},
		SetGlobalFlagTrue{Name = "g_P206RedWasteBaumWirdMittel"},
		StopEffect {X = 185, Y = 203, TargetType = World}, --nebel aus
		SetEffect{Effect = "OccludeWhite", X = 186, Y = 203, Length = 3000, TargetType = World},
		PlaySound{Sound = SoundSacredFreedom},
	}
}


--nach 5 Minuten: mittlerer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P206RedWasteBaumwuchsTimer", Seconds = 300, UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_P206RedWasteBaumWirdMittel", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 186, Y = 203, Object = 3111},
		SetGlobalFlagTrue{Name = "g_P206RedWasteBaumWirdGross"},
		SetEffect{Effect = "OccludeWhite", X = 186, Y = 203, Length = 3000, TargetType = World}
	}
}


--nach  Minuten: großer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P206RedWasteBaumwuchsTimer", Seconds = 900, UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "g_P206RedWasteBaumWirdGross", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 186, Y = 203, Object = 3110},
		SetEffect{Effect = "OccludeWhite", X = 186, Y = 203, Length = 3000, TargetType = World}
	}
}

-- Outcry Scheisse
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "t_P213_MonumentTimer", Seconds = 15},
	},
	Actions =
	{
		Outcry {Tag = "oca2uriasP206_001", NpcId = 8784, String = "Das war falsch, Alyah! Wir hätten dem Botschafter helfen sollen!", Color = ColorWhite},
		SetGlobalTimeStamp {Name = "gt_P206_PalaverMist"}
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_PalaverMist", Seconds = 4}
	},
	Actions =
	{
		Outcry {Tag = "oca2alyahP206_001", NpcId = 8788, String = "Dann wären wir jetzt genauso tot, Dummkopf! Haran wusste, was er tat!", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_PalaverMist", Seconds = 8}
	},
	Actions =
	{
		Outcry {Tag = "oca2uriasP206_002", NpcId = 8784, String = "Es war ehrlos und feige!", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_PalaverMist", Seconds = 12}
	},
	Actions =
	{
		Outcry {Tag = "oca2barioP206_001", NpcId = 8790, String = "So wie Ihr zankt, könnte man meinen, ihr wärt verheiratet!", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_PalaverMist", Seconds = 16}
	},
	Actions =
	{
		Outcry {Tag = "oca2alyahP206_002", NpcId = 8788, String = "Wenigstens sind wir am Leben! Das zählt!", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_PalaverMist", Seconds = 20}
	},
	Actions =
	{
		Outcry {Tag = "oca2uriasP206_003", NpcId = 8784, String = "Lauft Ihr deswegen immer davon?", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_PalaverMist", Seconds = 24}
	},
	Actions =
	{
		Outcry {Tag = "oca2alyahP206_003", NpcId = 8788, String = "Hört zu, Freund! Ich bin Euer Führer, findet Euch damit ab!", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_PalaverMist", Seconds = 28}
	},
	Actions =
	{
		Outcry {Tag = "oca2alyahP206_004", NpcId = 8788, String = "Also behaltet Eure Belehrungen oder Ihr könnt hier verrotten!", Color = ColorWhite},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "gt_P206_PalaverMist", Seconds = 32}
	},
	Actions =
	{
		Outcry {Tag = "oca2barioP206_002", NpcId = 8790, String = "Alyahs Zunge ist spitz wie Ihr Dolch! Ich hoffe, Euer Herz ist so gut gerüstet wie Ihr selbst, Ritter!", Color = ColorWhite},
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
		SetGlobalTimeStamp{Name = "g_SchatzbriefTimer"},
	}
}


EndDefinition()
end
