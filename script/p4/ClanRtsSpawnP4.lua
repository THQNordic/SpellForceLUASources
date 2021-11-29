-- RTS Spawn:
-- p4 Leafshade

GlobalSpawnDuration = 120

--Timer für den Spawnkram starten

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		ODER (IsMonumentInUse {X = 281, Y = 135, Range = 10, UpdateInterval = 10}, ODER( IsMonumentInUse {X = 228, Y = 182, Range = 0, UpdateInterval = 10}, IsMonumentInUse {X = 283, Y = 371, Range = 0, UpdateInterval = 10}))
	}, 
	Actions = 
	{
		SetGlobalTimeStamp{Name = "LeafshadeMonumentClaimedTimer"},
	},
}
-- Caynyon durchschritten
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		FigureDead {NpcId = 3133},
	},
	Actions = 
	{
		SetGlobalTimeStamp {Name = "LeafShadeCaynyonCrossingTimer"},
	},
}




----Gobblins Endfestung Erstes Haus im Norden
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 35,
	X = 385,
	Y = 301,
	Range = 3,
	
	
	Timer	= "LeafShadeCaynyonCrossingTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {658, 838, 265}, 	--Goblin Brw. Metall, Gre. Kurzschwert, Gre. Fireburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {838}},
		[15]	= {Minutes = 3.5, 	Units = {779, 784}},
		[25]	= {Minutes = 3, 	Units = {658, 667}},
		[45]	= {Minutes = 2, 	Units = {267, 667, 838}},
		[70]	= {Minutes = 1.5, 	Units = {265, 658, 267}},
	},
	NpcBuildingsExist = {X = 387, Y = 304, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "WoodCamp1"},}
	
}

---- Gobblins Endfestung erstes Haus im Süden
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 30,
	X = 375,
	Y = 294,
	Range = 2,
	
	
	Timer	= "LeafShadeCaynyonCrossingTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {265, 658, 267}, 	-- Gobbos
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {779, 838}},
		[24]	= {Minutes = 2.5, 	Units = {658, 784}},
		[36]	= {Minutes = 2, 	Units = {267, 667}},
		[59]	= {Minutes = 1.5, 	Units = {779, 267, 667}},
		[71]	= {Minutes = 1, 	Units = {838, 658, 838}},
	},
	NpcBuildingsExist = {X = 372, Y = 290, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "WoodCamp2"},}
}


---- RTS SPAWN, Gobblins Hohe Wacht
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 35,
	X = 249,
	Y = 213,
	Range = 3,
	
	
	Timer	= "LeafshadeMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {779, 779, 267, 667}, 	
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {267, 667}},     
		[26]	= {Minutes = 2.5, 	Units = {779, 784}},     
		[34]	= {Minutes = 2, 	Units = {658, 784}},     
		[61]	= {Minutes = 1, 	Units = {779, 267, 265}},
		[69]	= {Seconds = 50, 	Units = {265, 658, 838}},

	},
	NpcBuildingsExist = {X = 249, Y = 213, Range = 8},
}



---- RTS SPAWN,Holzfäller 1 Gobblins
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 429,
	Y = 265,
	Range = 1,
	
	
	Timer	= "LeafShadeCaynyonCrossingTimer",
	Init	= {265, 658, 267}, 	-- Gobbos
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {838}},
		[15]	= {Minutes = 4, 	Units = {779, 784}},
		[25]	= {Minutes = 3, 	Units = {658, 667}},
		[45]	= {Minutes = 2.5, 	Units = {267, 667, 838}},
		[70]	= {Seconds = 50, 	Units = {265, 658, 267}},
	},
	NpcBuildingsExist = {X = 430, Y = 267, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "WoodCamp3"},}
}
  
-- RTS SPAWN,Holzfäller 1 Orks
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 35,
	X = 417,
	Y = 250,
	Range = 3,
	
	
	Timer	= "LeafShadeCaynyonCrossingTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1156, 895}, 	
	SpawnData =
	{
		[15]	= {Minutes = 3.5, 	Units = {884, 895}},
		[30]	= {Minutes = 3, 	Units = {1156, 884}},
		[40]	= {Minutes = 2.5, 	Units = {1156, 895}},
		[60]	= {Minutes = 2, 	Units = {1156, 884}},
		[85]	= {Minutes = 1.5, 	Units = {1156, 895, 884}},
	},
	NpcBuildingsExist = {X = 417, Y = 250, Range = 7},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "WoodCamp4"},}
}

------ RTS SPAWN, Orcs/Gobbos Nachschublager
--RtsSpawnNT
--{
--	Clan = 22,
--	MaxClanSize = 50,
--	X = 392,
--	Y = 184,
--	Range = 3,
--	
--	
--	Timer	= "LeafShadeCaynyonCrossingTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {1156, 895, 658}, 	
--	SpawnData =
--	{
--		[15]	= {Minutes = 3, 	Units = {265, 838}},
--		[30]	= {Minutes = 2.5, 	Units = {1156, 884}},
--		[40]	= {Minutes = 2, 	Units = {658, 667}},
--		[60]	= {Minutes = 1.5, 	Units = {267, 667, 838}},
--		[85]	= {Minutes = 1, 	Units = {1156, 895, 884}},
--	},
--	NpcBuildingsExist = {X = 392, Y = 184, Range = 9},
--	CampDestroyedActions = {SetGlobalFlagTrue{Name = "Reinforcement1"},}
--}


-- RTS SPAWN, Aufbaustörer/Plänkler
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 8,
	X = 117,
	Y = 213,
	Range = 3,
	
	
	Timer	= "LeafshadeMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {852, 851, 743}, 	-- Bandit Metallkeule, Schwert, Scharfschütze
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {852, 851}},
	},
	NpcBuildingsExist = {X = 113, Y = 216, Range = 1},
}


-- RTS SPAWN, Gobblinfraktion Hauptcamp/Lookout
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 40,
	X = 209,
	Y = 316,
	Range = 3,
	
	
	Timer	= "LeafshadeMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1176}, 	-- Westmannbarbaren
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {1176}},
		[15]	= {Minutes = 3, 	Units = {1176}},
		[25]	= {Minutes = 2.5, 	Units = {1176}},
		[45]	= {Minutes = 1.5, 	Units = {267, 667, 838}},
		[70]	= {Seconds = 50, 	Units = {838, 658, 267}},
	},
	NpcBuildingsExist = {X = 209, Y = 319, Range = 8},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "MainCamp4"},}
	
}


-- RTS SPAWN, OrcsHauptlager 1
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 10,
	X = 160,
	Y = 340,
	Range = 3,
	
	
	Timer	= "LeafshadeMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1156, 895, 1156, 895, 1156, 895, 1156, 895}, 	
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {1156, 884}},
	},
	NpcBuildingsExist = {X = 159, Y = 342, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "MainCamp3"},}
}

---- RTS SPAWN, Orks Hauptlager 2 (ehemals Shamane)
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 40,
	X = 202,
	Y = 380,
	Range = 3,
	Timer	= "LeafshadeMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1156, 895}, 	
	SpawnData =
	{
		[15]	= {Minutes = 3, 	Units = {1156, 895}},
		[30]	= {Minutes = 3, 	Units = {895, 884}},
		[40]	= {Minutes = 2, 	Units = {1156, 884}},
		[60]	= {Minutes = 2, 	Units = {1156, 884}},
		[85]	= {Minutes = 1.5, 	Units = {1156, 895, 884}},
	},
	NpcBuildingsExist = {X = 192, Y = 384, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "MainCamp2"},}
}


---- RTS SPAWN, Fernkämpfer
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 40,
	X = 210,
	Y = 350,
	Range = 3,
	
	
	Timer	= "LeafshadeMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {743, 743, 832, 831}, 	-- Briganten Schützen; Banditen Keule Schwert
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {743, 832}},
		[15]	= {Minutes = 2.5, 	Units = {743, 831}},
		[25]	= {Minutes = 1.5, 	Units = {743, 832, 831}},
		[45]	= {Minutes = 1, 	Units = {743, 832, 831}},
		[70]	= {Seconds = 50, 	Units = {743, 832, 831}},
	},
	NpcBuildingsExist = {X = 210, Y = 350, Range = 15},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "MainCamp1"},}
}


---- RTS SPAWN, Nachschublager 1
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 40,
	X = 421,
	Y = 233,
	Range = 3,
	Timer	= "LeafShadeCaynyonCrossingTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1156, 895}, 	
	SpawnData =
	{
		[15]	= {Minutes = 3, 	Units = {1156, 895}},
		[30]	= {Minutes = 3, 	Units = {895, 884}},
		[40]	= {Minutes = 2, 	Units = {1156, 884}},
		[60]	= {Minutes = 2, 	Units = {1156, 884}},
		[85]	= {Minutes = 1.5, 	Units = {1156, 895, 884}},
	},
	NpcBuildingsExist = {X = 423, Y = 235, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "Reinforcement1"},}
}


---- RTS SPAWN, Nachschublager 2
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 40,
	X = 438,
	Y = 245,
	Range = 3,
	Timer	= "LeafShadeCaynyonCrossingTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1156, 895}, 	
	SpawnData =
	{
		[15]	= {Minutes = 3.5, 	Units = {1156, 884}},
		[30]	= {Minutes = 3, 	Units = {895, 884}},
		[40]	= {Minutes = 2.5, 	Units = {1156, 895}},
		[60]	= {Minutes = 2, 	Units = {1156, 884}},
		[85]	= {Minutes = 1.5, 	Units = {1156, 895, 884}},
	},
	NpcBuildingsExist = {X = 438, Y = 245, Range = 15},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "Reinforcement2"},}
}

--
-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
WildSchluchtZwischenHolzCamp =
{
	X = 308,
	Y = 216,
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
		354,			-- Animal Deer Old
		353, 353, 353,	-- Animal Deer Young
		355				-- Animal Moose
		
	},                    
	ShuffleUnits = TRUE,
	
}


WildBeiSpinnen =
{
	X = 340,
	Y = 383,
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
		
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

WildHolzCamp =
{
	X = 315,
	Y = 403,
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
		
		354,			-- Animal Deer Old
		353, 353, 353	-- Animal Deer Young
	},                    
	ShuffleUnits = TRUE,
	
}

SchweineMonument1 =
{
	X = 228,
	Y = 165,
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
		348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

SchweineMonument2 =
{
	X = 269,
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
		344,	-- Animal Brownbear
		353, 353, 353,	-- Animal Deer Young
		348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

SchweineStall =
{
	X = 329,
	Y = 232,
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
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

SuedSchweine =
{
	X = 229,
	Y = 116,
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
		344,	-- Animal Brownbear
		349,	--Animal Greywulf
		353, 353, 353,	-- Animal Deer Young
		348, 348, 348, 348 	-- Animal Wildboar
		
	},                    
	ShuffleUnits = TRUE,
	
}

WachtpostenWild =
{
	X = 187,
	Y = 277,
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

WachtpostenWild2 =
{
	X = 157,
	Y = 181,
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

WestKueste =
{
	X = 107,
	Y = 210,
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
		354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353, 353, 353	-- Animal Deer Young
	},                    
	ShuffleUnits = TRUE,
	
}



InitSpawn
{
	Clan = 14, 
	Groups = {WildSchluchtZwischenHolzCamp, WildBeiSpinnen, WildHolzCamp, SchweineMonument1, SchweineMonument2, SchweineStall, SuedSchweine, WachtpostenWild, WachtpostenWild2, WestKueste},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 90,
	Groups = {WildSchluchtZwischenHolzCamp, WildBeiSpinnen, WildHolzCamp, SchweineMonument1, SchweineMonument2, SchweineStall, SuedSchweine, WachtpostenWild, WachtpostenWild2, WestKueste},
	Conditions = 	
	{
	},
}
---------------------------------------------------
--
--	Postpesistentes Spawnen
--
---------------------------------------------------
-- Orks
Orks1 =
{
	X = 367,
	Y = 301,
	Range = 1,
	Chief = 2809,	-- Klingenwirbler 
	WaitTime = 15,
	AvatarMinLevel = 8,
	AvatarMaxLevel = 0,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "AfterSpawn"}, 
	},
	Units = 
	{
		1156, 876, 	-- Orc Fist 4 Spearman 
		884, 		-- Orc Fist 4 Veteran
		895			-- Orc Fist 4 Firemaste		
	},                   
	ShuffleUnits = TRUE,
}

InitSpawn
{
	Clan = 13, 
	Groups = {Orks1},
	Conditions = {},
}

RtsSpawn
{
	Clan = 13, MaxClanSize = 30,
	Groups = {Orks1},
	Conditions = 	
	{
	},
}


Orks2 =
{
	X = 213,
	Y = 376,
	Range = 1,
	Chief = 2810,	-- Klingenwirbler 
	WaitTime = 15,
	AvatarMinLevel = 8,
	AvatarMaxLevel = 0,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "AfterSpawn"}, 
	},
	Units = 
	{
		876, 876, 	-- Orc Fist 4 Spearman 
		884, 		-- Orc Fist 4 Veteran
		895			-- Orc Fist 4 Firemaste		
	},                   
	ShuffleUnits = TRUE,
}

InitSpawn
{
	Clan = 12, 
	Groups = {Orks2},
	Conditions = {},
}

RtsSpawn
{
	Clan = 12, MaxClanSize = 30,
	Groups = {Orks2},
	Conditions = 	
	{
	},
}



Orks3 =
{
	X = 317,
	Y = 182,
	Range = 1,
	Chief = 2811,	-- Klingenwirbler 
	WaitTime = 15,
	AvatarMinLevel = 8,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		741, 741, 741, 741, 741, 741, 741 -- Klingenwirbler
	},                   
	ShuffleUnits = FALSE,
}

InitSpawn
{
	Clan = 11, 
	Groups = {Orks3},
	Conditions = {},
}

RtsSpawn
{
	Clan = 11, MaxClanSize = 30,
	Groups = {Orks3},
	Conditions = 	
	{
	},
}


Darkelfen3 =
{
	X = 240,
	Y = 362,
	Range = 1,
	Chief = 2816,	-- Warlock Dark Elf 14
	WaitTime = 15,
	AvatarMinLevel = 20,
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
	Clan = 10, 
	Groups = {Darkelfen3},
	Conditions = {},
}

RtsSpawn
{
	Clan = 10, MaxClanSize = 30,
	Groups = {Darkelfen3},
	Conditions = 	
	{
	},
}