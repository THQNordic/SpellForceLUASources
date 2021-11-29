-- RTS Spawn:
-- p213 Bone Temple

GlobalSpawnDuration = 360

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		ODER9
		{
			IsMonumentInUse {X = 124, Y = 423, Range = 0, UpdateInterval = 10},
			IsMonumentInUse {X = 91, Y = 422, Range = 0, UpdateInterval = 10},
			IsMonumentInUse {X = 92, Y = 391, Range = 0, UpdateInterval = 10},
			IsMonumentInUse {X = 124, Y = 392, Range = 0, UpdateInterval = 10},
			IsMonumentInUse {X = 279, Y = 300, Range = 0, UpdateInterval = 10},
			IsMonumentInUse {X = 263, Y = 301, Range = 0, UpdateInterval = 10},
			IsMonumentInUse {X = 263, Y = 385, Range = 0, UpdateInterval = 10},
			IsMonumentInUse {X = 280, Y = 284, Range = 0, UpdateInterval = 10},
		},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "t_P213_MonumentTimer"},
	}
}


----Erstes Mumien Camp im Norden
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 268,
	Y = 449,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2427, 2428, 2429 ,2430 ,2431, 2427, 2428, 2429 ,2430 ,2431}, 	--40 Melee, 38 Pest, 38 Lifetap, 38 Schwert, 38 Poison
	SpawnData =
	{
		[0]		= {Minutes = 2.5, 	Units = {2428}},
		[15]	= {Minutes = 2, 	Units = {2429}},
		[23]	= {Minutes = 1.8, 	Units = {2429, 2430}},
		[45]	= {Minutes = 1.6, 	Units = {2431, 2427, 2429}},
		[70]	= {Minutes = 1.5, 	Units = {2427}},
	},
	NpcBuildingsExist = {X = 268, Y = 449, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_EinsCampMumien"},},
	
}

--Mumien am Eisen
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 8,
	X = 233,
	Y = 384,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2427, 2428, 2429 ,2430, 2430, 2429 ,2430, 2430}, 	--40 Melee, 38 Melee, 38 Lifetap, 38 Schwert
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2428}},
		[25]	= {Minutes = 3, 	Units = {2428, 2430}},
		[35]	= {Minutes = 2, 	Units = {2431, 2430, 2430}},
		[69]	= {Minutes = 1.5, 	Units = {2431}},
	},
	NpcBuildingsExist = {X = 236, Y = 384, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_ZweiCampMumien"},},
}
 
 
----Gottesanbeterinnen Nordoestliche Ecke
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 15,
	X = 409,
	Y = 471,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2450, 2450, 2450 ,2450 ,2450, 2450}, 	--Mantis
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2450}},
		[23]	= {Minutes = 3, 	Units = {2450}},
		[42]	= {Minutes = 2, 	Units = {2450}},
		[69]	= {Minutes = 1.5, 	Units = {2450}},
	},
	NpcBuildingsExist = {X = 419, Y = 468, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_EinsCampMantis"},},
}

----Gottesanbeterinnen im Osten an den Ruinen
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 12,
	X = 429,
	Y = 417,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",
	Init	= {2450, 2450, 2450 ,2450 ,2450, 2450}, 	--Mantis
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2450}},
		[23]	= {Minutes = 3, 	Units = {2450}},
		[42]	= {Minutes = 2, 	Units = {2450}},
		[69]	= {Minutes = 1.5, 	Units = {2450}},
	},
	NpcBuildingsExist = {X = 429, Y = 422, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_ZweiCampMantis"},},
	
}

----Gottesanbeterinnen im Osten etwas weiter südlich
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 6,
	X = 440,
	Y = 402,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",
	Init	= {2450, 2450, 2450 ,2450 ,2450, 2450}, 	--Mantis
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2450}},
		[42]	= {Minutes = 1.5, 	Units = {2450}},
	},
	NpcBuildingsExist = {X = 445, Y = 402, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_DreiCampMantis"},},
	
}
-- Rohstoffquelle unterhalb der Festung

RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 12,
	X = 407,
	Y = 415,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",
	Init	= {2450, 2450, 2450}, 	--Mantis
	SpawnData =
	{
		[23]	= {Minutes = 3, 	Units = {2450}},
		[42]	= {Minutes = 1.5, 	Units = {2450}},
		[69]	= {Minutes = 1, 	Units = {2450}},
	},
	NpcBuildingsExist = {X = 400, Y = 415, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_VierCampMantis"},},
	
}


----Noerdliches Bladelager vor dem Tor
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 17,
	X = 148,
	Y = 206,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2483, 2483, 2485, 2485}, -- 35 Weaver, 32 Minion
	SpawnData =
	{
		[25]	= {Minutes = 3.5, 	Units = {2485, 2485, 2485, 2537}},
		[57]	= {Minutes = 3, 	Units = {2485, 2485, 2483}},
		[87]	= {Minutes = 2.7, 	Units = {2485, 2483}},
		[108]	= {Minutes = 2, 	Units = {2483}},
	},
	NpcBuildingsExist = {X = 138, Y = 298, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_EinsCampBlades"},},
}
 
----Suedliches Bladelager vor dem Tor
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 20,
	X = 183,
	Y = 179,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2483, 2483, 2485, 2483, 2485, 2485}, -- 35 Weaver, 32 Minion
	SpawnData =
	{
		[17]	= {Minutes = 4, 	Units = {2485}},
		[54]	= {Minutes = 3, 	Units = {2485, 2485, 2483}},
		[84]	= {Minutes = 2.7, 	Units = {2485, 2483}},
		[105]	= {Minutes = 2, 	Units = {2483}},
	},
	NpcBuildingsExist = {X = 183, Y = 179, Range = 7},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_ZweiCampBlades"},},
}


----Erster Teil Festung Norden
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 12,
	X = 76,
	Y = 169,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2483, 2483, 2485, 2485}, -- 35 Weaver, 32 Minion
	SpawnData =
	{
		[23]	= {Minutes = 4.5, 	Units = {2485}},
		[60]	= {Minutes = 3.5, 	Units = {2485, 2485, 2483}},
		[91]	= {Minutes = 3, 	Units = {2485, 2483}},
		[109]	= {Minutes = 2.5, 	Units = {2483}},
	},
	NpcBuildingsExist = {X = 80, Y = 173, Range = 5},
}

--Erster Teil Festung suedliche Blades
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 20,
	X = 114,
	Y = 147,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2483, 2483, 2485, 2483, 2485}, -- 35 Weaver, 32 Minion
	SpawnData =
	{
		[27]	= {Minutes = 4, 	Units = {2485}},
		[64]	= {Minutes = 3.5, 	Units = {2485, 2485, 2483}},
		[94]	= {Minutes = 2.9, 	Units = {2485, 2483}},
		[115]	= {Minutes = 2.2, 	Units = {2483}},
	},
	NpcBuildingsExist = {X = 104, Y = 141, Range = 0},
}


--Oben an der Treppe
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 17,
	X = 30,
	Y = 150,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2483, 2485, 2485}, -- 35 Weaver, 32 Minion
	SpawnData =
	{
		[25]	= {Minutes = 4.1, 	Units = {2485}},
		[59]	= {Minutes = 3.6, 	Units = {2485, 2483}},
		[85]	= {Minutes = 2.7, 	Units = {2485, 2483}},
		[107]	= {Minutes = 2, 	Units = {2483}},
	},
	NpcBuildingsExist = {X = 27, Y = 157, Range = 0},
}

--Nächstes Bladecamp
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 25,
	X = 35,
	Y = 94,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2483, 2485, 2485, 2483, 2485, 2483, 2485}, -- 35 Weaver, 32 Minion
	SpawnData =
	{
		[35]	= {Minutes = 4.1, 	Units = {2485}},
		[69]	= {Minutes = 3.6, 	Units = {2485, 2483}},
		[95]	= {Minutes = 2.7, 	Units = {2485, 2483}},
		[117]	= {Minutes = 2, 	Units = {2483}},
	},
	NpcBuildingsExist = {X = 29, Y = 90,Range = 5},
}

----letztes Bladelager
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 20,
	X = 82,
	Y = 98,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2483, 2483, 2485, 2483, 2485, 2485}, -- 35 Weaver, 32 Minion
	SpawnData =
	{
		[32]	= {Minutes = 4.5, 	Units = {2485}},
		[69]	= {Minutes = 3.5, 	Units = {2485, 2485, 2483}},
		[99]	= {Minutes = 2.7, 	Units = {2485, 2483}},
		[123]	= {Minutes = 2.4, 	Units = {2483}},
	},
	NpcBuildingsExist = {X = 95, Y = 98, Range = 7},
}

--Gottesanbeterinnen auf dem Plateau
RtsSpawnNT
{
	Clan = 14,
	MaxClanSize = 6,
	X = 358,
	Y = 256,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",
	Init	= {2449, 2449, 2449 ,2449 ,2449, 2449}, 	--Mantis
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2449}},
		[42]	= {Minutes = 1.5, 	Units = {2450}},
	},
	NpcBuildingsExist = {X = 358, Y = 258, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P213_VierCampMantis"},},
	
}

--Muskelmaennchen vor dem zweiten Aufbau
RtsSpawnNT
{
	Clan = 13,
	MaxClanSize = 25,
	X = 312,
	Y = 297,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",
	Init	= {2432, 2432, 2432 ,2433 ,2433, 2434}, 	--35 Melee, 36 Bogen ,36 Caster
	SpawnData =
	{
		[23]	= {Minutes = 2.5, 	Units = {2432}},
		[42]	= {Minutes = 1.5, 	Units = {2432}},
	},
	NpcBuildingsExist = {X = 312, Y = 297, Range = 7},
	
}

--Gottesanbeterinnen auf dem Plateau hinter den Mumien
RtsSpawnNT
{
	Clan = 14,
	MaxClanSize = 6,
	X = 281,
	Y = 342,
	Range = 3,
	
	
	Timer	= "t_P213_MonumentTimer",
	Init	= {2449, 2449, 2449 ,2449 ,2449, 2449}, 	--Mantis
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2449}},
		[23]	= {Minutes = 2, 	Units = {2450}},
		[42]	= {Minutes = 1.5, 	Units = {2450}},
	},
	NpcBuildingsExist = {X = 281, Y = 342, Range = 10},
	
}
-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------



AufbauEinsZwei =
{
	X = 88,
	Y = 345,
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
	ShuffleUnits = FALSE,
	
}

Mumiencamp =
{
	X = 299,
	Y = 419,
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
		
		
		348		-- Wild Boar
		
	},                    
	ShuffleUnits = FALSE,
	
}

--Manticora =
--{
--	X = 461,
--	Y = 342,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		352,	--Animal Buffalo
--	},                    
--	ShuffleUnits = TRUE,
--	
--}

AufbauZwei =
{
	X = 289,
	Y = 263,
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
		352,	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 4, 
	Groups = {AufbauEinsZwei, Mumiencamp, AufbauZwei},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 4, MaxClanSize = 30,
	Groups = {AufbauEinsZwei, Mumiencamp, AufbauZwei},
	Conditions = 	
	{
	},
}
