-- RTS Spawn:
-- p2 Eloni

GlobalSpawnDuration = 90

--Monumentenclaim
OnPlatformOneTimeEvent
{
	UpdateInterval = 10,
	Conditions = 
	{
		ODER(IsMonumentInUse {X = 317, Y = 153, Range = 0, UpdateInterval = 10}, IsMonumentInUse {X = 217, Y = 237, Range = 0, UpdateInterval = 10}),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "EloniMonumentClaimedTimer"},
	}
}

--Gobblins Ruinencamp 1
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 30,
	X = 242,
	Y = 146,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {777, 783, 783}, 	-- Gobblins
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {784, 777}},	
		[1]		= {Minutes = 3, 	Units = {779, 784}},	
		[35]	= {Minutes = 2.5, 	Units = {262, 779}}, 	
		[45]	= {Minutes = 1.5, 	Units = {777, 779, 783}},
		[70]	= {Seconds = 50, 	Units = {784, 783, 262, 266}},
	},
	NpcBuildingsExist = {X = 245, Y = 151, Range = 5},
	CampDestroyedActions = {SetGlobalTimeStamp{Name = "EloniGobblinsDestroyedTimer"}, SetGlobalFlagTrue {Name = "FishGobHomeDestroyed"},},
}

---- RTS SPAWN, Gobblins Wald Camp von Ruff
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 25,
	X = 251,
	Y = 275,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {777, 783, 779}, 	-- Gobbos
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {783, 777}},
		[25]	= {Minutes = 2.5, 	Units = {262, 777}},
		[35]	= {Minutes = 2, 	Units = {779, 784}},
		[60]	= {Minutes = 1.5, 	Units = {784, 783, 262}},
		[70]	= {Seconds = 60, 	Units = {777, 779, 266}},
	},
	NpcBuildingsExist = {X = 250, Y = 272, Range = 5},
}


---- RTS SPAWN, Orks Wald Camp von Ruff
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 30,
	X = 258,
	Y = 275,
	Range = 3,
	
	
	Timer	= "EloniGobblinsDestroyedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1156, 1156, 1157}, 	-- Orc Fist 3 Thug / Orc Fist 1 Spearman, Thug 
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1156, 1157}},
		[20]	= {Minutes = 2.5, 	Units = {884, 1156}},
		[35]	= {Minutes = 2, 	Units = {895, 895, 1156}},
		[55]	= {Minutes = 1.5, 	Units = {884, 895, 895, 1157}},
		[70]	= {Minutes = 1, 	Units = {884, 884, 895, 1156}},
	},
	NpcBuildingsExist = {X = 256, Y = 276, Range = 5},
}



---- RTS SPAWN,Beastmencamp
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 12,
	X = 142,
	Y = 132,
	Range = 1,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {690, 706, 689}, 	-- Beastman Lowend 3 Runner Amuck/Keule/Scatching Claws 
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {690, 706}},	
	},
	NpcBuildingsExist = {X = 142, Y = 132, Range = 12},
}



---- RTS SPAWN, Orcs Wald Camp von Murak, Versorgungscamp für Angriffscamp Brücke 1
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 20,
	X = 282,
	Y = 332,
	Range = 3,
	
	
	Timer	= "EloniGobblinsDestroyedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1157, 1156, 1157}, 	-- Orc Fist 1 Spearman / Thug 
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {884, 1157}},			
		[20]	= {Minutes = 3.5, 	Units = {1157, 895}},			
		[40]	= {Minutes = 3, 	Units = {895, 895, 1157}}, 	    
		[60]	= {Minutes = 2.5, 	Units = {884, 895, 895}},  	
		[85]	= {Minutes = 2, 	Units = {884, 884, 895}},
	},
	NpcBuildingsExist = {X = 279, Y = 335, Range = 0},
}

---- RTS SPAWN, Orcs Wald Camp von Murak, Versorgungscamp für Angriffscamp Brücke 2
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 20,
	X = 260,
	Y = 340,
	Range = 3,
	
	
	Timer	= "EloniGobblinsDestroyedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1156, 1157, 1156}, 	-- Orc Fist 1 Thug / Spearman 
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {884, 1156}},
		[20]	= {Minutes = 3, 	Units = {1156, 895}},
		[40]	= {Minutes = 2.5, 	Units = {895, 895, 1156}},
		[60]	= {Minutes = 2, 	Units = {884, 895, 895}},
		[85]	= {Minutes = 1.5, 	Units = {884, 884, 895}},
	},
	NpcBuildingsExist = {X = 263, Y = 341, Range = 4},
}


-- RTS SPAWN, Gobblinblockade vor dem Portal 1
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 18,
	X = 389,
	Y = 375,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {777, 266, 779, 777, 266, 779, 777, 266, 779, 777, 266, 779}, 	-- Gobbos
	SpawnData =
	{
		[0]		= {Minutes = 2.5, 	Units = {266, 777}},
	},
	NpcBuildingsExist = {X = 388, Y = 374, Range = 10},
}

-- RTS SPAWN, Gobblinblockade vor dem Portal 2
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 20,
	X = 376,
	Y = 394,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {777, 266, 779, 777, 266, 779, 777, 266, 779, 777, 266, 779}, 	-- Gobbos
	SpawnData =
	{
		[0]		= {Minutes = 2.5, 	Units = {266, 777}},
	},
	NpcBuildingsExist = {X = 374, Y = 394, Range = 5},
}



-- RTS SPAWN, Orcblockade vor dem Portal

RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 12,
	X = 427,
	Y = 411,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1156, 1157, 1156, 1157, 884, 895, 884, 895, 884, 895}, 	-- Orc Fist 3 Ravager/Thug, Orc Fist 1 Thug/Spearman 
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {884, 881}},
	},
	NpcBuildingsExist = {X = 428, Y = 415, Range = 3},
}

---- RTS SPAWN, Gobblins Vor Brücke links die südlichen zwei Häuser
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 20,
	X = 190,
	Y = 276,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {777, 784, 779, 777, 784, 779}, 	-- Gobbos
	SpawnData =
	{
	--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
		[0]		= {Minutes = 2.5, 	Units = {784, 777}},			-- zu beginn alle 5 minuten je 1 unit 779 spawnen
		[20]	= {Minutes = 2, 	Units = {784, 777}},			-- zusätzlich alle 3 minuten je 1 unit 779 spawnen
		[25]	= {Minutes = 1.5, 	Units = {779, 784}}, 	    -- nach 10 minuten alle 180 und 120 sekunden je 1 unit spawnen
		[45]	= {Minutes = 1, 	Units = {784, 783, 262}},  	-- usw.
		[70]	= {Seconds = 50, 	Units = {777, 779, 266}},
	},
	NpcBuildingsExist = {X = 190, Y = 276, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "ElonieBridgeI"},}
}


---- RTS SPAWN, Gobblins Vor Brücke links
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 30,
	X = 183,
	Y = 285,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {777, 266, 779}, 	-- Gobbos
	SpawnData =
	{
	--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
		[0]		= {Minutes = 3, 	Units = {784, 777}},			-- zu beginn alle 5 minuten je 1 unit 779 spawnen
		[15]	= {Minutes = 2.5, 	Units = {784, 777}},			-- zusätzlich alle 3 minuten je 1 unit 779 spawnen
		[35]	= {Minutes = 1.5, 	Units = {779, 784}}, 	    -- nach 10 minuten alle 180 und 120 sekunden je 1 unit spawnen
		[55]	= {Minutes = 1, 	Units = {784, 783, 262}},  	-- usw.
		[70]	= {Seconds = 50, 	Units = {777, 779, 266}},
	},
	NpcBuildingsExist = {X = 183, Y = 285, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "ElonieBridgeII"},}
}


---- RTS SPAWN, Gobblins Vor Brücke weit rechts 
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 35,
	X = 191,
	Y = 293,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {777, 784, 779}, 	-- Gobbos
	SpawnData =
	{
	--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
		[0]		= {Minutes = 2.5, 	Units = {784, 777}},			-- zu beginn alle 5 minuten je 1 unit 779 spawnen
		[20]	= {Minutes = 2, 	Units = {784, 777}},			-- zusätzlich alle 3 minuten je 1 unit 779 spawnen
		[35]	= {Minutes = 1.5, 	Units = {779, 784}}, 	    -- nach 10 minuten alle 180 und 120 sekunden je 1 unit spawnen
		[55]	= {Minutes = 1, 	Units = {784, 783, 262}},  	-- usw.
		[70]	= {Seconds = 50, 	Units = {777, 779, 266}},
	},
	NpcBuildingsExist = {X = 189, Y = 294, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "ElonieBridgeIII"},}
}

-- RTS SPAWN, BrückenCamp Elfen für Attackwaves Spawnen
BrueckencampElfen =
{
	X = 150,
	Y = 313,
	Range = 4,
	Chief = 0, 
	WaitTime = 90,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
		
	},
	-- ElfenUnits spawnen
	Units = 
	{	
		464, 464, 	-- Elf Eloni Winterguard
		455, 455, 	-- Elf Eloni Watcher
		459, 459,	-- Elf Eloni Bladedancer 5
	},
	ShuffleUnits = TRUE,
	
}


RtsSpawn
{
	Clan = 15, MaxClanSize = 6,
	Groups = {BrueckencampElfen},
	Conditions = 	
	{
	},
}

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Aufbau1 =
{
	X = 281,
	Y = 113,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}


Bear1 =
{
	X = 277,
	Y = 192,
	Range = 2,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		
		344	-- Animal Brownbear
		
	},                    
	ShuffleUnits = FALSE,
	
}

Bear2 =
{
	X = 200,
	Y = 244,
	Range = 2,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		
		344	-- Animal Brownbear
		
	},                    
	ShuffleUnits = FALSE,
	
}

WildElfenMonument =
{
	X = 226,
	Y = 211,
	Range = 2,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354,	--Animal Deer Old
		353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose´
	},                    
	ShuffleUnits = TRUE,
	
}

WoelfeOrccamp =
{
	X = 320,
	Y = 262,
	Range = 3,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		349, 349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = FALSE,
	
}

ElfenVersteck1 =
{
	X = 354,
	Y = 274,
	Range = 3,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355, 355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

ElfenBaer =
{
	X = 150,
	Y = 241,
	Range = 1,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		344	-- Animal Brownbear
		
	},                    
	ShuffleUnits = FALSE,
	
}

BaerBeastmen =
{
	X = 127,
	Y = 189,
	Range = 1,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		344	-- Animal Brownbear
	},                    
	ShuffleUnits = FALSE,
	
}

WildschweineBeastmanCamp =
{
	X = 87,
	Y = 172,
	Range = 4,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

WildschweineOrcCamp =
{
	X = 234,
	Y = 329,
	Range = 4,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

InitSpawn
{
	Clan = 14, 
	Groups = {Aufbau1, Bear1, Bear2, WildElfenMonument, WoelfeOrccamp, ElfenVersteck1, ElfenBaer, BaerBeastmen, WildschweineBeastmanCamp, WildschweineOrcCamp},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 45,
	Groups = {Aufbau1, Bear1, Bear2, WildElfenMonument, WoelfeOrccamp, ElfenVersteck1, ElfenBaer, BaerBeastmen, WildschweineBeastmanCamp, WildschweineOrcCamp},
	Conditions = 	
	{
	},
}


---------------------------------------------
--
--		Postpersistentes Spawnen
--
---------------------------------------------

-- RTS SPAWN, ein paar Beastmen, damit die Welt nicht so leer ist, wenn der Spieler zurück kommt
Beastmen1 =
{
	X = 351,
	Y = 274,
	Range = 2,
	Chief = 2814, -- Beastman 6 Unarmed Paws
	WaitTime = 60,
	AvatarMinLevel = 4,
	AvatarMaxLevel = 23,
	Conditions = 
	{
	},
	
	Units = 
	{
		725, 725, 725, 725, 725, 725, 725, 725, --Beastman Normal 6 Paws 
		215, 215, 215, 215, 215, 215, 215, 215 --Beastman Normal 6 Doppelaxt
	},
	ShuffleUnits = TRUE,
}

InitSpawn
{
	Clan = 13,
	Groups = {Beastmen1},
	Conditions =
	{
	},
}

RtsSpawn
{
	Clan = 13, MaxClanSize = 20,
	Groups = {Beastmen1},
	Conditions = {},
}

-- RTS SPAWN, ein paar Beastmen, damit die Welt nicht so leer ist, wenn der Spieler zurück kommt
DarkElf1 =
{
	X = 190,
	Y = 287,
	Range = 2,
	Chief = 2815, -- Dark Elf Warlock
	WaitTime = 30,
	AvatarMinLevel = 11,
	AvatarMaxLevel = 25,
	Conditions = 
	{
	},
	
	Units = 
	{
		428, 428, 428, 428, 428, 428,	--Dark Elf Assasin 13
		427, 427, 427, 427, 427, 427, 	--Dark Elf Darkblade 12
		432, 432,						-- Dark Elf Necromancer 13
		436, 436 						-- Dark Elf Sorcerer 12
	},
	ShuffleUnits = TRUE,
}

InitSpawn
{
	Clan = 12,
	Groups = {DarkElf1},
	Conditions =
	{
	},
}

RtsSpawn
{
	Clan = 12, MaxClanSize = 30,
	Groups = {DarkElf1},
	Conditions = {},
}

-------------------------------------------------------
--
--	QuestSpawning für Holger
--
-------------------------------------------------------
ElfenH =
{
	X = 183,
	Y = 165,
	Range = 2,
	Chief = 0, 
	WaitTime = 30,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	
	Units = 
	{
		1093, -- Unique Elf Evil Dryade
		1094 --Unique Elf Evil Nymphet
	},
	ShuffleUnits = FALSE,
}

InitSpawn
{
	Clan = 11,
	Groups = {ElfenH},
	Conditions =
	{
		QuestState {QuestId = 368, State = StateActive},
	},
}

--Oger von Klarg und Klurg
RtsSpawnNT
{
	Clan = 10,
	MaxClanSize = 5,
	X = 180,
	Y = 118,
	Range = 3,
	
	
	Timer	= "EloniMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {687, 686, 686}, 	-- Ogre Klinge und Keule Level 3
	SpawnData =
	{
	--	[ab x minuten] = spawndelay in sekunden, unitliste (auswahl, es wird per zufall eine aus der liste gespawned)
		[0]		= {Minutes = 2.5, 	Units = {687, 686}},
	},
	NpcBuildingsExist = {X = 190, Y = 112, Range = 0},
}