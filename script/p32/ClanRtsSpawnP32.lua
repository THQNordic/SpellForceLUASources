-- RTS Spawn:
-- p32 Sharrowdale
--Monumentenclaim

GlobalSpawnDuration = 180

-- Erste Ebene
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
		ODER(IsMonumentInUse {X = 80, Y = 201, Range = 0}, ODER (IsMonumentInUse {X = 78, Y = 109, Range = 0}, IsMonumentInUse {X = 157, Y = 191, Range = 0})),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "SharrowdaleMonumentClaimedTimer1"},
	}
}
-- Zweite Ebene
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
		ODER(IsMonumentInUse {X = 446, Y = 180, Range = 0}, ODER (IsMonumentInUse {X = 374, Y = 268, Range = 0}, IsMonumentInUse {X = 302, Y = 229, Range = 0})),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "SharrowdaleMonumentClaimedTimer2"},
	}
}

-- RTS SPAWN, Greifennest
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 24,
	X = 176,
	Y = 79,
	Range = 3,
	
	
	Timer	= "SharrowdaleMonumentClaimedTimer1",-- 
	Init	= {1049, 1049, 1049, 587, 587}, 	--Drachlinge und Manticoras
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1049, 587}},
		[23]	= {Minutes = 2.4, 	Units = {1049, 587}},	
		[42]	= {Minutes = 1.8, 	Units = {1049, 587}}, 	
		[69]	= {Minutes = 1.6, 	Units = {1049, 587}},
		[88]	= {Minutes = 1, 	Units = {1049, 587}},	
	},
	NpcBuildingsExist = {X = 181, Y = 67, Range = 12},     
}


-- RTS SPAWN, Blades
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 16,
	X = 317,
	Y = 67,
	Range = 3,
	
	
	Timer	= "SharrowdaleMonumentClaimedTimer1",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 306, 308, 306, 306, 306, 306}, 	--Blades
	SpawnData =
	{
		[0]		= {Minutes = 4.8, 	Units = {306}},	
		[23]	= {Minutes = 3.2, 	Units = {306}},	
		[35]	= {Minutes = 2.8, 	Units = {306}}, 	
		[45]	= {Minutes = 1.8, 	Units = {308}},
		[70]	= {Seconds = 60, 	Units = {306}},
	},
	NpcBuildingsExist = {X = 317, Y = 67, Range = 7},     
}

-- RTS SPAWN, Blades
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 16,
	X = 332,
	Y = 77,
	Range = 3,
	
	
	Timer	= "SharrowdaleMonumentClaimedTimer1",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 306, 306, 306, 306, 306, 306}, 	--Blades
	SpawnData =
	{
		[0]		= {Minutes = 4.8, 	Units = {306}},	
		[18]	= {Minutes = 4.2, 	Units = {306}},	
		[33]	= {Minutes = 2.5, 	Units = {306}}, 	
		[49]	= {Minutes = 1.8, 	Units = {306}},
		[70]	= {Seconds = 60, 	Units = {306}},
	},
	NpcBuildingsExist = {X = 321, Y = 74, Range = 0},     
}

-- RTS SPAWN, Gladiatorengeister
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 7,
	X = 430,
	Y = 115,
	Range = 3,
	
	
	Timer	= "SharrowdaleMonumentClaimedTimer2",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {305}, 	--Gladiatorengeister, wegen Ki im Editor gesetzt
	SpawnData =
	{
		[0]		= {Minutes = 4.2, 	Units = {1384}},	
		[0]		= {Minutes = 1.5, 	Units = {1384}},
		[21]	= {Minutes = 3.6, 	Units = {1384}},	
		[42]	= {Minutes = 2.6, 	Units = {1384}}, 	
		[69]	= {Minutes = 1.6, 	Units = {1384}},
		[88]	= {Seconds = 60, 	Units = {1384}},
	},
	NpcBuildingsExist = {X = 434, Y = 115, Range = 0},     
}

-- RTS SPAWN,  Gladiatorengeister
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 10,
	X = 425,
	Y = 107,
	Range = 3,
	
	
	Timer	= "SharrowdaleMonumentClaimedTimer2",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1384, 1384, 1384, 1384, 1384, 1384}, 	--Gladiatorengeister
	SpawnData =
	{
		[0]		= {Minutes = 4.2, 	Units = {1384}},	
		[23]	= {Minutes = 3.2, 	Units = {1384}},	
		[44]	= {Minutes = 2.2, 	Units = {1384}}, 	
		[69]	= {Minutes = 1.8, 	Units = {1384}},
		[88]	= {Seconds = 60, 	Units = {1384}},
	},
	NpcBuildingsExist = {X = 425, Y = 106, Range = 10},
}


-- RTS SPAWN,  Blades
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 20,
	X = 257,
	Y = 172,
	Range = 3,
	
	
	Timer	= "SharrowdaleMonumentClaimedTimer1",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 306, 305, 306, 306, 306, 306, 305, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3.6, 	Units = {306, 305}},
		[23]	= {Minutes = 3.2, 	Units = {306, 305}},	
		[42]	= {Minutes = 2.8, 	Units = {306, 305}}, 	
		[69]	= {Minutes = 1.6, 	Units = {306, 305}},
		[85]	= {Seconds = 60, 	Units = {306, 306, 305}},	
	},
	NpcBuildingsExist = {X = 257, Y = 172, Range = 7},
}

-- RTS SPAWN,  Blades
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 14,
	X = 220,
	Y = 289,
	Range = 3,
	
	
	Timer	= "SharrowdaleMonumentClaimedTimer2",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 1, 	Units = {306, 305}},
		[1]		= {Minutes = 3.5, 	Units = {306, 305}},
		[22]	= {Minutes = 2.9, 	Units = {306, 305}},	
		[43]	= {Minutes = 2.5, 	Units = {306, 305, 306, 305, 318}}, 	
		[68]	= {Minutes = 1.8, 	Units = {306, 305, 306, 305, 306, 305, 318}},
		[89]	= {Seconds = 60, 	Units = {306, 306, 305, 318, 312}},	
	},
	NpcBuildingsExist = {X = 220, Y = 289, Range = 12},
}

-- RTS SPAWN,  Blades
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 14,
	X = 214,
	Y = 277,
	Range = 3,
	
	
	Timer	= "SharrowdaleMonumentClaimedTimer2",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 4.2, 	Units = {306, 305}},
		[0]		= {Minutes = 3.5, 	Units = {306, 305}},
		[23]	= {Minutes = 3.6, 	Units = {306, 305, 314}},	
		[42]	= {Minutes = 2.4, 	Units = {306, 305}}, 	
		[71]	= {Minutes = 1.8, 	Units = {306, 305, 314}},
		[99]	= {Seconds = 60, 	Units = {306, 306, 305}},	
	},
	NpcBuildingsExist = {X = 204, Y = 277, Range = 0},
}