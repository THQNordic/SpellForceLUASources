-- P04 ... Flucht in die Eis-Stadt

-- Coords für eingangsportal Dunkelelfen
PortalX = 461
PortalY = 160

-- Coords für eingangsportal Flüchtlinge
FugeePortalX = 466
FugeePortalY = 53

-- Flüchtlinge warten hier wegen Cutscene
Punkt1X = 404
Punkt1Y = 104

--Flüchtlingscamp 1 (beim Aufbau) coords
Flucht1X = 340
Flucht1Y = 170
--zum Flüchtlingscamp 2 vor Tor, damit das Tor geöffnet wird, wenn die Units da sind
Flucht2X = 297
Flucht2Y = 218
--(Pass) coords
Flucht2Xend = 308
Flucht2Yend = 275
--Flüchtlingscamp 3 (2. Lager) coords
Flucht3X = 435
Flucht3Y = 332
--Flüchtlingscamp 4 (Garnison) coords
Flucht4X = 240
Flucht4Y = 445
--Flüchtlingscamp 5 (Portal) coords
Flucht5X = 162
Flucht5Y = 358

-- die flüchtigen jungs haben 5 verschiedene anführer:
Anfuehrer1 = 5354
Anfuehrer2 = 5359
Anfuehrer3 = 5364
Anfuehrer4 = 5369
Anfuehrer5 = 5374

-- Die Wipetruppen haben zwei Führer

Trupp1 = 5484 
Trupp2 = 5499

-- food menge für flüchtlinge, damit sie zum pass weiterlaufen können
-- trigger für dunkelelfen attacken ist fix auf 2/3tel dieses werts... (s.u.)
FoodNeeded = 1000

-- anzahl sekunden nach monument claim bis die ersten flüchtlinge eintreffen sollen
FugitiveAppearDelay = 600

-- für interne zwecke: fugitive gruppen counter
CurrentFugitiveGroupNumber = 0


-- Dunkelelfen variablen:
-- Attack Positionen in den versch. Camps und so
AttackOrkMonumentX = 387
AttackOrkMonumentY = 145
FallBackX =	438
FallBackY = 105
AttackTroll1X = 355
AttackTroll1Y = 85
AttackTroll2X = 310
AttackTroll2Y = 120
AttackTroll3X = 470
AttackTroll3Y = 165
AttackFugitivesX = 335
AttackFugitivesY = 170
-- Kreuzungen, damit die Dunkelelfen nicht immer den direkten Weg nehmen
JunctionNorthEastX = 420
JunctionNorthEastY = 230
JunctionNorthX = 370
JunctionNorthY = 200
JunctionNorthWestX = 295
JunctionNorthWestY = 185
JunctionWestX = 260
JunctionWestY = 155
JunctionSouthX = 410
JunctionSouthY = 95
JunctionSouthEastX = 415
JunctionSouthEastY = 115
JunctionEastX = 430
JunctionEastY = 155
JunctionCampEntryEastX = 417
JunctionCampEntryEastY = 164
JunctionCampEntryWestX = 364
JunctionCampEntryWestY = 181 
JunctionCampEntrySouthX = 397
JunctionCampEntrySouthY = 108

-- Zweiter Teil der Angriffe, hinter dem Portal
AttackElfMonumentX = 220
AttackElfMonumentY = 184
AttackFugitivesX = 297
AttackFugitivesY = 218

-- Kreuzungen hinter dem Ork Camp
JunctionAtCaveX = 245
JunctionAtCaveY = 152
JunctionPlateauX = 298
JunctionPlateauY = 130
JunctionNorthEastOrcCampX = 452
JunctionNorthEastOrcCampY = 209

-- Spawnposition für den zweiten Teil der Karte
SecondSpawnX = 388
SecondSpawnY = 144


-- Letzter Teil -- Angriff auf die Grenzfeste
AttackGrenzFesteHintenX = 219
AttackGrenzFesteHintenY = 393
AttackGrenzFesteVorneX = 243
AttackGrenzFesteVorneY = 408

-- Kreuzungen auf dem Weg in die Grenzfeste
JunctionAtMountainX = 425
JunctionAtMountainY = 276
JunctionEbeneNordX = 360
JunctionEbeneNordY = 353

-- Tiere respawnen im Spawngebiet etwas schneller, damit der SPieler schneller Nahrung fangen kann
SchratSpawnTime = 150

-- Die Eiselfenführer
Gruppe1 = 5645
Gruppe2 = 5652
Gruppe3 = 5659


----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------
function CreateStateMachine(_Type,_PlatformId,_NpcId,_X,_Y)
BeginDefinition(_Type,_PlatformId,_NpcId,_X,_Y)

dofile("script/p104/n0_NahrungsOutcries.lua")
dofile("script/p104/n0_ItemScript.lua")
-- cutscene rename
--dofile("script/p104/n5428_CutsceneStartFlee.lua")
--dofile("script/p104/n5428_CutsceneRefugees.lua")

dofile("script/p104/n32013_CutsceneRefugees.lua")
dofile("script/p104/n32014_CutsceneStartFlee.lua")
dofile("script/p104/n32015_CutsceneDracon.lua")

dofile("script/FahrendeHaendler.lua")


PlatformInitAction (SetGlobalFlagTrue {Name = "PlayerWarAufFleeToIce"})
OneTimeInitAction  (SetRewardFlagTrue {Name = "P104Erreicht"})
---------------------------
--QuestSolve Q645
---------------------------
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "PlayerWarAufFleeToIce", UpdateInterval = 30},
		IsGlobalFlagTrue{Name = "P101BindstoneOn", UpdateInterval = 30},
	},
	Actions = 
	{
		QuestSolve{QuestId = 645, ActivateNextQuest = FALSE},
		QuestSolve{QuestId = 716, ActivateNextQuest = FALSE},
		
	},
}

------------------------------------------------------------------------------------------------
-- Dunkelelfen & Co. ---------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
--Attackbedingung

-- food menge die die dracon angriffswellen triggern
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 7, Operator = IsGreaterOrEqual},
	},
	Actions = 
	{
		SetGlobalFlagTrue{Name = "EnoughFoodForDraconArmySpawning"},
		SetGlobalFlagTrue {Name = "APW01"},
		SetGlobalFlagTrue {Name = "AP01"},
		SetGlobalFlagTrue {Name = "APW03"},
	},
}

-- setze delay für dracon army, die sollen ja nicht gleich am portal mit den flüchtlingen zusammenprallen
OnOneTimeEvent
{
	Conditions = 
	{
		FigureAlive{NpcId = Anfuehrer5},
	},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "DelayForDraconArmySpawning"},
	},
}

-- treffen alle bedingungen für das spawnen der dracon armee zu?
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "EnoughFoodForDraconArmySpawning"},
		IsGlobalTimeElapsed{Name = "DelayForDraconArmySpawning", Seconds = 60},
	},
	Actions = 
	{
		Outcry {Tag = "ocArachP004_001", NpcId = 5379, String = "Schickt Späher in den Sumpf! Scheucht das Gewürm heraus!", Color = ColorWhite}, 
		SetGlobalFlagTrue{Name = "DraconArmyBeginsAttackingFromPortal"},
	},
}

-- treffen alle bedingungen für das spawnen der dracon armee zu?
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "EnoughFoodForDraconArmySpawning"},
		IsGlobalTimeElapsed{Name = "DelayForDraconArmySpawning", Seconds = 80},
	},
	Actions = 
	{
		Outcry {Tag = "ocLenaP004_006", NpcId = 5428, String = "Schnell, wir brauchen mehr Nahrungsmittel!", Color = ColorWhite}, 
	},
}

--- Armee ist beim Spieler
OnOneTimeEvent
{
	Conditions =
	{
		ODER 
		(
			ODER 
			(
				FigureInRange {X = 431, Y = 149, NpcId = 5484, Range = 10}, 
				FigureInRange {X = 407, Y = 107, NpcId = 5484, Range = 10}
			),
			ODER 
			(
				FigureInRange {X = 431, Y = 149, NpcId = 5485, Range = 10}, 
				FigureInRange {X = 407, Y = 107, NpcId = 5485, Range = 10}
			)
		),
		--IsGlobalCounter {Name = "NahrungsZaehler", Value = 10, Operator = IsEqual},
	},
	Actions =
	{
		Outcry {Tag = "ocArachP004_002", NpcId = 5379, String = "Angriff! Macht sie nieder!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "OutCry700"},
	}
}

-- Lea sagt dann auch noch mal was nach dem der Angriff erfolgt
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "OutCry700", Seconds = 15},
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_008", NpcId = 5428, String = "Sie kommen! Die Garde greift an! Halte sie auf, bis die Flüchtlinge die Festung erreicht haben!", Color = ColorWhite}, 
	}
}


-- DE Armee im Camp
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "OutCry700", Seconds = 100},
	},
	Actions =
	{
		Outcry {Tag = "ocArachP004_003", NpcId = 5379, String = "Brennt alles nieder!", Color = ColorWhite}, 
		SetNpcFlagFalse {Name = "LeaBlocker"},
	}
}


-- Der Spieler ist jetzt mit dem zweiten Aufbau beschäftigt
OnOneTimeEvent
{
	Conditions =
	{
		IsMonumentInUse {X = 234, Y = 189, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "AttackTargetII"},
		SetGlobalFlagTrue {Name = "NewSpawn"},
		Outcry {Tag = "ocArachP004_004", NpcId = 5379, String = "Hört auf zu plündern ihr Narren! Das Pack ist zur Feste geflohen, ihnen nach!", Color = ColorWhite}, 
		IncreaseGlobalCounter {Name = "DraconWanderCounter"},
		RemoveDialog {NpcId = 5428},
	}
}

-- DE Armee greift Elfenfeste an
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "AttackTargetII", Seconds = 440},
	},
	Actions =
	{
		Outcry {Tag = "ocArachP004_005", NpcId = 5379, String = "Neu formieren! Ich will diese Festung fallen sehen! Stürmt sie!", Color = ColorWhite}, 
	}
}

-- Jetzt hatte er Zeit genug, also mal das Flag für den zweiten Angriff setzen
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "AttackTargetII", Seconds = 420},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "AP02"},
		SetGlobalFlagTrue {Name = "Zwei"},
		SetGlobalFlagFalse {Name = "AP01"},
	}
}

-- Jetzt kommen erst mal die Wipetruppen auch in die ElfenFestung
OnOneTimeEvent
{
	Conditions =
	{
			
		IsGlobalFlagTrue {Name = "FugitivesReachedPosition3"},
		IsGlobalTimeElapsed {Name = "ElfenAngreifen", Seconds = 180}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "APWO2"},
		SetGlobalFlagTrue {Name = "APWO4"},
		SetGlobalFlagFalse {Name = "APW03"},
		SetGlobalFlagFalse {Name = "APW01"},
		
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "RebirthChef2", Seconds = 300}
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "APWO2"},
		SetGlobalFlagFalse {Name = "APW01"},
		SetGlobalFlagTrue {Name = "APWO4"},
		SetGlobalFlagFalse {Name = "APW03"},
		SetGlobalFlagTrue {Name = "DENearElfenlager"},
	}
}
OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 578, State = StateActive},
	},
	Actions =
	{
		IncreaseGlobalCounter {Name = "DraconWanderCounter"},	
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		QuestState {State = StateActive, QuestId = 580},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "SuperQALetsGo"},
	}
}
-- Jetzt gehts um die Wurst Dunkelelfen greifen die Flüchtlinge in der Grenzfestung an
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "SuperQALetsGo", Seconds = 20},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "Last1"},
		SetGlobalFlagFalse {Name = "APWO2"},
		SetGlobalFlagTrue {Name = "Last2"},
		SetGlobalFlagFalse {Name = "APWO4"},
		SetGlobalFlagTrue {Name = "Last3"},
		SetGlobalFlagFalse {Name = "AP01"},
		Outcry {Tag = "ocArachP004_006", NpcId = 5379, String = "Ein Trupp den Berg hinauf! Sie können noch nicht weit sein!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "DenBergRauf"},
	}
}

-- DE Armee greift Elfenfeste an
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "DenBergRauf", Seconds = 90},
	},
	Actions =
	{
		Outcry {Tag = "ocArachP004_007", NpcId = 5379, String = "Ihr Narren! Verfolgt sie weiter! Es interessiert mich nicht, ob es dort oben kalt ist! Fasst sie!", Color = ColorWhite}, 
		IncreaseGlobalCounter {Name = "DraconWanderCounter"},
	}
}


--- Armee ist beim Spieler in der Garnison
OnOneTimeEvent
{
	Conditions =
	{
		EnemyUnitInRange {X = 343, Y = 432, Range = 10},
	},
	Actions =
	{
		Outcry {Tag = "ocArachP004_008", NpcId = 7664, String = "Los! Weiter! Lasst Zarachs Flammen sie verzehren!", Color = ColorWhite}, 
		Outcry {Tag = "ocArachP004_008", NpcId = 5379, String = "Los! Weiter! Lasst Zarachs Flammen sie verzehren!", Color = ColorWhite}, 
	}
}

------------------------------------------------------------------------------------------------
-- Flüchtlinge & Co. ---------------------------------------------------------------------------
------------------------------------------------------------------------------------------------

-- TRIGGER 1: die ersten eintreffenden flüchtlinge (sobald spieler halt etwas nahrung hat)...
OnOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 386, Y = 146, Range = 0, UpdateInterval = 10},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "FirstFugitiveGroupComingThroughPortal"},
		SetGlobalFlagTrue {Name = "FugitivesMovingToPosition1"},
		SetGlobalTimeStamp {Name = "FugitiveCutsceneDelay"},
		QuestSolve {QuestId = 575},
		SetRewardFlagTrue {Name = "OrklagerEinnehmen"},
	},
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "NahrungsZaehler", Value = 9, Operator = IsGreaterOrEqual, UpdateInterval = 5},
	},
	Actions =
	{
		QuestBegin {QuestId = 577},
		SetGlobalFlagTrue {Name = "P104_LenaGehtZuDenElfen"}
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		QuestState {QuestId = 580, State = StateSolved},
		QuestState {QuestId = 581, State = StateSolved},
		QuestState {QuestId = 582, State = StateSolved}
	},
	Actions =
	{
		QuestSolve {QuestId = 579}
	}
}



-- Lea sieht das genug Nahrung da ist und schreit rum
OnOneTimeEvent
{
	UpdateInterval = 10,
	Conditions =
	{
		IsGlobalFlagTrue {Name = "EnoughFoodForDraconArmySpawning", UpdateInterval = 10},
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_005", NpcId = 5428, String = "Da sind sie!  Es ist Dracon Arach und die Rote Garde! Der Angriff beginnt!", Color = ColorWhite}, 
	}
}


-- Genug Zeit abgelaufen und der Spieler bekommt gesagt, dass er auf verlorenem Posten steht
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "OutCry700", Seconds = 60},
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_009", NpcId = 5428, String = "Zieh dich zurück! Es sind zu viele! Zurück! Zur Wehrfeste, schnell!", Color = ColorWhite}, 
		SetGlobalFlagTrue {Name = "LeaGehtZumPass"},
		SetNpcFlagFalse {Name = "LeaBlocker"},
	}
}

-- Genug Zeit abgelaufen und der Spieler bekommt , noch mal mit Nachdruck, gesagt, dass er auf verlorenem Posten steht
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "OutCry700", Seconds = 80},
		Negated (IsMonumentInUse {X = 234, Y = 189, Range = 0}),
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_010", NpcId = 5428, String = "Lauf !", Color = ColorWhite}, 
		SetNpcFlagFalse {Name = "LeaBlocker"},
	}
}



-- TRIGGER 3: flüchtlinge sollen sich vom pass zum 2. lager bewegen
OnOneTimeEvent
{
	Conditions = 
	{
		--IsGlobalFlagTrue{Name = "FugitivesReachedPosition2"},
		IsGlobalFlagTrue {Name = "DENearElfenlager"},
	},
	Actions = 
	{
		SetGlobalFlagFalse{Name = "FugitivesMovingToPosition2"},
		SetGlobalFlagTrue{Name = "FugitivesMovingToPosition3"},
		SetGlobalTimeStamp {Name = "LagerZweiTimer"},
	},
}

-- Leas Outcry für das Elfenlager
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "LagerZweiTimer", Seconds  = 120},
	},
	Actions =
	{
		QuestSolve {QuestId = 614},
		Outcry {Tag = "ocLenaP004_011", NpcId = 5428, String = "Zurück! Lass sie die Festung plündern! Komm hier herauf!", Color = ColorWhite}, 
	}
}

-- TRIGGER 4: flüchtlinge sollen sich vom 2. lager in die garnison bewegen
OnOneTimeEvent
{
	Conditions = {
		IsGlobalFlagTrue{Name = "FugitivesReachedPosition3"},
		-- TEMPORÄR: -- normalerweise: wenn tor offen
		IsGlobalFlagTrue {Name = "TorAufLeaLos"},
	},
	Actions = {
		SetGlobalFlagFalse{Name = "FugitivesMovingToPosition3"},
		SetGlobalFlagTrue{Name = "FugitivesMovingToPosition4"},
	},
}

-- TRIGGER 5: flüchtlinge sollen sich vom pass zum 2. lager bewegen
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{Name = "FugitivesReachedPosition4"},
		QuestState {QuestId = 584, State = StateActive},
	},
	Actions = 
	{
		SetGlobalFlagFalse{Name = "FugitivesMovingToPosition4"},
		SetGlobalFlagTrue{Name = "FugitivesMovingToPosition5"},
	},
}


-- Übergabe der Orkgebäude, wenn die Stadt befreit ist 
OnOneTimeEvent
{
	Conditions =
	{
		IsMonumentInUse {X = 386, Y = 146, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		ChangeBuildingOwner {X = 390, Y = 137},
		ChangeBuildingOwner {X = 393, Y = 144},
		ChangeBuildingOwner {X = 386, Y = 169},
		ChangeBuildingOwner {X = 382, Y = 155},
		ChangeBuildingOwner {X = 380, Y = 141},
		ChangeBuildingOwner {X = 369, Y = 139},
		ChangeBuildingOwner {X = 370, Y = 131},
		ChangeBuildingOwner {X = 386, Y = 129},
		ChangeBuildingOwner {X = 376, Y = 146},
		ChangeBuildingOwner {X = 389, Y = 162},
		ChangeBuildingOwner {X = 386, Y = 132},
		SetGlobalFlagTrue {Name = "LeaDorfBefreit"},
		SetGlobalFlagTrue {Name = "FugeesHabenHunger"},
		SetGlobalFlagTrue {Name = "FugeesHabenHungerDialogReon"},
		SetGlobalTimeStamp {Name = "CutsceneVerzögerer"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed{Name = "CutsceneVerzögerer", Seconds = 30, UpdateInterval = 10},	
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_001", NpcId = 5428, String = "Die Siedlung gehört uns! Schick deine Arbeiter zu den Häusern!", Color = ColorWhite}, 
	}
}

-- Übergabe der Elfengebäude, wenn der Spieler das Monument am Pass übernommen hat
OnOneTimeEvent
{
	Conditions =
	{
		IsMonumentInUse {X = 234, Y = 189, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		ChangeBuildingOwner {X = 262, Y = 197},
		ChangeBuildingOwner {X = 269, Y = 207},
		ChangeBuildingOwner {X = 256, Y = 182},
		ChangeBuildingOwner {X = 247, Y = 176},
		ChangeBuildingOwner {X = 241, Y = 180},
		ChangeBuildingOwner {X = 221, Y = 187},
		ChangeBuildingOwner {X = 211, Y = 183},
		
		ChangeBuildingOwner {X = 285, Y = 215},
		ChangeBuildingOwner {X = 307, Y = 228},
		ChangeBuildingOwner {X = 224, Y = 178},
		ChangeBuildingOwner {X = 305, Y = 221},
		ChangeBuildingOwner {X = 293, Y = 223},
		SetGlobalFlagTrue {Name = "SpielerHatElfenMonument"},
		QuestSolve {QuestId = 577},
		QuestBegin {QuestId = 614},
	}
}

-- Lea mahnt zur Weiterreise an, Spieler soll zu den Flüchtlingen stoßen
--!!! Nicht sehr sauber, vielleicht gibt es da eine bessere Lösung als auf irgendwelche Figuren abzufragen, die evtl. schon tot sind
OnOneTimeEvent
{
	Conditions =
	{
		ODER
		(
			FigureInRange {NpcId = 5392, X = 295, Y = 226, Range = 5},
			ODER
			(
				ODER 
				(	
					FigureInRange {NpcId = 5384, X = 295, Y = 226, Range = 5},
					FigureInRange {NpcId = 5380, X = 295, Y = 226, Range = 5}
				),
				ODER
				(
					FigureInRange {NpcId = 5483, X = 295, Y = 226, Range = 5},
					FigureInRange {NpcId = 5486, X = 295, Y = 226, Range = 5}
				)
			)
		),
		Negated(BuildingInRange{X = 293, Y = 223, Range = 0}),
		Negated(BuildingInRange{X = 305, Y = 221, Range = 0}),
		 -- Der Chef einer der DE Truppen hat es bis ins Lager geschafft
	},
	Actions =
	{
		
		SetGlobalFlagTrue {Name = "DENearElfenlager"},
	}
}

-- Flag für Lea setzen, mit dem sie den Elfenübergebendialog starten kann
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRange {NpcId = self, X = 443, Y = 337, Range = 5}, -- Lea ist bei den Eiselfen angekommen
		IsGlobalFlagTrue {Name = "DENearElfenlager"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "ElfenGeben"},
	}
}

-- Outcrie, das Spieler die Stellung halten soll
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "DEAngriffTot"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "LeaSagtStellungHalten"},
		--EnableDialog {NpcId = 5428},
	}
}

-- Die Dunkelelfen die das Tor angreifen sind tot und die Schlüsselmeisterin ist am tor
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "TorAufLeaLos"},
		FigureDead {NpcId = 5766},
		FigureDead {NpcId = 5767},
		FigureDead {NpcId = 5768},
		FigureDead {NpcId = 5769},
		FigureDead {NpcId = 5770},
		FigureDead {NpcId = 5771},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "DEAngriffTot"},
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Uebergeben"},
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_012", NpcId = 5428, String = "Sie setzen uns nach! Übernimm das Kommando über die verbliebenen Elfen, versuche ihren Angriff abzuwehren!", Color = ColorWhite}, 
	}
	
}

-- Sclüsselmeisterin tot, aber TOr zu
OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 5642},
		QuestState {State = StateActive,  QuestId = 578},
	}, 
	Actions =
	{
		Outcry {Tag = "ocAedarP004_002", NpcId = 7305, String = "Sie ist tot! Wollen wir hoffen, dass Ihr beim Außenposten noch jemanden findet, der dieses Tor öffnen kann!", Color = ColorWhite}, 
	}
}


-- Flüchtlinge durchs Portal
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "LenaGeht"},
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_013", NpcId = 5428, String = "Die Flüchtlinge sind durch! Komm! Wir können hier nicht siegen!", Color = ColorWhite}, 
	}
}


-- Dracon will dem SPieler an den Kragen
OnOneTimeEvent
{
	Conditions =
	{
		FigureInRangeNpc {NpcId = 6538, TargetNpcId = 7664},
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_014", NpcId = 5428, String = "Schützen! Nehmt Ziel!", Color = ColorWhite}, 
		SetGlobalTimeStamp {Name = "Endkampf"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Endkampf", Seconds = 10},	
		FigureAlive {NpcId = 7664},
		FigureInRange {NpcId = 7664, X = 167, Y = 360, Range = 25},
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_015", NpcId = 5428, String = "Wartet...", Color = ColorWhite}, 
	
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Endkampf", Seconds = 15},	
		FigureAlive {NpcId = 7664},
	},
	Actions =
	{
		Outcry {Tag = "ocArachP004_010", NpcId = 7664, String = "Du entkommst mir nicht!", Color = ColorWhite}, 
	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalTimeElapsed {Name = "Endkampf", Seconds = 20},	
		FigureAlive {NpcId = 7664},
		FigureInRange {NpcId = 7664, X = 167, Y = 360, Range = 25},
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_016", NpcId = 5428, String = "Schießt!", Color = ColorWhite},
		AttackTarget {NpcId = 6529, Target = 7664},
		AttackTarget {NpcId = 6530, Target = 7664},
		AttackTarget {NpcId = 6531, Target = 7664},
		AttackTarget {NpcId = 6532, Target = 7664},
		AttackTarget {NpcId = 6533, Target = 7664},
		AttackTarget {NpcId = 6534, Target = 7664},
		AttackTarget {NpcId = 6535, Target = 7664},
		AttackTarget {NpcId = 6536, Target = 7664},
		AttackTarget {NpcId = 6537, Target = 7664},
		AttackTarget {NpcId = 6538, Target = 7664} 
	
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		FigureDead {NpcId = 7664},
		IsGlobalTimeElapsed {Name = "Endkampf", Seconds = 21},	
	},
	Actions =
	{
		Outcry {Tag = "ocLenaP004_017", NpcId = 5428, String = "Sein Feuer ist erloschen. Komm nun.", Color = ColorWhite}, 
	
	}
}

OnOneTimeEvent 
{
	Conditions =
	{
		QuestState {QuestId = 584, State = StateActive},
		FigureDead {NpcId = 5354},
		FigureDead {NpcId = 5355},
		FigureDead {NpcId = 5356},
		FigureDead {NpcId = 5357},
		FigureDead {NpcId = 5358},
		FigureDead {NpcId = 5359},
		FigureDead {NpcId = 5360},
		FigureDead {NpcId = 5361},
		FigureDead {NpcId = 5362},
		FigureDead {NpcId = 5363},
		FigureDead {NpcId = 5364},
		FigureDead {NpcId = 5365},
		FigureDead {NpcId = 5366},
		FigureDead {NpcId = 5367},
		FigureDead {NpcId = 5368},
		FigureDead {NpcId = 5369},
		FigureDead {NpcId = 5370},
		FigureDead {NpcId = 5371},
		FigureDead {NpcId = 5372},
		FigureDead {NpcId = 5373},
		FigureDead {NpcId = 5374},
		FigureDead {NpcId = 5375},
		FigureDead {NpcId = 5376},
		FigureDead {NpcId = 5377},
		FigureDead {NpcId = 5378},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "LenaGeht"},
		-- Reward für die Flüchtlinge
		SetGlobalFlagTrue {Name = "BelohnungJetzt"},
		
	}
}


OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "SavedFugees", Operator = IsLessOrEqual, Value = 5},
		--Negated (IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 5}),
		IsGlobalFlagTrue {Name = "BelohnungJetzt"},
	},
	Actions =
	{
		TransferXP {XP = 100},
		SetGlobalFlagTrue {Name = "5Fugees"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "SavedFugees", Operator = IsLessOrEqual, Value = 10},
		IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 5},
		--Negated (IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 15}),
		IsGlobalFlagTrue {Name = "BelohnungJetzt"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "10Fugees"},
		TransferXP {XP = 200}
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "SavedFugees", Operator = IsLessOrEqual, Value = 15},
		IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 10},
		--Negated (IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 20}),
		IsGlobalFlagTrue {Name = "BelohnungJetzt"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "15Fugees"},
		TransferXP {XP = 300}
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "SavedFugees", Operator = IsLessOrEqual, Value = 20},
		IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 15},
		--Negated (IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 5}),
		IsGlobalFlagTrue {Name = "BelohnungJetzt"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "20Fugees"},
		TransferXP {XP = 400}
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalCounter {Name = "SavedFugees", Operator = IsLessOrEqual, Value = 30},
		IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 20},
		--Negated (IsGlobalCounter{Name = "SavedFugees", Operator = IsGreater, Value = 5}),
		IsGlobalFlagTrue {Name = "BelohnungJetzt"},
	},
	Actions =
	{
		SetGlobalFlagTrue {Name = "25Fugees"},
		TransferXP {XP = 600}
	}
}

------------------------------------------
--	Der Weg nach Tiondria
------------------------------------------

OnOneTimeEvent
{
	Conditions =
	{
		QuestState{ QuestId = 704, State = StateActive}, 
		IsItemFlagTrue {Name = "PlayerHasItemPage119"},
	},
	Actions =
	{
		QuestSolve{QuestId = 704}, 
		SetRewardFlagTrue {Name = "SQTiondriaSeite1Gefunden" },

	}
}

OnOneTimeEvent
{
	Conditions =
	{
		QuestState{ QuestId = 705, State = StateActive}, 
		IsItemFlagTrue {Name = "PlayerHasItemPage120"},
	},
	Actions =
	{
		QuestSolve{QuestId = 705}, 
		SetRewardFlagTrue {Name = "SQTiondriaSeite2Gefunden"},

	}
}

OnOneTimeEvent
{
	Conditions =
	{
		QuestState{ QuestId = 706, State = StateActive}, 
		IsItemFlagTrue {Name = "PlayerHasItemPage121"},
	},
	Actions =
	{
		QuestSolve{QuestId = 706}, 
		SetRewardFlagTrue {Name = "SQTiondriaSeite3Gefunden"},
	}
}

OnOneTimeEvent
{
	Conditions =
	{
		QuestState{ QuestId = 704, State = StateSolved}, 
		QuestState{ QuestId = 705, State = StateSolved}, 
		QuestState{ QuestId = 706, State = StateSolved}, 
	},
	Actions =
	{
		QuestBegin{QuestId = 707}, 
		QuestSolve{QuestId = 703}, 

	}
}






EndDefinition()
end


