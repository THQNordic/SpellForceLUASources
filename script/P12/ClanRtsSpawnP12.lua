-- RTS Spawn:
-- p12 Greydusk Vale

GlobalSpawnDuration = 180

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
		ODER(ODER(ODER(IsMonumentInUse {X = 110, Y = 191, Range = 0}, IsMonumentInUse {X = 58, Y = 394, Range = 0}),IsMonumentInUse {X = 173, Y = 299, Range = 0}),IsMonumentInUse {X = 181, Y = 268, Range = 0}),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "GreyduskMonumentClaimedTimer"},
	}
}

-- RTS SPAWN,  Trollsiedlung defense
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 4,
	X = 87,
	Y = 376,
	Range = 3,
	
	
	Timer	= "GreyduskMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {439, 439, 439, 439, 439, 439, 440, 440}, 	--Troll Urok Rowdy 10/Thrower 10
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {439}},	
		[23]	= {Minutes = 3, 	Units = {440}},	
		[35]	= {Minutes = 2.5, 	Units = {439}}, 	
		[45]	= {Minutes = 1.5, 	Units = {439, 439, 440}},
		[69]	= {Seconds = 50, 	Units = {439, 439, 440, 440}},
	},
	NpcBuildingsExist = {X = 91, Y = 364, Range = 9},     
}

-- RTS SPAWN,  Trollsiedlung offense
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 20,
	X = 83,
	Y = 390,
	Range = 3,
	
	
	Timer	= "GreyduskMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {439, 439, 439, 439, 439, 439, 440, 440}, 	--Troll Urok Rowdy 10/Thrower 10
	SpawnData =
	{
		[0]		= {Minutes = 2, 	Units = {439}},	
		[23]	= {Minutes = 2, 	Units = {440}},	
		[32]	= {Minutes = 1.5, 	Units = {439}}, 	
		[46]	= {Minutes = 1.5, 	Units = {439, 439, 440}},
		[69]	= {Minutes = 1, 	Units = {439, 439, 440, 440}},
	},
	NpcBuildingsExist = {X = 83, Y = 390, Range = 9},     
}

-- Trollsiedlung defense II
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 2,
	X = 108,
	Y = 383,
	Range = 3,
	
	
	Timer	= "GreyduskMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {439, 439, 439, 439, 439, 439, 440, 440}, 	--Troll Urok Rowdy 10/Thrower 10
	SpawnData =
	{
		[0]		= {Minutes = 1.5, 	Units = {439}},
	},
	NpcBuildingsExist = {X = 108, Y = 383, Range = 9},     
}

--Caynyon hinter Zihar
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 423,
	Y = 273,
	Range = 3,
	
	
	Timer	= "GreyduskMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {146, 146, 146, 146, 147, 147, 149, 149}, 	--Skeleton 8 2H-Schwert/Stachelkeule + Schild/Bow
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {146}},	
		[23]	= {Minutes = 3, 	Units = {147}},	
		[69]	= {Minutes = 1.5, 	Units = {146, 146, 147, 149}},
	},
	NpcBuildingsExist = {X = 422, Y = 270, Range = 0},     
}



--nördliches Plateaucamp
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 30,
	X = 209,
	Y = 371,
	Range = 3,
	
	
	Timer	= "GreyduskMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {146, 146, 146, 146, 147, 147, 149, 280}, 	--Skeleton 8 2H-Schwert/Stachelkeule + Schild/Bow, Wraith Lifetap
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {146}},	
		[23]	= {Minutes = 3, 	Units = {147}},	
		[33]	= {Minutes = 2.5, 	Units = {146, 147, 149}}, 
		[46]	= {Minutes = 2, 	Units = {146, 147}},	
		[69]	= {Minutes = 1.5, 	Units = {146, 280, 147, 149}},
	},
	NpcBuildingsExist = {X = 210, Y = 373, Range = 10},     
}

--suedliches Plateaucamp
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 30,
	X = 219,
	Y = 140,
	Range = 3,
	
	
	Timer	= "GreyduskMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {146, 146, 146, 146, 147, 147, 149, 280}, 	--Skeleton 8 2H-Schwert/Stachelkeule + Schild/Bow, Wraith Lifetap
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {146}},	
		[23]	= {Minutes = 2.5, 	Units = {147}},	
		[33]	= {Minutes = 2, 	Units = {146, 147, 149}}, 	
		[69]	= {Minutes = 1.5, 	Units = {146, 146, 147, 149}},
	},
	NpcBuildingsExist = {X = 220, Y = 137, Range = 5},     
}

--Norden bei den Höhlen
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 15,
	X = 338,
	Y = 455,
	Range = 3,
	
	
	Timer	= "GreyduskMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {281, 281, 281, 281, 281, 281, 281, 280}, 	-- Wraith Sense/ Lifetap
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {281}},	
		[23]	= {Minutes = 3.5, 	Units = {281}},	
		[36]	= {Minutes = 2, 	Units = {281, 281, 280}}, 	
		[69]	= {Minutes = 2, 	Units = {281, 281, 280, 280}},
	},
	NpcBuildingsExist = {X = 338, Y = 459, Range = 0},     
}


--Sueden bei den Höhlen
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 15,
	X = 309,
	Y = 89,
	Range = 3,
	
	
	Timer	= "GreyduskMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {281, 281, 281, 281, 281, 281, 281, 280}, 	-- Wraith Sense/ Lifetap
	SpawnData =
	{
		[0]		= {Minutes = 4.5, 	Units = {281}},	
		[17]	= {Minutes = 4, 	Units = {281}},	
		[34]	= {Minutes = 2.5, 	Units = {281, 281, 280}}, 	
		[44]	= {Minutes = 2, 	Units = {281, 281, 280, 280}},
	},
	NpcBuildingsExist = {X = 312, Y = 85, Range = 0},     
}








-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Aufbaugebiet =
{
	X = 90,
	Y = 272,
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
		352, 352, 352, 352, 352, 352, 352 	-- Animal Buffalo
		
	},                    
	ShuffleUnits = FALSE,
	
}


MonumentNoerdlich =
{
	X = 128,
	Y = 286,
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
		348, 348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = FALSE,
	
}

Portal =
{
	X = 64,
	Y = 187,
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
		352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

RichtungTrollLager =
{
	X = 67,
	Y = 315,
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
		352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

TrollLager =
{
	X = 114,
	Y = 391,
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
		348, 348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = FALSE,
	
}

TrollLager2 =
{
	X = 87,
	Y = 403,
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
		345		--Animal Blackbear
	},                    
	ShuffleUnits = FALSE,
	
}

AmSee =
{
	X = 188,
	Y = 372,
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
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

Festung =
{
	X = 225,
	Y = 241,
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
		352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

SeeZwei =
{
	X = 313,
	Y = 292,
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
		352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}





InitSpawn
{
	Clan = 17, 
	Groups = {Aufbaugebiet, MonumentNoerdlich, Portal, RichtungTrollLager, TrollLager, TrollLager2, AmSee, Festung, SeeZwei},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 17, MaxClanSize = 90,
	Groups = {Aufbaugebiet, MonumentNoerdlich, Portal, RichtungTrollLager, TrollLager, TrollLager2, AmSee, Festung, SeeZwei},
	Conditions = 	
	{
	},
}

---------------------------------------------------
--
--	Postpersistentes Spawnen
--
---------------------------------------------------
--Troll1 =
--{
--	X = 210,
--	Y = 374,
--	Range = 1,
--	Chief = 0,	-- Troll Urok Smasher
--	WaitTime = 60,
--	AvatarMinLevel = 18,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		440, 440, 440, 440, 440, --Troll Urok Thrower 
--		1021, 1021, 1021, 1021, 1021-- TrollUrok Smasher
--		
--	},                   
--	ShuffleUnits = FALSE,
--}
--
--InitSpawn
--{
--	Clan = 16, 
--	Groups = {Troll1},
--	Conditions = {},
--}
--
--RtsSpawn
--{
--	Clan = 16, MaxClanSize = 12,
--	Groups = {Troll1},
--	Conditions = 	
--	{
--	},
--}
--
--
--Spinnen =
--{
--	X = 329,
--	Y = 88,
--	Range = 1,
--	Chief = 0,	-- Spider Green 11 Major
--	WaitTime = 60,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		752, 752, 752, 752, 752, 752, 752 -- Spider Tiny Green 3	
--	},                   
--	ShuffleUnits = FALSE,
--}
--
--InitSpawn
--{
--	Clan = 15, 
--	Groups = {Spinnen},
--	Conditions = {},
--}
--
--RtsSpawn
--{
--	Clan = 15, MaxClanSize = 12,
--	Groups = {Spinnen},
--	Conditions = 	
--	{
--	},
--}