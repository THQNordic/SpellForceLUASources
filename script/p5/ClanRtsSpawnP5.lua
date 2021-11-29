-- RTS Spawn:
-- p5 Shiel

GlobalSpawnDuartion = 120

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		ODER
		(
			ODER 
			(
				ODER
				(
					IsMonumentInUse {X = 173, Y = 397, Range = 0},IsMonumentInUse {X = 151, Y = 358, Range = 0}
				),
					IsMonumentInUse {X = 233, Y = 272, Range = 0}
			),
				IsGlobalFlagTrue {Name = "SpawnStart"}
		),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "ShielMonumentClaimedTimer"},
	}
}

--RTS SPAWN,  Korns Truppe/Armee1

--Gobblins sollen zum Monument laufen PoI
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 50,
	X = 351,
	Y = 363,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {838, 658, 783, 838, 658, 783}, 	-- Gobblins
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {658, 783}},	
		[20]	= {Minutes = 2.8, 	Units = {658, 838}},	
		[35]	= {Minutes = 2.5, 	Units = {658, 783}}, 	
		[45]	= {Minutes = 1.5, 	Units = {658, 783, 838}},
		[70]	= {Seconds = 50, 	Units = {838, 658, 783}},
	},
	NpcBuildingsExist = {X = 354, Y = 368, Range = 2},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

---- Korns Orks Armee1
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 50,
	X = 361,
	Y = 383,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",
	Init	= {876, 881, 886, 876, 881, 886}, 	-- Orks Melee Haeler FrieBurst 
	SpawnData =
	{
		[11]	= {Minutes = 3, 	Units = {876}},
		[26]	= {Minutes = 2.5, 	Units = {876}},
		[36]	= {Minutes = 2.1, 	Units = {876, 886}},
		[61]	= {Minutes = 1.5, 	Units = {876, 881}},
		[71]	= {Seconds = 60, 	Units = {876, 881, 886}},
	},
	NpcBuildingsExist = {X = 368, Y = 390, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

---- Korns Orks Armee1 Mine
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 50,
	X = 373,
	Y = 364,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",
	Init	= {876, 881, 886, 876, 881, 886}, 	-- Orks Melee Haeler FrieBurst 
	SpawnData =
	{
		[9]		= {Minutes = 3.5, 	Units = {876}},
		[23]	= {Minutes = 3, 	Units = {876}},
		[44]	= {Minutes = 2.5, 	Units = {876, 886}},
		[59]	= {Minutes = 1.5, 	Units = {876}},
		[69]	= {Seconds = 60, 	Units = {876, 881, 886}},
	},
	NpcBuildingsExist = {X = 372, Y = 355, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

-- Korns Orks Armee1 Schmiede
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 50,
	X = 346,
	Y = 391,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",
	Init	= {876, 881, 886, 876, 881, 886}, 	-- Orks Melee Haeler FrieBurst 
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {876}},
		[26]	= {Minutes = 2.9, 	Units = {876}},
		[44]	= {Minutes = 2.6, 	Units = {876, 886}},
		[61]	= {Minutes = 1.5, 	Units = {876}},
		[69]	= {Seconds = 60, 	Units = {876, 881, 886}},
	},
	NpcBuildingsExist = {X = 342, Y = 391, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

-- Armee2 Belagerungstruppe Tal Gobblins
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 50,
	X = 362,
	Y = 236,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",
	Init	= {838, 658, 783, 838, 658, 783}, 	-- Gobblins
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {658, 783}},	
		[22]	= {Minutes = 3, 	Units = {658, 838}},	
		[33]	= {Minutes = 2.5, 	Units = {658, 783}}, 	
		[47]	= {Minutes = 1.5, 	Units = {658, 783, 838}},
		[68]	= {Seconds = 50, 	Units = {838, 658, 783}},
	},
	NpcBuildingsExist = {X = 358, Y = 238, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "UtranCleared1"},},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}


-- Armee2 Belagerungstruppe Tal Briganten
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 50,
	X = 342,
	Y = 216,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",
	Init	= {743, 852, 851, 743, 852, 851}, 	-- Brigant Scharfschütze,Keule, Schwert
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {852, 743}},	
		[21]	= {Minutes = 3, 	Units = {852, 851}},	
		[34]	= {Minutes = 2.5, 	Units = {851, 743}}, 	
		[46]	= {Minutes = 1.5, 	Units = {851, 851, 851, 743, 886, 852}},
		[69]	= {Seconds = 50, 	Units = {743, 886, 852}},
	},
	NpcBuildingsExist = {X = 342, Y = 218, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "UtranCleared2"},},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}



-- Armee2 Belagerungstruppe westlicher Aufgang
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 50,
	X = 237,
	Y = 154,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",
	Init	= {743, 852, 851, 743, 852, 851}, 	-- Brigant Scharfschütze,Keule, Schwert
	SpawnData =
	{
		[0]		= {Minutes = 3.6, 	Units = {852, 743}},	
		[17]	= {Minutes = 3.4, 	Units = {852, 851}},	
		[37]	= {Minutes = 2.6, 	Units = {851, 743}}, 	
		[53]	= {Minutes = 1.4, 	Units = {851, 851, 851, 743, 886, 852}},
		[74]	= {Seconds = 50, 	Units = {743, 886, 852}},
	},
	NpcBuildingsExist = {X = 237, Y = 154, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "UtranCleared3"},},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

-- Monument Belagerung Helden
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 10,
	X = 161,
	Y = 370,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1165, 1166, 1165, 1165,  1166, 1166, 1166, 1166}, 	--Minotauren
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1165, 1166}},	
	},
	NpcBuildingsExist = {X = 155, Y = 371, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

-- Briganten bei den Minen
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 8,
	X = 65,
	Y = 189,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {852, 852, 743, 743,  851, 851, 851}, 	--briganten
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {852, 851, 743}},	
	},
	NpcBuildingsExist = {X = 67, Y = 189, Range = 7},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

--Orks am Portalkeep
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 8,
	X = 409,
	Y = 285,
	Range = 1,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {851, 851, 881, 881,  886, 886}, 	--briganten Schwert, Orc Healer/Firemaster
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {851, 851, 851, 851, 851, 886, 881}},	
	},
	NpcBuildingsExist = {X = 409, Y = 281, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

-- Monument Belagerung Menschenaufbau
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 10,
	X = 178,
	Y = 387,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1165, 1166, 1165, 1165, 1166, 1166, 1166, 1166}, 	-- Minotauren
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1165, 1166}},	
	},
	NpcBuildingsExist = {X = 184, Y = 389, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}


-- Armee 4
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 12,
	X = 255,
	Y = 235,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {851, 851, 851, 851, 838, 838, 838, 838, 838, 838, 838, 886}, 	-- Gobblins
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {851, 851, 851, 851, 838, 838, 838, 838, 838, 838, 838, 886}},	
	},
	NpcBuildingsExist = {X = 255, Y = 235, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

-- Armee 3
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 12,
	X = 264,
	Y = 322,
	Range = 3,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {852, 852, 852, 852, 851, 851, 851}, 	-- Human Bandit 4 Metallkeule/Schwert
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {851, 851, 851, 851, 838, 838, 838, 838, 838, 838, 838, 886}},	
	},
	NpcBuildingsExist = {X = 264, Y = 322, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

-- Scharfschuetzen
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 6,
	X = 306,
	Y = 281,
	Range = 0,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {743, 743, 743, 743, 743, 743}, 	-- Human Bandit 4 Metallkeule/Schwert
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {743}},	
	},
	NpcBuildingsExist = {X = 307, Y = 284, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}


-- Talkesselcamp
RtsSpawnNT
{
	Clan = 11,
	MaxClanSize = 25,
	X = 79,
	Y = 318,
	Range = 0,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1176, 1176, 1176, 1176, 1176, 1176}, 	-- Westmannbarbaren
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {1176}},	
		[30]	= {Minutes = 3.5, 	Units = {1176}},	
		[45]	= {Minutes = 2.5, 	Units = {1176}}, 	
		[60]	= {Minutes = 1.5, 	Units = {1176}},
		[90]	= {Seconds = 50, 	Units = {1176}},
	},
	NpcBuildingsExist = {X = 79, Y = 318, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}


-- Elfenmonument
RtsSpawnNT
{
	Clan = 10,
	MaxClanSize = 20,
	X = 198,
	Y = 256,
	Range = 0,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {852, 852, 743, 743,  851, 851, 851}, 	-- Briganten
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {851, 743}},	
		[30]	= {Minutes = 3.5, 	Units = {851, 852}},	
		[45]	= {Minutes = 2.5, 	Units = {851, 743}}, 	
		[60]	= {Minutes = 1.5, 	Units = {851, 852, 852, 852, 851}},
		[90]	= {Seconds = 50, 	Units = {851, 743, 852}},
	},
	NpcBuildingsExist = {X = 198, Y = 256, Range = 7},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "SpawnStart"},}
}

-- Weg nach Lianon Sueden
RtsSpawnNT
{
	Clan = 9,
	MaxClanSize = 5,
	X = 50,
	Y = 254,
	Range = 0,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1165, 1165, 1165}, 	-- Minotauren
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {1165}},	
	},
	NpcBuildingsExist = {X = 50, Y = 254, Range = 15},
}

-- Weg nach Lianon Norden
RtsSpawnNT
{
	Clan = 8,
	MaxClanSize = 7,
	X = 39,
	Y = 309,
	Range = 0,
	
	
	Timer	= "ShielMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1165, 1165, 1165}, 	-- Minotauren
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {1165}},	
	},
	NpcBuildingsExist = {X = 39, Y = 309, Range = 15},
}

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Aufbaugebiet =
{
	X = 201,
	Y = 383,
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
		348, 348, 	-- Animal Wildboar
		344,	-- Animal Brownbear
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}
 
 
FlussUferOst =
{
	X = 101,
	Y = 284,
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
		348, 	-- Animal Wildboar
		344,	-- Animal Brownbear
		354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}
 
MinenGebiet =
{
	X = 40,
	Y = 256,
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
		348, 348, 348, 348, 348, 348, 348, 	-- Animal Wildboar
		354,			-- Animal Deer Old
		353, 353, 353	-- Animal Deer Young
	},                    
	ShuffleUnits = TRUE,
	
}
 
MinenGebietOst =
{
	X = 138,
	Y = 188,
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
		349, 349, 349,	--Animal Greywulf
		348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}
 
Festungswald =
{
	X = 228,
	Y = 160,
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
		344, 344, 344, 344, 344,	-- Animal Brownbear
		353, 353, 353,	-- Animal Deer Young
		354, 354, 354, 354, 354, 354,	--Animal Deer Old
		355, 355, 355, 355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}
 
FestungswaldOst =
{
	X = 388,
	Y = 192,
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
		353, 353, 353,	-- Animal Deer Young
		354, 354, 354, 354, 354, 354,	--Animal Deer Old
		355, 355, 355, 355,		-- Animal Moose
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}
 

 
PostenketteWald =
{
	X = 285,
	Y = 328,
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
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}
 
HauptlagerWald =
{
	X = 310,
	Y = 395,
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
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}
 
InitSpawn
{
	Clan = 14, 
	Groups = {Aufbaugebiet, FlussUferOst, MinenGebiet, MinenGebietOst, Festungswald, FestungswaldOst, PostenketteWald, HauptlagerWald},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 90,
	Groups = {Aufbaugebiet, FlussUferOst, MinenGebiet, MinenGebietOst, Festungswald, FestungswaldOst, PostenketteWald, HauptlagerWald},
	Conditions = 	
	{
	},
}
 
 
---------------------------------------------------
--
--	Postpesistentes Spawnen
--
---------------------------------------------------
Darkelfen =
{
	X = 341,
	Y = 216,
	Range = 1,
	Chief = 2817,	-- Warlock Dark Elf 14
	WaitTime = 400,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
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
	Clan = 13, 
	Groups = {Darkelfen},
Conditions = {},
}   
    
RtsSpawn
{
	Clan = 13, MaxClanSize = 30,
	Groups = {Darkelfen},
	Conditions = 	
	{
	},
}
 
Darkelfen2 =
{
	X = 359,
	Y = 233,
	Range = 1,
	Chief = 2818,	-- Warlock Dark Elf 14
	WaitTime = 400,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
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
	Groups = {Darkelfen2},
	Conditions = {},
}
 
RtsSpawn
{
	Clan = 12, MaxClanSize = 30,
	Groups = {Darkelfen2},
	Conditions = 	
	{
	},
}