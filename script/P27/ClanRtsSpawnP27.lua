-- RTS Spawn:
-- p27 Nightwisper Dale
--Monumentenclaim

GlobalSpawnDuration = 150

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
		ODER(IsMonumentInUse {X = 387, Y = 44, Range = 0}, IsMonumentInUse {X = 431, Y = 85, Range = 0}),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "NightwisperDaleMonumentClaimedTimer"},
	}
}

-- RTS SPAWN, Sabertooth
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 375,
	Y = 267,
	Range = 6,
	
	
	Timer	= "NightwisperDaleMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1424, 1424, 1425, 1425}, 	--Tiger
	SpawnData =
	{
		[7]		= {Minutes = 2.7, 	Units = {1354}},	
		[23]	= {Minutes = 2.4, 	Units = {1354}},	
		[38]	= {Minutes = 2, 	Units = {1424}}, 	
		[49]	= {Minutes = 1.5, 	Units = {1354}},
		[69]	= {Seconds = 50, 	Units = {1425}},
	},
	NpcBuildingsExist = {X = 375, Y = 267, Range = 7},     
}


-- RTS SPAWN, Sabertooth II
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 20,
	X = 377,
	Y = 233,
	Range = 6,
	
	
	Timer	= "NightwisperDaleMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1354, 1424, 1425, 1425}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 2.9, 	Units = {1354}},	
		[23]	= {Minutes = 2.6, 	Units = {1354, 1425}},	
		[35]	= {Minutes = 2.5, 	Units = {1354, 1425}}, 	
		[45]	= {Minutes = 1.5, 	Units = {1354, 1424}},
		[70]	= {Seconds = 50, 	Units = {1424}},
	},
	NpcBuildingsExist = {X = 377, Y = 233, Range = 10},     
}

-- RTS SPAWN, Sabertooht III
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 14,
	X = 431,
	Y = 208,
	Range = 6,
	
	
	Timer	= "NightwisperDaleMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1424, 1424, 1424, 1425}, 	--Tiejer
	SpawnData =
	{
		[0]		= {Minutes = 2.7, 	Units = {1354}},	
		[18]	= {Minutes = 2.5, 	Units = {1354}},	
		[33]	= {Minutes = 2.2, 	Units = {1354}}, 	
		[49]	= {Minutes = 1.5, 	Units = {1354}},
		[70]	= {Seconds = 50, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 431, Y = 208, Range = 15},     
}

-- RTS SPAWN, Sabertooth IV
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 14,
	X = 461,
	Y = 165,
	Range = 6,
	
	
	Timer	= "NightwisperDaleMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1354, 1354, 1354, 1354}, 	--Tiejer
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1354}},	
		[21]	= {Minutes = 3, 	Units = {1354}},	
		[42]	= {Minutes = 2.5, 	Units = {1354}}, 	
		[69]	= {Minutes = 1.5, 	Units = {1354}},
		[88]	= {Seconds = 50, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 461, Y = 165, Range = 7},     
}

-- RTS SPAWN,  Blades
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 8,
	X = 360,
	Y = 78,
	Range = 3,
	
	
	Timer	= "NightwisperDaleMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 306, 306, 306, 306, 306, 306, 306, 306, 306}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306}},	
	},
	NpcBuildingsExist = {X = 366, Y = 78, Range = 0},
}


-- RTS SPAWN,  Blades
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 8,
	X = 411,
	Y = 107,
	Range = 3,
	
	
	Timer	= "NightwisperDaleMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 306, 305, 306, 306, 305, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306, 305}},
		[23]	= {Minutes = 3, 	Units = {306, 305}},	
		[42]	= {Minutes = 2.5, 	Units = {306, 305}}, 	
		[69]	= {Minutes = 1.5, 	Units = {306, 305}},
		[88]	= {Seconds = 50, 	Units = {306, 306, 305}},	
	},
	NpcBuildingsExist = {X = 411, Y = 107, Range = 7},
}

-- RTS SPAWN, Sabertooth Sumpf
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 20,
	X = 274,
	Y = 112,
	Range = 6,
	
	
	Timer	= "NightwisperDaleMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1424, 1424, 1425, 1425}, 	--Tiejer
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1354, 1424, 1425}},	
		[21]	= {Minutes = 3, 	Units = {1354, 1424, 1425}},	
		[42]	= {Minutes = 2.5, 	Units = {1354, 1424, 1424, 1424, 1425}}, 	
		[69]	= {Minutes = 1.5, 	Units = {1424}},
		[88]	= {Seconds = 50, 	Units = {1425}},
	},
	NpcBuildingsExist = {X = 274, Y = 112, Range = 12},     
}