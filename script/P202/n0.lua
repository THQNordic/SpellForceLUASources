--P202_City_Of_Souls


-- Coords für Eingangsportal Oststadt (Hauptquestbereich)
--PortalX = 328
--PortalY = 424


-- Coords für Eingangsportal Weststadt (Nebenquestbereich)
--PortalX = 225	
--PortalY = 93

-----------------------------------

--XP gibts für:

--HeldenBeschworen 	(Flag in n0)
--GrabmalGeoeffnet 	(Flag in n0)
--UrneZuHokan				(Flag in CS Hokan Ende)
--Seelenwesen1	
--Seelenwesen2	
--Seelenwesen3	
--Seelenwesen4	
--Seelenwesen5	


-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

----Flags zum Testen CS
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 10 ,
--	Conditions = {},
--	Actions = 
--	{
--		SetGlobalFlagTrue{Name = "g_sP202CutsceneHokanStartEnded"},
--		SetGlobalFlagTrue{Name = "PleaseEnableMainQuestDialog_9010"},
--		QuestBegin {QuestId = 826, SubQuestActivate = FALSE}, --Q Hokans Auftrag
--		QuestBegin {QuestId = 829, SubQuestActivate = FALSE}, --Q  Das Geheimnis des Tempels
--		QuestBegin {QuestId = 830, SubQuestActivate = FALSE}, --Q  Hokans Plan
--		SetGlobalFlagTrue {Name = "g_P202HokanAnfangSpawnInit"}
--	}
--}
-----------------------------------------------------
-- Cutscenes:
dofile("script/p202/n32260_CutsceneHokanStart.lua")
dofile("script/p202/n32261_CutsceneMassenSpawn.lua")
dofile("script/p202/n32262_CutsceneHokanEnde.lua")

dofile("script/P202/n0_ItemScript.lua")
dofile("script/P202/n0_Effects.lua")

dofile("script/Hadeko.lua")

-----------------------------------------------------
-----------------------------------------------------
--Oststadt (Hauptquestbereich)
----------------------------------------------------

--Umspawn Avatar für CS Begin
--OnOneTimeEvent
--{
--	NotInDialog = FALSE , UpdateInterval = 10 ,
--	Conditions = 
--	{
--		IsGlobalFlagTrue {Name = "g_P202AvatarUmspawnBegin", UpdateInterval = 2},
--	},
--	Actions = 
--	{
--		TeleportAvatar{X = 368, Y = 415},
--	}
--}


--OC, wenn Spieler in die Nähe des Pentagramms kommt
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
	ODER
		(
		FigureInRange {X = 433, Y = 323, NpcId = self, Range = 5},
		FigureInRange {X = 305, Y = 331, NpcId = self, Range = 5}
		)
	},
	Actions = 
	{
		Outcry{NpcId = 9010, String = "Achtet auf das Pentagramm! Es spielt eine Rolle in dem Rätsel!" , Tag = "oca2maskedP202_001" , Delay = TRUE , Color = ColorWhite}
	}
}



--GroundWaveEffekte Spawnecken setzen
OnOneTimeEvent
{
	Conditions = {},
	Actions = 
	{ 
	SetEffect{Effect = "GroundWave", X = 323, Y = 193, Length = 0 , TargetType = World}, --Screamer
	SetEffect{Effect = "GroundWave", X = 295, Y = 278, Length = 0 , TargetType = World}, --Spectre
	SetEffect{Effect = "GroundWave", X = 373, Y = 337, Length = 0 , TargetType = World}, --Succubus
	SetEffect{Effect = "GroundWave", X = 447, Y = 280, Length = 0 , TargetType = World}, --Ghouls
	SetEffect{Effect = "GroundWave", X = 419, Y = 191, Length = 0 , TargetType = World}, -- Skelette
	
	SetEffect{Effect = "FogForever", X = 377, Y = 258, Length = 0 , TargetType = World}, --Grabmal
	
	--Effekte um Opferstätten
	SetEffect{Effect = "FogForever", X = 318, Y = 188, Length = 0 , TargetType = World}, --Screamer
	SetEffect{Effect = "FogForever", X = 289, Y = 279, Length = 0 , TargetType = World}, --Spectre
	SetEffect{Effect = "FogForever", X = 373, Y = 343, Length = 0 , TargetType = World}, --Succubus
	SetEffect{Effect = "FogForever", X = 453, Y = 281, Length = 0 , TargetType = World}, --Ghouls
	SetEffect{Effect = "FogForever", X = 423, Y = 185, Length = 0 , TargetType = World}, -- Skelette
	}
}


--OC, wenn Wächter tot ist
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagFalse{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 20},
		FigureDead {NpcId = 9038},
	},
	Actions = 
	{ 
		--Outcry {NpcId = 9080, String = "Der Dunkle ist erschlagen! Wehe, der Wächter ist besiegt!" , Tag = "oca2strangevoicesP202_001" , Delay = TRUE , Color = ColorWhite},
		Outcry {NpcId = 9080, String = "Beschwörer, tut Euer Werk! Ruft einen neuen Wächter, ruft einen Fial Darg!" , Tag = "oca2strangevoicesP202_001" , Delay = TRUE , Color = ColorWhite}
	}
}
	

	
-- Spawnen eines neuen Wächters (Fial Darg), wenn alle 5 Gegner in der Mitte

OnEvent
{
	Conditions =
	{
		
		FigureDead {NpcId = 9038},
		IsGlobalFlagTrue {Name = "g_P202GhoulInMitte", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P202SuccubusInMitte", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P202SpectreInMitte", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P202SkelettInMitte", UpdateInterval = 10},
		IsGlobalFlagTrue {Name = "g_P202ScreamerInMitte", UpdateInterval = 10},
		IsGlobalFlagFalse {Name = "g_P202Spawnpunktebesetzt"}
	},
	Actions = 
	{
		SetGlobalFlagFalse {Name = "g_P202GhoulInMitte"},
		SetGlobalFlagFalse {Name = "g_P202SuccubusInMitte"},
		SetGlobalFlagFalse {Name = "g_P202SpectreInMitte"},
		SetGlobalFlagFalse {Name = "g_P202SkelettInMitte"},
		SetGlobalFlagFalse {Name = "g_P202ScreamerInMitte"},
		
		CastSpell {Spell = 1556, TargetType = Figure, Target = 9040, NpcId = 9040, X = 0, Y = 0},
		CastSpell {Spell = 1556, TargetType = Figure, Target = 9048, NpcId = 9048, X = 0, Y = 0},
		CastSpell {Spell = 1556, TargetType = Figure, Target = 9056, NpcId = 9056, X = 0, Y = 0},
		CastSpell {Spell = 1556, TargetType = Figure, Target = 9064, NpcId = 9064, X = 0, Y = 0},
		CastSpell {Spell = 1556, TargetType = Figure, Target = 9072, NpcId = 9072, X = 0, Y = 0},
		
		SetGlobalFlagTrue {Name = "g_P202FialDargSpawn"},
		
	},
}


--Besetzen der Spawnpunkte:

-- wenn Punkte jeweils einzeln besetzt, Effekt aus, Spawning aus an dem Punkt

--Punkt1
-- Succubus
OnToggleEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	OnConditions = 
	{ 
		ODER9
		{ 
		PlayerUnitInRange {X = 373, Y = 343, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10},
		PlayerUnitInRange {X = 373, Y = 343, FigureType = FigureHero, Range = 5, UpdateInterval = 10}
		}
	},
	OnActions = 
	{  
		SetGlobalFlagTrue {Name = "g_P202Punkt1Besetzt"},
		StopEffect{X = 373, Y = 337, TargetType = World},
		SetEffect{Effect = "AreaHit", X = 373, Y = 337, Length = 3000},
		SetEffect{Effect = "Lightning", X = 373, Y = 337, Length = 3500},
		Outcry{NpcId = 9010, String = "Ja! Gut! Die Lebenskraft eines Helden verhindert, dass sie dort erscheinen können!" , Tag = "oca2maskedP202_002" , Delay = TRUE , Color = ColorWhite}
	},
	OffConditions = 
	{  
		Negated(PlayerUnitInRange {X = 373, Y = 343, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10}),
		Negated(PlayerUnitInRange {X = 373, Y = 343, FigureType = FigureHero, Range = 5, UpdateInterval = 10})
	},
	OffActions = 
	{  
		SetGlobalFlagFalse {Name = "g_P202Punkt1Besetzt"},
		SetEffect{Effect = "GroundWave", X = 373, Y = 337, Length = 0 , TargetType = World},
	},
}

--Punkt2
--Spectres
OnToggleEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	OnConditions = 
	{  
		ODER9
		{
		PlayerUnitInRange {X = 289, Y = 279, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10},
		PlayerUnitInRange {X = 289, Y = 279, FigureType = FigureHero, Range = 5, UpdateInterval = 10}
		}
	},
	OnActions = 
	{  
		SetGlobalFlagTrue {Name = "g_P202Punkt2Besetzt"},
		StopEffect{X = 295, Y = 278, TargetType = World},
		SetEffect{Effect = "AreaHit", X = 295, Y = 278, Length = 3000},
		SetEffect{Effect = "Lightning", X = 295, Y = 278, Length = 3500},
		Outcry{NpcId = 9010, String = "Ja! Gut! Die Lebenskraft eines Helden verhindert, dass sie dort erscheinen können!" , Tag = "oca2maskedP202_002" , Delay = TRUE , Color = ColorWhite}
	},
	OffConditions = 
	{  
		Negated(PlayerUnitInRange {X = 289, Y = 279, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10}),
		Negated(PlayerUnitInRange {X = 289, Y = 279, FigureType = FigureHero, Range = 5, UpdateInterval = 10})
	},
	OffActions = 
	{  
		SetGlobalFlagFalse {Name = "g_P202Punkt2Besetzt"},
		SetEffect{Effect = "GroundWave", X = 295, Y = 278, Length = 0 , TargetType = World},
	},
}

--Punkt3
--Screamer
OnToggleEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	OnConditions = 
	{ 
		ODER9
		{ 
		PlayerUnitInRange {X = 318, Y = 188, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10},
		PlayerUnitInRange {X = 318, Y = 188, FigureType = FigureHero, Range = 5, UpdateInterval = 10}
		}
	},
	OnActions = 
	{  
		SetGlobalFlagTrue {Name = "g_P202Punkt3Besetzt"},
		StopEffect{ X = 323, Y = 193, TargetType = World},
		SetEffect{Effect = "AreaHit", X = 323, Y = 193, Length = 3000},
		SetEffect{Effect = "Lightning", X = 323, Y = 193, Length = 3500},
		Outcry{NpcId = 9010, String = "Ja! Gut! Die Lebenskraft eines Helden verhindert, dass sie dort erscheinen können!" , Tag = "oca2maskedP202_002" , Delay = TRUE , Color = ColorWhite}
	},
	OffConditions = 
	{  
		Negated(PlayerUnitInRange { X = 318, Y = 188, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10}),
		Negated(PlayerUnitInRange { X = 318, Y = 188, FigureType = FigureHero, Range = 5, UpdateInterval = 10})
	},
	OffActions = 
	{  
		SetGlobalFlagFalse {Name = "g_P202Punkt3Besetzt"},
		SetEffect{Effect = "GroundWave", X = 323, Y = 193, Length = 0, TargetType = World},
		
	},
}

--Punkt4
--Skelette
OnToggleEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	OnConditions = 
	{  
		ODER9
		{
		PlayerUnitInRange { X = 423, Y = 185, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10},
		PlayerUnitInRange { X = 423, Y = 185, FigureType = FigureHero, Range = 5, UpdateInterval = 10}
		}
	},
	OnActions = 
	{  
		SetGlobalFlagTrue {Name = "g_P202Punkt4Besetzt"},
		StopEffect{X = 419, Y = 191, TargetType = World},
		SetEffect{Effect = "AreaHit", X = 419, Y = 191, Length = 3000},
		SetEffect{Effect = "Lightning", X = 419, Y = 191, Length = 3500},
		Outcry{NpcId = 9010, String = "Ja! Gut! Die Lebenskraft eines Helden verhindert, dass sie dort erscheinen können!" , Tag = "oca2maskedP202_002" , Delay = TRUE , Color = ColorWhite}
	},
	OffConditions = 
	{  
		Negated(PlayerUnitInRange {X = 423, Y = 185, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10}),
		Negated(PlayerUnitInRange {X = 423, Y = 185, FigureType = FigureHero, Range = 5, UpdateInterval = 10})
	},
	OffActions = 
	{  
		SetGlobalFlagFalse {Name = "g_P202Punkt4Besetzt"},
		SetEffect{Effect = "GroundWave", X = 419, Y = 191, Length = 0, TargetType = World},
		
	},
}

--Punkt5
--Ghouls
OnToggleEvent
{
	NotInDialog = FALSE , UpdateInterval = 20,
	OnConditions = 
	{  
		ODER9
		{
		PlayerUnitInRange { X = 453, Y = 281, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10},
		PlayerUnitInRange { X = 453, Y = 281, FigureType = FigureHero, Range = 5, UpdateInterval = 10}
		}
	},
	OnActions = 
	{  
		SetGlobalFlagTrue {Name = "g_P202Punkt5Besetzt"},
		StopEffect{X = 447, Y = 280, TargetType = World},
		SetEffect{Effect = "AreaHit", X = 447, Y = 280, Length = 3000},
		SetEffect{Effect = "Lightning", X = 447, Y = 280, Length = 3500},
		Outcry{NpcId = 9010, String = "Ja! Gut! Die Lebenskraft eines Helden verhindert, dass sie dort erscheinen können!" , Tag = "oca2maskedP202_002" , Delay = TRUE , Color = ColorWhite}
	},
	OffConditions = 
	{  
		Negated(PlayerUnitInRange { X = 453, Y = 281, FigureType = FigureAvatar, Range = 5, UpdateInterval = 10}),
		Negated(PlayerUnitInRange { X = 453, Y = 281, FigureType = FigureHero, Range = 5, UpdateInterval = 10})
	},
	OffActions = 
	{  
		SetGlobalFlagFalse {Name = "g_P202Punkt5Besetzt"},
		SetEffect{Effect = "GroundWave", X = 447, Y = 280, Length = 0 , TargetType = World},
	},
}



--wenn alle Punkte besetzt, Grabmal auf
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202Punkt1Besetzt", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P202Punkt2Besetzt", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P202Punkt3Besetzt", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P202Punkt4Besetzt", UpdateInterval = 20},
		IsGlobalFlagTrue {Name = "g_P202Punkt5Besetzt", UpdateInterval = 20},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "g_P202Spawnpunktebesetzt"}, --Tor öffnet sich
		SetRewardFlagTrue {Name = "GrabmalGeoeffnet"},
	},
}

--------------------------------------------------------------------
-----------------------------------------------------------------
--FÜR PATCH	
--message, wenn alle Punkte besetzt und Fial darg noch am leben: Nimm das Schattenschwert

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 20},
		FigureAlive {NpcId = 9038},
	},
	Actions = 
	{
		Outcry{NpcId = 11740, String = "Nehmt das Schattenschwert in die Hand, um den Fial Darg zu besiegen!", Tag = "gurim_001", Delay = TRUE, Color = ColorWhite},
	},
}

----------------------------------------------------------------------
--message, wenn avatar in der nähe des fial darg
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 20,
	Conditions = 
	{
		FigureInRangeNpc {TargetNpcId = 9038, NpcId = Avatar, Range = 8, UpdateInterval = 20},
		FigureAlive {NpcId = 9038},
	},
	Actions = 
	{
		Outcry{NpcId = 11740, String = "Nehmt das Schattenschwert in die Hand, um den Fial Darg zu besiegen!", Tag = "gurim_001", Delay = TRUE, Color = ColorWhite},
	},
}

-------------------------------------------------------------------------
-------------------------------------------------------------------------

-- wenn Rätsel gelöst, Fial Darg tot, Grab offen
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 20},
		FigureDead {NpcId = 9038}
	},
	Actions = 
	{
		Outcry {NpcId = 9010, String = "Ihr habt die Wächter gebannt! Holt nun die Urne aus dem Grab!", Tag = "oca2maskedP202_003", Delay = TRUE, Color = ColorWhite}
	}
}


--------------------------------------------------------------
--Massenspawn + GegnerWelle nach öffnen des Grabmals
--Init für CS MassenSpawn
OnOneTimeEvent
{
	Conditions = 
	{ 
		PlayerHasItem {ItemId = 4633, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 20},
	},
	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "gt_P202SpawnwellenTimer"}
	}
}



--------------------------------------------------------------
---------------------------------------------------------------
--Je nach Stufe des Avatars werden Loot-Kisten zur Verfügung gestellt.
OnOneTimeEvent
{
	Conditions = 
	{ 
		AvatarLevel {Level = 28, Player = self, UpdateInterval = 60},
	},
	Actions = 
	{ 
		RemoveObject {X = 338, Y = 312, Object = 3043},
		RemoveObject {X = 421, Y = 349, Object = 3042},
		RemoveObject {X = 271, Y = 343, Object = 3041},
	}
}


--------------------------------------------------------------
--------------------------------------------------------------
--Questmanagement außerhalb der CS / Dialoge


--Heldenbeschwören (Fünf Gehilfen)
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsMonumentInUse {X = 434, Y = 341, Range = 3, UpdateInterval = 20},
		
	},
	Actions = 
	{ 
		SetRewardFlagTrue {Name = "HeldenBeschworen"},
		QuestSolve {QuestId = 827, ActivateNextQuest = FALSE},--Q beschwöre helden
	}
}

--Die Punkte besetzt (Wächterquest)
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202Spawnpunktebesetzt", UpdateInterval = 20}, 
	},
	Actions = 
	{ 
		
		QuestSolve {QuestId = 828, ActivateNextQuest = FALSE}, --Die Wächter des Grabmals
	}
}

-------------------------------
--Seelenquest
------------------------------
--Seelenquest begin gesamt
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P202SeelenGesamtQuestBeginnt", UpdateInterval = 20}
	},
	Actions = 
	{ 
		QuestBegin {QuestId = 928, SubQuestActivate = FALSE} --Seelenquest gesamt
	}
}




--Seelenquest solve gesamt
OnOneTimeEvent
{
	Conditions = 
	{ 
		QuestState {QuestId = 929, State = StateSolved, UpdateInterval = 20},
		QuestState {QuestId = 930, State = StateSolved, UpdateInterval = 20},
		QuestState {QuestId = 931, State = StateSolved, UpdateInterval = 20},
		QuestState {QuestId = 932, State = StateSolved, UpdateInterval = 20},
		QuestState {QuestId = 933, State = StateSolved, UpdateInterval = 20},
	},
	Actions = 
	{ 
		
		QuestSolve {QuestId = 928, ActivateNextQuest = FALSE }, --Seelenquest
	}
}




------------------------------------------------------------------------------------
-- XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
------------------------------------------------------------------------------------
--Weststadt (Nebenquestbereich)
-----------------------------------------------------------------------------------
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX




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
		SetEffect{Effect = "FogForever", X = 29, Y = 290, Length = 0, TargetType = World},
		ChangeObject {X = 28, Y = 290, Object = 809}
	}
}
-----------------------------------
--wenn Samen gepflanzt
--Spawning Dämonen Ende
--Quest solved

OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202SoulcityBaumWirdKlein", UpdateInterval = 20},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P202SoulcityDämonenSpawnStopHlStätte"},
		QuestSolve {QuestId = 844, ActivateNextQuest = FALSE}, --hl Stätte CoS
		QuestBegin {QuestId = 1056}, --zurück zur Dryade2
		SetRewardFlagTrue {Name = "HlStaetteBaumGepflanzt"},
	}
}

--Baum wächst nach Lösen der Quest
-- nach 2 Sekunden: kleiner Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202SoulcityBaumWirdKlein", UpdateInterval = 20},
		IsGlobalTimeElapsed {Name = "gt_P202SoulcityBaumwuchsTimer", Seconds = 2, UpdateInterval = 20},
	},
	Actions = 
	{ 
		SetEffect{Effect = "OccludeWhite", X = 28, Y = 290, Length = 3000, TargetType = World},
		ChangeObject {X = 28, Y = 290, Object = 3112},
		SetGlobalFlagTrue{Name = "g_P202SoulcityBaumWirdMittel"},
		
		StopEffect {X = 29, Y = 290, TargetType = World}, --nebel aus
		PlaySound{Sound = SoundSacredFreedom},
	}
}


--nach 5 Minuten: mittlerer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P202SoulcityBaumwuchsTimer", Seconds = 300, UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "g_P202SoulcityBaumWirdMittel", UpdateInterval = 20}
	},
	Actions = 
	{ 
		SetEffect{Effect = "OccludeWhite", X = 28, Y = 290, Length = 3000, TargetType = World},
		ChangeObject {X = 28, Y = 290, Object = 3111},
		SetGlobalFlagTrue{Name = "g_P202SoulcityBaumWirdGross"}
	}
}


--nach 15 Minuten: großer Baum
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P202SoulcityBaumwuchsTimer", Seconds = 900, UpdateInterval = 20},
		IsGlobalFlagTrue{Name = "g_P202SoulcityBaumWirdGross", UpdateInterval = 20}
	},
	Actions = 
	{ 
		ChangeObject {X = 28, Y = 290, Object = 3110},
		SetEffect{Effect = "OccludeWhite", X = 28, Y = 290, Length = 3000, TargetType = World}
	}
}

----------------------------------------------------------------------
---------------------------------------------------------------------
--heilge Quelle Quest
-----------------------------------------------------------------------
--WassertransportQuest Q 845
----------------------------------------------------------------------
--von der ranke zum baumstumpf
OnOneTimeEvent
{
	Conditions = {},
	Actions = 
	{ 
		ChangeObject {X = 27, Y = 266, Object = 809},
	}
}


-- Questbegin, wenn in Range des Brunnenstadtteils
OnOneTimeEvent
{
	Conditions = 
	{ 
	ODER
	(
		FigureInRange {X = 99, Y = 186, NpcId = self, Range = 4},
		FigureInRange {X = 99, Y = 244, NpcId = self, Range = 3}
	)
	},
	Actions = 
	{ 
		QuestBegin {QuestId = 845, SubQuestActivate = FALSE},
		QuestBegin {QuestId = 1050, SubQuestActivate = FALSE}
	}
}


--wenn Wasserbehälter genommen, Timer los
OnEvent
{
	Conditions = 
	{ 
		
		PlayerHasItem {ItemId = 7067, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 20},
		IsGlobalFlagFalse {Name = "g_P202RankeGegossen", UpdateInterval = 30},
		IsGlobalFlagFalse {Name = "g_P202WasserTimerAn", UpdateInterval = 30}
	},
	Actions = 
	{ 
		SetGlobalTimeStamp {Name = "gt_P202WassertransportTimer"},
		SetGlobalFlagTrue {Name = "g_P202WasserTimerAn"},
		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10994_P202", NpcVariable, TRUE),
		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10995_P202", NpcVariable, TRUE),
		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10996_P202", NpcVariable, TRUE),
		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10997_P202", NpcVariable, TRUE),
		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10998_P202", NpcVariable, TRUE),
	}
}


----wenn erste Runde rum, RespawnFlags true
--OnEvent
--{
--	Conditions = 
--	{ 
--		
--		PlayerHasItem {ItemId = 7067, Amount = 1, Equipment = EquipmentAll, UpdateInterval = 10},
--		IsGlobalFlagFalse {Name = "g_P202RankeGegossen", UpdateInterval = 10},
--		IsGlobalFlagTrue {Name = "g_P202WasserQuestErsteRundeVorbei"},
--		IsGlobalFlagFalse {Name = "g_P202WasserTimerAn", UpdateInterval = 10}
--	},
--	Actions = 
--	{ 
--		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10994_P202", NpcVariable, TRUE),
--		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10995_P202", NpcVariable, TRUE),
--		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10996_P202", NpcVariable, TRUE),
--		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10997_P202", NpcVariable, TRUE),
--		CGdsDbVariableSet:new("nfRespawnBodenrankenWaechter_Npc10998_P202", NpcVariable, TRUE),
--		SetGlobalFlagFalse {Name = "g_P202WasserQuestErsteRundeVorbei"},
--		
--
--	}
--}
--

--wenn Spieler zu langsam, Wasser weg und alles von vorne
OnEvent
{
	Conditions = 
	{ 
		IsGlobalTimeElapsed {Name = "gt_P202WassertransportTimer", Seconds = 120, UpdateInterval = 10},
	},
	Actions = 
	{ 
		Outcry {NpcId = 11740, String = "Das heilige Wasser aus Eurem Behälter ist vollständig verdunstet!", Tag = "oca2noteP202_001" , Delay = TRUE , Color = ColorWhite},
		TransferItem {TakeItem = 7067, GiveItem = 0, Amount = 1, Flag = Take}, --Schale wasser weg
		TransferItem {TakeItem = 0, GiveItem = 7341, Amount = 1, Flag = Give}, --Schale Dryade her
		SetGlobalFlagFalse {Name = "g_P202WasserTimerAn"},
		ClearGlobalTimeStamp {Name = "gt_P202WassertransportTimer"},
	}
}

--Ranke gegossen, 
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue {Name = "g_P202RankeGegossen", UpdateInterval = 20},
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 845, ActivateNextQuest = FALSE},
		SetRewardFlagTrue {Name = "TorZurStaetteOffen"},
		ClearGlobalTimeStamp {Name = "gt_P202WassertransportTimer"},
	}
}




-- Questsolve, wenn medusen tot
OnOneTimeEvent
{
	Conditions = 
	{ 
		FigureDead {NpcId = 8823},
		FigureDead {NpcId = 8824},
		FigureDead {NpcId = 8825},
		FigureDead {NpcId = 8826}
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 1050, ActivateNextQuest = FALSE },
		QuestSolve {QuestId = 845, ActivateNextQuest = FALSE },
	}
}

----I----------------------------------------------------------I
----I                                                          I
----I                       Sidequest                          I
----I                      Hadeko-Spiel                        I
----I                                                          I   
----I----------------------------------------------------------I

OnPlatformOneTimeEvent
{
	Actions =
	{
		SetGlobalFlagTrue {Name = "g_P202_ResetHadekoGame"},
		ResetGlobalCounter{Name = "g_P202_HadekoCounter"},
	},
}

OnToggleEvent
{
	OnConditions = 
	{  
		IsGlobalFlagTrue {Name = "g_P202_ResetHadekoGame"},
	},	
	OnActions = 
	{  
		SetGlobalFlagTrue{Name = "g_P202_AllHadekoPuppetsDespawn"},
		SetGlobalFlagFalse{Name = "g_P212_PuppetsGetAngry"},
		SetGlobalFlagFalse{Name = "g_P212_EvilDoorkeeperInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilShadowInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilMentorInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilTricksterInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilHeroInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodDoorkeeperInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodShadowInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodMentorInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodTricksterInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodHeroInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_GoodArchmageInBattle"},
		SetGlobalFlagFalse{Name = "g_P212_EvilArchmageInBattle"},
		ResetGlobalCounter{Name = "g_P202_HadekoRundenZaehler"},
		SetGlobalFlagFalse{Name ="g_P202_HadekoEndgameOn"},
		SetGlobalFlagFalse{Name = "g_P212_GoodHeroWasUsed"},
		SetGlobalFlagFalse{Name = "g_P212_EvilHeroWasUsed"},
		SetGlobalFlagFalse{ Name = "g_P212_EvilPuppetDead"},
		SetGlobalFlagFalse{ Name = "g_P212_GoodPuppetDead"},
		ResetGlobalCounter{Name = "g_P202_PuppetsDurchzaehlen"},
		CGdsDbVariableSet:new("nfToggleNum1_Npc10808_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10809_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10810_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10811_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10812_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10813_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10814_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10815_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10816_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10817_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10818_P202", NpcVariable, FALSE),
		CGdsDbVariableSet:new("nfToggleNum1_Npc10819_P202", NpcVariable, FALSE),
		SetGlobalFlagFalse{Name ="g_P202_HadekoGameOn"},
		SetNpcTimeStamp{Name ="npc_P202_SecurityTimestamp"},
		SetGlobalFlagFalse {Name = "g_P202_ResetHadekoGame"},
	},
	OffConditions = 
	{  
		IsGlobalFlagFalse {Name = "g_P202_ResetHadekoGame"},
		IsNpcTimeElapsed{Name ="npc_P202_SecurityTimestamp", Seconds = 10},
		
	},
	OffActions = 
	{  
		ClearNpcTimeStamp{Name ="npc_P202_SecurityTimestamp"},
		SetGlobalFlagFalse{ Name = "g_P212_EvilPuppetDead"},
		SetGlobalFlagFalse{ Name = "g_P212_GoodPuppetDead"},
		SetGlobalFlagFalse{Name = "g_P202_AllHadekoPuppetsDespawn"},
	},
}


--OnOneTimeEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 995, State = StateActive }, -- Quest: Finde den Helden
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoHero"},
--	},
--	Actions =
--	{
--		QuestSolve {QuestId = 995},
--	},
--}
--
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 996, State = StateActive }, -- Quest: Finde den Trickster
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoTrickster"},
--	},
--	Actions =
--	{
--		QuestSolve {QuestId = 996},
--	},
--}
--
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 997, State = StateActive }, -- Quest: Finde den Mentor
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoMentor"},
--	},
--	Actions =
--	{
--		QuestSolve {QuestId = 997},
--	},
--}
--
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 998, State = StateActive }, -- Quest: Finde den Torwächter
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoDoorkeeper"},
--	},
--	Actions =
--	{
--		QuestSolve {QuestId = 998},
--	},
--}
--
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 999, State = StateActive }, -- Quest: Finde den Schatten
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoShadow"},
--	},
--	Actions =
--	{
--		QuestSolve {QuestId = 999},
--	},
--}
--
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 1000, State = StateActive }, -- Quest: Finde den Erzmagier
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoArchmage"},
--	},
--	Actions =
--	{
--		QuestSolve {QuestId = 1000},
--	},
--}
--
--OnOneTimeEvent
--{
--	Conditions =
--	{
--		QuestState{QuestId = 994, State = StateActive }, -- Quest: Sammle alle Hadeko-Puppen
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoTrickster"},
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoArchmage"},
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoHero"},
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoDoorkeeper"},
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoShadow"},
--		IsItemFlagTrue {Name = "PlayerHasItemHadekoMentor"},
--	},
--	Actions =
--	{
--		QuestSolve {QuestId = 994},
--	},
--}


---------------------------------------------------------------
--WachgeistQuest (in scripten 11005 und 11006 gescriptet, Wachgeist und Opfer)
---------------------------------------------------------------
--Todesabfragen im n0

--wenn Opfer tot
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202_OptionOpferTöten", UpdateInterval = 20},
		FigureDead {NpcId = 11006}
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P202OpferTot"}
	}
}


--wenn Wachgeist tot, Tor auf zum nächsten Abschnitt
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202WachgeistVerwandelt", UpdateInterval = 10},
		FigureDead {NpcId = 11005}
	},
	Actions = 
	{ 
		SetGlobalFlagTrue {Name = "g_P202WachgeistTorAuf"},
		SetRewardFlagTrue {Name = "WachgeistTot"}
	}
}

--Questsolve nach Wachgeist-Tod, wenn Opfer tot
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202_OptionOpferTöten", UpdateInterval = 20},
		FigureDead {NpcId = 11005}
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 1048},
		QuestSolve {QuestId = 1047},
		SetRewardFlagTrue {Name = "OpferTot"}
	}
}

--Questsolve nach Wachgeist-Tod,wenn Opfer befreit
OnOneTimeEvent
{
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "g_P202_OptionOpferBefreien", UpdateInterval = 20},
		FigureDead {NpcId = 11005}
	},
	Actions = 
	{ 
		QuestSolve {QuestId = 1049},
		QuestSolve {QuestId = 1047},
		SetRewardFlagTrue {Name = "OpferFreigelassen"},
	}
}




-------------------------------------------------------------
-------------------------------------------------------------
-- Wächter- / GargoyleUhr Quest
-------------------------------------------------------------

--Flags für ToggleEvents mit Effekten in Npc Scripten

-- Schale Nord NpcId 8810, Wächter NpcId 8824
-- 0h bis 24h, 8h bis 9h, 16h bis 17h
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
	ODER9
	{
		TimeOfDay {Hour = 0, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 8, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 16, Minute = 0, TimeFrame = 2, UpdateInterval = 20}
	}
	
	},
	Actions = 
	{
		HoldPosition {NpcId = 11824},
		LookAtDirection {Direction = 6, NpcId = 11824},
		--StopEffect{TargetType = Object, NpcId = 8810},
		--StopEffect{TargetType = Figure, NpcId = 8824},
		--SetGlobalFlagTrue {Name = "g_P202KristallEffekt1Aus"},
		SetGlobalFlagTrue {Name = "g_P202SonnenUhrSchatten1"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten2"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten3"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten4"}
	}
}

-- Zwischenstück, keine Schale
-- 1h bis 2h, 9h bis 10h, 17h bis 18h
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
	ODER9
	{
		TimeOfDay {Hour = 1, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 9, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 17, Minute = 0, TimeFrame = 2, UpdateInterval = 20}
	}
	},
	Actions = 
	{
		HoldPosition {NpcId = 11824},
		LookAtDirection {Direction = 7, NpcId = 11824},
		--SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Object, NpcId = 8810},
		--SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Figure, NpcId = 8824},
		--SetGlobalFlagFalse {Name = "g_P202KristallEffekt1Aus"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten1"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten2"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten3"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten4"}
	}
}

-- Schale Ost NpcId 8809, Wächter NpcId 8823
-- 2h bis 3h ,10h bis 11h, 18h bis 19h
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
	ODER9
	{
		TimeOfDay {Hour = 2, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 10, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 18, Minute = 0, TimeFrame = 2, UpdateInterval = 20}
	}
	
	},
	Actions = 
	{
		HoldPosition {NpcId = 11824},
		LookAtDirection {Direction = 0, NpcId = 11824},
		--StopEffect{TargetType = Object, NpcId = 8809},
		--StopEffect{TargetType = Figure, NpcId = 8823},
		--SetGlobalFlagTrue {Name = "g_P202KristallEffekt2Aus"},
		SetGlobalFlagTrue {Name = "g_P202SonnenUhrSchatten2"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten1"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten3"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten4"}
	}
}

-- Zwischenstück, keine Schale
-- 3h bis 4 h, 11h bis 12h, 19h bis 20h
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
	ODER9
	{
		TimeOfDay {Hour = 3, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 11, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 19, Minute = 0, TimeFrame = 2, UpdateInterval = 20}
	}
	},
	Actions = 
	{
		HoldPosition {NpcId = 11824},
		LookAtDirection {Direction = 1, NpcId = 11824},
		--SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Object, NpcId = 8809},
		--SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Figure, NpcId = 8823},
		--SetGlobalFlagFalse {Name = "g_P202KristallEffekt2Aus"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten1"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten2"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten3"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten4"}
	}
}

-- Schale Süd NpcId 8812, Wächter NpcId 8826
-- 4h bis 5h, 12h bis 13h, 20h bis 21h
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
	ODER9
	{
		TimeOfDay {Hour = 4, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 12, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 20, Minute = 0, TimeFrame = 2, UpdateInterval = 20}
	}

	},
	Actions = 
	{
		HoldPosition {NpcId = 11824},
		LookAtDirection {Direction = 2, NpcId = 11824},
		--StopEffect{TargetType = Object, NpcId = 8812},
		--StopEffect{TargetType = Figure, NpcId = 8826},
		--SetGlobalFlagTrue {Name = "g_P202KristallEffekt3Aus"},
		SetGlobalFlagTrue {Name = "g_P202SonnenUhrSchatten3"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten2"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten1"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten4"}
	}
}

-- Zwischenstück, keine Schale
-- 5h bis 6h, 13h bis 14h, 21h bis 22h
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
	ODER9
	{
		TimeOfDay {Hour = 5, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 13, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 21, Minute = 0, TimeFrame = 2, UpdateInterval = 20}
	}
	},
	Actions = 
	{
		HoldPosition {NpcId = 11824},
		LookAtDirection {Direction = 3, NpcId = 11824},
		--SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Object, NpcId = 8812},
		--SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Figure, NpcId = 8826},
		--SetGlobalFlagFalse {Name = "g_P202KristallEffekt3Aus"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten3"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten2"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten1"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten4"}
	}
}

-- Schale West NpcId 8811, Wächter NpcId 8825
-- 6h bis 7h, 14h bis 15h, 22h bis 23h
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
	ODER9
	{
		TimeOfDay {Hour = 6, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 14, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 22, Minute = 0, TimeFrame = 2, UpdateInterval = 20}
	}
	
	},
	Actions = 
	{
		HoldPosition {NpcId = 11824},
		LookAtDirection {Direction = 4, NpcId = 11824},
		--StopEffect{TargetType = Object, NpcId = 8811},
		--StopEffect{TargetType = Figure, NpcId = 8825},
		--SetGlobalFlagTrue {Name = "g_P202KristallEffekt4Aus"},
		SetGlobalFlagTrue {Name = "g_P202SonnenUhrSchatten4"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten1"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten2"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten3"}
		
	}
}

-- Zwischenstück, keine Schale
-- 7h bis 8h, 15h bis 16h, 23h bis 0h
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
	ODER9
	{
		TimeOfDay {Hour = 7, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 15, Minute = 0, TimeFrame = 2, UpdateInterval = 20},
		TimeOfDay {Hour = 23, Minute = 0, TimeFrame = 2, UpdateInterval = 20}
	}
	},
	Actions = 
	{
		HoldPosition {NpcId = 11824},
		LookAtDirection {Direction = 5, NpcId = 11824},
		--SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Object, NpcId = 8811},
		--SetEffect{Effect = "GlowingTube", Length = 0, TargetType = Figure, NpcId = 8825},
		--SetGlobalFlagFalse {Name = "g_P202KristallEffekt4Aus"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten4"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten2"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten3"},
		SetGlobalFlagFalse {Name = "g_P202SonnenUhrSchatten1"}
	}
}

------------------------------------------------------------------------
-------------------------------------------------------------------------
--Gnomlinge
---------------------------------------------------------------------------

--erster Gnomling sofort am Leben
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = {},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "P202GnomlingSpawn01"}
	}
}

---------------------------------------------------------------------------
--------------------------------------------------------------------------
--Aschetänzer 
----------------------------------------------------------------------------
--Flag, wenn alle Aschetänzer1 HelferSkelette Low tot sind
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		FigureDead {NpcId = 11301},
		FigureDead {NpcId = 11302},
		FigureDead {NpcId = 11303},
		FigureDead {NpcId = 11304},
		FigureDead {NpcId = 11305},
		FigureDead {NpcId = 11306},
		IsGlobalFlagTrue {Name = "P202Aschetaenzer1Umspawn75", UpdateInterval = 10}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "P202Aschetaenzer1Monster75Tot"}
	}
}


--Flag, wenn alle Aschetänzer1 HelferSkelette High tot sind

OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		FigureDead {NpcId = 11307},
		FigureDead {NpcId = 11308},
		FigureDead {NpcId = 11309},
		FigureDead {NpcId = 11310},
		FigureDead {NpcId = 11311},
		FigureDead {NpcId = 11312},
		FigureDead {NpcId = 11313},
		FigureDead {NpcId = 11314},
		IsGlobalFlagTrue {Name = "P202Aschetaenzer1Umspawn50", UpdateInterval = 10}
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "P202Aschetaenzer1Monster50Tot"}
	}
}


--Timer für Skelettspawning, wenn Avatar / Helden in der Nähe
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		FigureInRange {X = 109, Y = 265, NpcId = 0, Range = 5},
		IsGlobalFlagTrue {Name = "P202Aschetaenzer2Gespawnt", UpdateInterval = 30},
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "gt_P202Aschetaenzer2SkelettTimer"}
	}
}


--Tor auf zum nächsten Bereich, wenn  alle 3 Aschetänzer tot
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		FigureDead {NpcId = 11300},
		FigureDead {NpcId = 11315},
		FigureDead {NpcId = 11316},
		
		IsGlobalFlagTrue {Name = "P202Aschetaenzer2Gespawnt", UpdateInterval = 10},
	},
	Actions = 
	{
		SetRewardFlagTrue {Name = "AschetaenzerTot"}
	}
}

-----------------------------------------------
--RewardFlag, wenn exctinct Türme weg
---------------------------------------------------
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		Negated (BuildingInRange { X = 160, Y = 156, Range = 2, Owner = OwnerNpc, BuildingId = 0, UpdateInterval = 30}),
		Negated (BuildingInRange { X = 183, Y = 152, Range = 2, Owner = OwnerNpc, BuildingId = 0, UpdateInterval = 30}),
		Negated (BuildingInRange { X = 168, Y = 168, Range = 2, Owner = OwnerNpc, BuildingId = 0, UpdateInterval = 30})
	},
	Actions = 
	{
		SetRewardFlagTrue {Name = "ExtinctTuermeWeg"},
	}
}

-----------------------------------------------
--RewardFlag, wenn Gargoyle tot
---------------------------------------------------
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		FigureDead {NpcId = 8801},
		FigureDead {NpcId = 8802},
		FigureDead {NpcId = 8803},
		FigureDead {NpcId = 8804},
		FigureDead {NpcId = 8805},
		FigureDead {NpcId = 8806},
		FigureDead {NpcId = 8807},
		FigureDead {NpcId = 8808}
	},
	Actions = 
	{
		SetRewardFlagTrue {Name = "ResistenteGargoyle1Tot"}
	}
}
--------------------------------
--gargoyle explode flag, wenn Spieler auf anderer Seite des Tors
OnOneTimeEvent
{
	NotInDialog = FALSE , UpdateInterval = 10 ,
	Conditions = 
	{
		FigureInRange {X = 65, Y = 186, NpcId = 0, Range = 2},
		
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "P202GargoyleGetReadyToExplode"}
	}
}

----------------------------------------
--Endlosspawns
---------------------------------------
--an
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = {},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "g_P202Endlosspawn1An"},
		SetGlobalFlagTrue{Name = "g_P202Endlosspawn2An"}
	}
}

------------------------
--Screamer
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
			IsGlobalCounter {Name = "gc_P202CounterEndlosSpawn1", Value = 5, Operator = IsEqual, UpdateInterval = 30}
	},
	Actions  =
	{
		ResetGlobalCounter {Name = "gc_P202CounterEndlosSpawn1"},
		SetGlobalFlagTrue {Name = "gc_P202Counter1ResetTestFlag"},
	}
}
--------------------------

--Dämonen
OnEvent
{
	NotInDialog = FALSE,
	Conditions = 
	{
			IsGlobalCounter {Name = "gc_P202CounterEndlosSpawn2", Value = 5, Operator = IsEqual, UpdateInterval = 30}
	},
	Actions  =
	{
		ResetGlobalCounter {Name = "gc_P202CounterEndlosSpawn2"},
		SetGlobalFlagTrue {Name = "gc_P202Counter2ResetTestFlag"},
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

----------------------------------------------------------
--				Storyquest Part.
----------------------------------------------------------

---Überquest starten, wenn Schattenklinge
OnOneTimeEvent
{
	Conditions = 
	{ 
	IsGlobalFlagFalse{Name="g_nP201_PhoenixSteinSpieler"},
	},
	Actions = 
	{ 
	QuestBegin {QuestId = 1087},
	QuestBegin {QuestId = 1090},
	}
}

---Dryade töten, wenn Cutscene abgelaufen, bzw. Auftrag gelöst
OnOneTimeEvent
{
	Conditions = 
	{
	QuestState{QuestId = 1087, State = StateActive}, 
	IsGlobalFlagTrue{Name = "g_StoryQuestShadowGotoEmpyria"},
	},
	Actions = 
	{ 
	QuestSolve {QuestId = 1090},
	QuestBegin {QuestId = 1091},
	}
}

EndDefinition()
end
