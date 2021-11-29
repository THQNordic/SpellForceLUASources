function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p101/n0_ItemScript.lua")
dofile("script/p101/n0_Outcries.lua")

-- cutscene rename
--dofile("script/p101/n5537_CutsceneNewBeginning.lua")	
--dofile("script/p101/n5536_CutsceneSklavenlager.lua")
--dofile("script/p101/n5536_CutsceneRekrutierung.lua")
--dofile("script/p101/n5536_CutsceneHauptquartier.lua")
--dofile("script/p101/n5536_CutsceneGefaengnis.lua")	
--dofile("script/p101/n6743_CutsceneElfDiscovered.lua")

dofile("script/p101/n32001_CutsceneNewBeginning.lua")
dofile("script/p101/n32002_CutsceneElfDiscovered.lua")
dofile("script/p101/n32003_CutsceneHauptquartier.lua")
dofile("script/p101/n32004_CutsceneRekrutierung.lua")
dofile("script/p101/n32005_CutsceneSklavenlager.lua")
dofile("script/p101/n32006_CutsceneGefaengnis.lua")	

-----------------------------------------
--!!! Fake Spawning für Goblins nach Flüchtlingslager
-----------------------------------------
OnOneTimeEvent
{
	Conditions =
	{
		BuildingInRange {X = 137, Y = 115, Range = 5},
		--IsGlobalTimeElapsed {Name = "P101TimerGoblinSpawn", Seconds = 1},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "P101GoblinFakeSpawn"},
		SetEffect{Effect = "GroundWave", X = 140, Y = 116},
		SetEffect{Effect = "Campfire", X = 137, Y = 117}, --feuer
	}
}

OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		Negated(BuildingInRange {X = 137, Y = 115, Range = 5}),
	},
	Actions =
	{
		SetGlobalFlagFalse {Name = "P101GoblinFakeSpawn"},
		SetEffect{Effect = "Lightning", X = 140, Y = 116, Length = 3500},
		SetEffect{Effect = "AreaHit", X = 140, Y = 116, Length = 3000},
		StopEffect {TargetType = World, X = 140, Y = 116}, --groundwave
		StopEffect {TargetType = World, X = 137, Y = 117}, --feuer
		--SetGlobalFlagTrue {Name = "P101GoblinLagerKaputt"},
		
	}
}
----------------------------------------------
----------------------------------------------

-- Flag für Fial Darg Gefängnis-Effekt
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = { },
	Actions = 
	{ 
	SetGlobalFlagTrue {Name = "FialDargGefangen"},
	},
}

--Flag für Respawn-Stop Lena nach Lösen der Map
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce", UpdateInterval = 30},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue{Name = "P101Gelöst"},
	},
}

--Flag, wenn Statthalter tot
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{ 
		IsGlobalFlagTrue{Name = "P101StatthalterLebt", UpdateInterval = 50},
		FigureDead{NpcId = 6773},
	},
	Actions = 
	{ 
		SetGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled"}
	},
}

---------------------------------------
--Quest-Management
----------------------------------------

-- Abschalten der Quest 571: Aedar 
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P101DialogAedarEnded", UpdateInterval = 10},
		
	},
		
 	Actions = 
	{ 
		QuestSolve{QuestId = 571, ActivateNextQuest = FALSE },
		QuestBegin{QuestId = 715}, -- begin QuestWillit
	},
}

-- Abschalten der Quest 715:  Willit
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		
		IsGlobalFlagTrue {Name = "P101DialogWillitEnded", UpdateInterval = 10},
	},
		
 	Actions = 
	{ 
		QuestSolve{QuestId = 715, ActivateNextQuest = FALSE },
		QuestBegin{QuestId = 569}, -- begin Quest Finde Rune 1
		QuestBegin{QuestId = 572}, -- begin Quest Weg nach Rune1
		SetRewardFlagTrue { Name = "ImCampMitAllenGeredet" },
	},
}

-------------------
----Notfall-Flags, falls Dialoge Aedar/ Willit nicht geführt wurden
--------------------
--
---- Abschalten der Quest 571 Aedar, falls nicht mit Aedar geredet
--OnOneTimeEvent
--{
--	NotInDialog = FALSE, UpdateInterval = 60,
--	Conditions = 
--	{
--		QuestState{QuestId = StateActive, State = 571, UpdateInterval = 60 }, --Sprecht mit Aedar
--		IsGlobalFlagTrue{Name = "IchWarAufRune1", UpdateInterval = 20},
--	},
--		
-- 	Actions = 
--	{ 
--		QuestSolve{QuestId = 571, ActivateNextQuest = FALSE }, --AedarQuest solve
--		QuestBegin{QuestId = 569}, -- begin Quest Finde Rune 1
--		QuestSolve{QuestId = 715, ActivateNextQuest = FALSE }, --Sprecht mit Willit
--		QuestSolve{QuestId = 572, ActivateNextQuest = FALSE }, --Weg nach Rune1 Quest solve
--		
--	},
--}
--
---- Abschalten der Quest Willit, falls nicht mit Willit geredet
--OnOneTimeEvent
--{
--	NotInDialog = FALSE, UpdateInterval = 60,
--	Conditions = 
--	{
--		QuestState{QuestId = StateActive, State = 715, UpdateInterval = 60 },
--		IsGlobalFlagTrue{Name = "IchWarAufRune1", UpdateInterval = 20},
--	},
--		
-- 	Actions = 
--	{ 
--		QuestSolve{QuestId = 715, ActivateNextQuest = FALSE }, --AedarQuest solve
--		QuestBegin{QuestId = 569}, -- begin Quest Finde Rune 1
--		QuestSolve{QuestId = 572, ActivateNextQuest = FALSE }, --Weg nach Rune1 Quest solve
--		
--	},
--}
---------------------------
-- Abschalten der Quest 570: Hole Rune2
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{
		IsItemFlagTrue {Name = "PlayerHasItemRune02", UpdateInterval = 60},
	},
		
 	Actions = 
	{ 
		QuestSolve{QuestId = 623, ActivateNextQuest = FALSE },
		QuestSolve{QuestId = 570, ActivateNextQuest = FALSE },
		QuestSolve{QuestId = 753, ActivateNextQuest = FALSE },
	},
}

-- Abschalten der Quest 753: Gehe zurück nach Mirraw Thur
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{
		QuestState{QuestId = 753, State = StateActive, UpdateInterval = 60},
	},
		
 	Actions = 
	{ 
		QuestSolve{QuestId = 753, ActivateNextQuest = FALSE },
	},
}



-----------------------------------------
-- Outcry-Timer: 
-----------------------------------------
--Outcry Grim (Rune2-Aufforderung)
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{
		IsItemFlagTrue {Name = "PlayerHasItemRune01", UpdateInterval = 60},
	},
		
 	Actions = 
	{ 
		--QuestBegin {QuestId = 570},
		--QuestBegin {QuestId = 601},
		SetGlobalTimeStamp{Name = "AbRückkehrVonRune1"},
	},
}



--Outcry Grim (Heldenmonument-Aufforderung)
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{
		IsItemFlagTrue {Name = "PlayerHasItemRune02", UpdateInterval = 60},
	},
		
 	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "AbRückkehrVonRune2"},
	},
}


--Outcrywechsel lena und Grim nach Willitgespräch

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		ODER
		(
		IsGlobalFlagTrue {Name = "HabeMitWillitGesprochen"},
		FigureInRange {X = 141, Y = 141, NpcId = 5537, Range = 10}
		)
	},
		
 	Actions = 
	{ 
		SetGlobalTimeStamp{Name = "P101OcNachWillit"},
	},
}

-----------------------------------------------------

-- Baum-Blockade zu Portal Rune 2 wird gefällt

OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{
		IsItemFlagTrue {Name = "PlayerHasItemRune01", UpdateInterval = 60},
	},
		--PlayerUnitInRange{X = 120, Y = 450, Range = 5, FigureType = FigureAvatar, UpdateInterval = 60},
 	Actions = 
	{ 
		ChangeObject{X = 123, Y = 449, Object = 803},
		ChangeObject{X = 117, Y = 456, Object = 809},
		ChangeObject{X = 127, Y = 459, Object = 808},
		ChangeObject{X = 123, Y = 459, Object = 803},
		ChangeObject{X = 127, Y = 455, Object = 808},
		ChangeObject{X = 128, Y = 454, Object = 809},
		ChangeObject{X = 123, Y = 449, Object = 803},
		ChangeObject{X = 125, Y = 452, Object = 809},
		ChangeObject{X = 129, Y = 454, Object = 802},
		ChangeObject{X = 129, Y = 453, Object = 808},
		ChangeObject{X = 128, Y = 453, Object = 803},
		ChangeObject{X = 128, Y = 452, Object = 802},
		ChangeObject{X = 121, Y = 457, Object = 803},
		ChangeObject{X = 117, Y = 455, Object = 803},
		
		RemoveObject{X = 124, Y = 459, Object = 2574},
		RemoveObject{X = 124, Y = 458, Object = 2573},
		RemoveObject{X = 125, Y = 458, Object = 2574},
		RemoveObject{X = 125, Y = 457, Object = 2573},
		RemoveObject{X = 126, Y = 457, Object = 2572},
		RemoveObject{X = 126, Y = 456, Object = 2573},
		RemoveObject{X = 127, Y = 456, Object = 2574},
		
		QuestSolve {QuestId = 560, ActivateNextQuest = FALSE},
		QuestSolve {QuestId = 738, ActivateNextQuest = FALSE},
		QuestSolve {QuestId = 569, ActivateNextQuest = FALSE},

	},
}




-- Sklaven werden nach Cutscene dem Spieler übergeben
OnPlatformOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "SklavenÜbergeben"},
	},
	Actions = 
	{
		ChangeFigureOwner {NpcId = 5679},
		ChangeFigureOwner {NpcId = 5680},
		ChangeFigureOwner {NpcId = 5681},
		ChangeFigureOwner {NpcId = 5682},
		ChangeFigureOwner {NpcId = 5683},
		ChangeFigureOwner {NpcId = 5684},
		ChangeFigureOwner {NpcId = 5685},
		ChangeFigureOwner {NpcId = 5686},
		ChangeFigureOwner {NpcId = 5687},
		ChangeFigureOwner {NpcId = 5688},
		ChangeFigureOwner {NpcId = 5689},
		ChangeFigureOwner {NpcId = 5690},
		ChangeFigureOwner {NpcId = 5691},
		ChangeFigureOwner {NpcId = 5692},
		ChangeFigureOwner {NpcId = 5693},
		ChangeFigureOwner {NpcId = 5772},
		ChangeFigureOwner {NpcId = 5773},
		ChangeFigureOwner {NpcId = 5774},
		ChangeFigureOwner {NpcId = 5775},
		ChangeFigureOwner {NpcId = 5776},
	},
}






----------------------------------------------
--nach Zerstörung des Elfenhauptquartiers
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{
		Negated(BuildingInRange {X = 219, Y = 290, Range = 5, Owner = OwnerNpc, BuildingId = 0, UpdateInterval = 15}),
		Negated(BuildingInRange {X = 227, Y = 290, Range = 5, Owner = OwnerNpc, BuildingId = 0, UpdateInterval = 15}),
		Negated(EnemyUnitInRange{X = 223, Y = 291, NpcId = Avatar, Range = 10, UnitId = 0, UpdateInterval = 15}),
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "HQistZerstört"}, -- Trigger für Spawning Elune und Statthalterin, Umspawnen von Grim und Lea; Starten Cutscene
		QuestSolve{QuestId = 586, ActivateNextQuest = FALSE }, -- QAngriff auf Eiselfen solved
		SetRewardFlagTrue { Name = "HQBefreien" },
		
	},
}

--alle Eiselfen werden lieb, nach Cutscene Gefängnis
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "P101EiselfenWerdenLieb", UpdateInterval = 20},
	},
	Actions = 
	{
		ChangeRace {Race = 192, NpcId = 5932},-- Patrouille
		ChangeRace {Race = 192, NpcId = 5933},
		ChangeRace {Race = 192, NpcId = 5934},
		ChangeRace {Race = 192, NpcId = 5935},
		ChangeRace {Race = 192, NpcId = 5936},
		ChangeRace {Race = 192, NpcId = 6201}, --Wachen vor Tor
		ChangeRace {Race = 192, NpcId = 6202},
		ChangeRace {Race = 192, NpcId = 6203},
		ChangeRace {Race = 192, NpcId = 6204},
		ChangeRace {Race = 192, NpcId = 6205},
		ChangeRace {Race = 192, NpcId = 6206},
		ChangeRace {Race = 192, NpcId = 6207},
		ChangeRace {Race = 192, NpcId = 6208},
		ChangeRace {Race = 192, NpcId = 6209},
		ChangeRace {Race = 192, NpcId = 6210},
		ChangeRace {Race = 192, NpcId = 6211},
		
		ChangeRace {Race = 192, NpcId = 5930},
		ChangeRace {Race = 192, NpcId = 5924},
		ChangeRace {Race = 192, NpcId = 5921},
		ChangeRace {Race = 192, NpcId = 5926},
		ChangeRace {Race = 192, NpcId = 5923},
		
		ChangeRace {Race = 192, NpcId = 5925}, 
		ChangeRace {Race = 192, NpcId = 5922},
		ChangeRace {Race = 192, NpcId = 5928},
		ChangeRace {Race = 192, NpcId = 5931},
		ChangeRace {Race = 192, NpcId = 5920},
		
		ChangeRace {Race = 192, NpcId = 8139},
		ChangeRace {Race = 192, NpcId = 8140},
		ChangeRace {Race = 192, NpcId = 8141},
		ChangeRace {Race = 192, NpcId = 8142},
		ChangeRace {Race = 192, NpcId = 8143},
		ChangeRace {Race = 192, NpcId = 8144},
		ChangeRace {Race = 192, NpcId = 8145},
		ChangeRace {Race = 192, NpcId = 8146},
		ChangeRace {Race = 192, NpcId = 8147},
		ChangeRace {Race = 192, NpcId = 8148},
		ChangeRace {Race = 192, NpcId = 8149},
		ChangeRace {Race = 192, NpcId = 8150},
		ChangeRace {Race = 192, NpcId = 8151},
		ChangeRace {Race = 192, NpcId = 8152},
		ChangeRace {Race = 192, NpcId = 8153},
		ChangeRace {Race = 192, NpcId = 8154},
		ChangeRace {Race = 192, NpcId = 8155},
		ChangeRace {Race = 192, NpcId = 8156},
		ChangeRace {Race = 192, NpcId = 8157},
		ChangeRace {Race = 192, NpcId = 8158},
		ChangeRace {Race = 192, NpcId = 8159},
		ChangeRace {Race = 192, NpcId = 8160},
		ChangeRace {Race = 192, NpcId = 8161},
		ChangeRace {Race = 192, NpcId = 8162},
		ChangeRace {Race = 192, NpcId = 8163},
		ChangeRace {Race = 192, NpcId = 8164},
		ChangeRace {Race = 192, NpcId = 8165},
		ChangeRace {Race = 192, NpcId = 8166},
		ChangeRace {Race = 192, NpcId = 8167},
		ChangeRace {Race = 192, NpcId = 8168},
		ChangeRace {Race = 192, NpcId = 8169},
		ChangeRace {Race = 192, NpcId = 8170},
		ChangeRace {Race = 192, NpcId = 8171},
		ChangeRace {Race = 192, NpcId = 8172},
		ChangeRace {Race = 192, NpcId = 8173},
		
		ChangeRace {Race = 192, NpcId = 5706}, --Bogenschützen hinten
		ChangeRace {Race = 192, NpcId = 5705},
		ChangeRace {Race = 192, NpcId = 5704},
		
		SetGlobalFlagTrue {Name = "P101EiselfenSindLieb"},	
	},
}

---------------------------------------------------------------------
---- Wenn Avatar im Norden, hinter Tor
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 30,
	Conditions = 
	{
		FigureInRange {X = 378, Y = 425, NpcId = Avatar, Range = 10},
		--IsNpcCounter {Name = "CounterFlüchtlingeGerettet", Value = 10, Operator = IsGreaterOrEqual, UpdateInterval = 30},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "p101AlleFlüchtlingeGerettet" },
		--QuestSolve{QuestId = 644, ActivateNextQuest = FALSE},
		--QuestSolve{QuestId = 717, ActivateNextQuest = FALSE},
		SetRewardFlagTrue { Name = "FluechtlingeNachNorden" },
	},
}


---- Flag + Timer für Feuerarmee-Überrun, wenn  alle Flüchtlinge gerettet
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 60,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "p101AlleFlüchtlingeGerettet", UpdateInterval = 3},
		IsMonumentInUse{X = 455, Y = 450, Range = 1, UpdateInterval = 30},
		
		
	},
	Actions = 
	{
		SetPlatformTimeStamp {Name = "CounterFeuerarmee2"},
		
	},
}

---- Flag, wenn Bindstone in Use (für Questsolve auf P104)
OnOneTimeEvent
{
	NotInDialog = FALSE, UpdateInterval = 10,
	Conditions = 
	{
		--IsGlobalFlagTrue {Name = "p101AlleFlüchtlingeGerettet", UpdateInterval = 3},
		IsMonumentInUse{X = 455, Y = 450, Range = 5, UpdateInterval = 10},
		
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "P101BindstoneOn"},
		
	},
}

-----------------------------------------------
--Knochenwaffenquest
-----------------------------------------------
----- Rückeroberung Mirraw Thur solven, wen Dracon tot
----- Berichtet Ashgork begin
OnOneTimeEvent
{
	Conditions = {
		QuestState{QuestId = 632, State = StateActive}, --KnochenschnitzerQuest aktiv
		IsGlobalFlagTrue{ Name = "P101_DunkelElfBossKilled", UpdateInterval = 30},
	 },
	Actions = 
	{ 
		QuestSolve{QuestId = 632}, --befreit MT
		QuestBegin{QuestId = 736}, --berichtet Ashgork
	},
}
---- Sobald Ashgork getötet und seine Fragmente erbeutet, Questbucheintrag: Schmiede ein Set am Altar
OnOneTimeEvent
{
	Conditions = {
		QuestState{QuestId = 742, State = StateActive},
		IsItemFlagTrue{ Name = "PlayerHasItemSchwertFragment"},
		IsItemFlagTrue{ Name = "PlayerHasItemStabFragment"},
	 },
	Actions = 
	{ 
		QuestSolve{QuestId = 742},
		QuestBegin{QuestId = 743},
	},
}
-----  Knochenquest solved, wenn drei Items eines Sets geschmiedet
OnOneTimeEvent
{
	Conditions = {
		QuestState{QuestId = 743, State = StateActive},
		IsGlobalFlagTrue {Name = "P101_BoneSetItem1Made"},
		IsGlobalFlagTrue {Name = "P101_BoneSetItem2Made"},
		IsGlobalFlagTrue {Name = "P101_BoneSetItem3Made"},
	 },
	Actions = 
	{ 
		QuestSolve{QuestId = 743},
		QuestSolve{QuestId = 631},
	},
}




EndDefinition()

end
