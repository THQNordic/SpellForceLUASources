-- RTS Spawn:
-- p30 Breathing Forest

GlobalSpawnDuration = 240

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions =
	{

		IsMonumentInUse {X = 443, Y = 424, Range = 0},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "BreathingForestMonumentClaimedTimer"},
	}
}

-- RTS SPAWN, Sabertooth
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 16,
	X = 423,
	Y = 130,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1424, 1425}, 	--Tiger
	SpawnData =
	{
		[7]		= {Minutes = 4.2, 	Units = {1354}},
		[27]	= {Minutes = 3.6, 	Units = {1424}},
		[45]	= {Minutes = 3, 	Units = {1425}},
		[59]	= {Minutes = 1.8, 	Units = {1424}},
		[103]	= {Seconds = 60, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 423, Y = 130, Range = 7},
}


-- RTS SPAWN, Sabertooth II
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 16,
	X = 434,
	Y = 133,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1424, 1425}, 	--Tijjeer
	SpawnData =
	{
		[1]		= {Minutes = 4.8, 	Units = {1425}},
		[44]	= {Minutes = 4.2, 	Units = {1354}},
		[72]	= {Minutes = 3, 	Units = {1424}},
		[88]	= {Minutes = 1.8, 	Units = {1425}},
		[138]	= {Minutes = 1.4, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 434, Y = 133, Range = 7},
}

-- RTS SPAWN, Sabertooht III
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 16,
	X = 327,
	Y = 122,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1354}, 	--Tiejer
	SpawnData =
	{
		[2]		= {Minutes = 3.6, 	Units = {1424, 1425, 1425}},
		[32]	= {Minutes = 3.3, 	Units = {1354}},
		[70]	= {Minutes = 3.2, 	Units = {1425}},
		[94]	= {Minutes = 3, 	Units = {1424}},
		[144]	= {Minutes = 1.8, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 327, Y = 122, Range = 10},
}

-- RTS SPAWN, Sabertooth IV
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 16,
	X = 365,
	Y = 207,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1354}, 	--Tiejer
	SpawnData =
	{
		[0]		= {Minutes = 4.8, 	Units = {1354, 1425}},
		[44]	= {Minutes = 4.6, 	Units = {1354}},
		[82]	= {Minutes = 3.5, 	Units = {1424}},
		[140]	= {Minutes = 2, 	Units = {1424}},
		[172]	= {Seconds = 60, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 365, Y = 207, Range = 5},
}

-- RTS SPAWN,  Blades
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 6,
	X = 355,
	Y = 209,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1424, 1425}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 4.7, 	Units = {1354, 1424}},
		[46]	= {Minutes = 3.7, 	Units = {1354}},
		[78]	= {Minutes = 3.2, 	Units = {1354, 1424}},
		[138]	= {Minutes = 1.4, 	Units = {1425}},
		[168]	= {Seconds = 60, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 355, Y = 209, Range = 7},
}


-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 8,
	X = 388,
	Y = 287,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1425, 1425}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 4.8, 	Units = {1425}},
		[40]	= {Minutes = 3.6, 	Units = {1425}},
		[90]	= {Minutes = 2.4, 	Units = {1425}},
		[144]	= {Minutes = 1.2, 	Units = {1425}},
		[170]	= {Seconds = 65, 	Units = {1425}},
	},
	NpcBuildingsExist = {X = 388, Y = 287, Range = 7},
}


-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 12,
	X = 423,
	Y = 329,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1354, 1425, 1425}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1424}},
		--[23]	= {Minutes = 3, 	Units = {1354}},
		[42]	= {Minutes = 3, 	Units = {1425}},
		[69]	= {Minutes = 2.3, 	Units = {1424}},
		[88]	= {Minutes = 1.9, 	Units = {1425}},
	},
	NpcBuildingsExist = {X = 423, Y = 329, Range = 7},
}


-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 6,
	X = 322,
	Y = 368,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1424, 1425}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 4.1, 	Units = {1354}},
		[20]	= {Minutes = 3.7, 	Units = {1354}},
		[40]	= {Minutes = 3.3, 	Units = {1354, 1424, 1425, 1425}},
		[60]	= {Minutes = 1.8, 	Units = {1354, 1424}},
		[80]	= {Seconds = 60, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 322, Y = 368, Range = 7},
}

-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 6,
	X = 210,
	Y = 432,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 4.4, 	Units = {1354}},
		[25]	= {Minutes = 3.6, 	Units = {1354}},
		[45]	= {Minutes = 3.2, 	Units = {1354, 1424, 1424, 1425}},
		[75]	= {Minutes = 2.4, 	Units = {1354}},
		[95]	= {Minutes = 2.0, 	Units = {1354, 1424, 1424, 1424, 1425, 1425, 1425}},
	},
	NpcBuildingsExist = {X = 210, Y = 432, Range = 5},
}

-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 16,
	X = 208,
	Y = 423,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1424, 1424, 1425}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 3.6, 	Units = {1354}},
		[23]	= {Minutes = 3.6, 	Units = {1424}},
		[39]	= {Minutes = 3, 	Units = {1425}},
		[69]	= {Minutes = 1.8, 	Units = {1425}},
		[99]	= {Seconds = 60, 	Units = {1424}},
	},
	NpcBuildingsExist = {X = 208, Y = 423, Range = 7},
}


-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 8,
	X = 75,
	Y = 384,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1424, 1354}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1354, 1425}},
		[40]	= {Minutes = 4.8, 	Units = {1354}},
		[90]	= {Minutes = 3.6, 	Units = {1354}},
		[140]	= {Minutes = 2.4, 	Units = {1354, 1424, 1424}},
		[170]	= {Seconds = 72, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 75, Y = 384, Range = 5},
}

-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 8,
	X = 65,
	Y = 384,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1424}, 	--Tijjeer
	SpawnData =
	{
		[5]		= {Minutes = 5.4, 	Units = {1425}},
		[28]	= {Minutes = 4.8, 	Units = {1354}},
		[47]	= {Minutes = 4.2, 	Units = {1354, 1424, 1424, 1424}},
		[74]	= {Minutes = 3.6, 	Units = {1425}},
		[93]	= {Seconds = 60, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 62, Y = 384, Range = 10},
}

---- RTS SPAWN,  Tiejer
--RtsSpawnNT
--{
--	Clan = 15,
--	MaxClanSize = 12,
--	X = 73,
--	Y = 357,
--	Range = 3,
--
--
--	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {1354, 1354, 1424, 1354}, 	--Tijjeer
--	SpawnData =
--	{
--		[3]		= {Minutes = 4.2, 	Units = {1354}},
--		[26]	= {Minutes = 3.6, 	Units = {1424}},
--		[45]	= {Minutes = 2.4, 	Units = {1354, 1425}},
--		[72]	= {Minutes = 2.1, 	Units = {1354}},
--		[91]	= {Seconds = 108, 	Units = {1354}},
--	},
--	NpcBuildingsExist = {X = 73, Y = 357, Range = 10},
--}

-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 14,
	MaxClanSize = 14,
	X = 70,
	Y = 321,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1354}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1354, 1424, 1424}},
		[46]	= {Minutes = 3.6, 	Units = {1354, 1424}},
		[84]	= {Minutes = 3, 	Units = {1354}},
		[138]	= {Minutes = 1.8, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 70, Y = 321, Range = 7},
}

-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 13,
	MaxClanSize = 6,
	X = 65,
	Y = 308,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 4.2, 	Units = {1354, 1425, 1425}},
		[23]	= {Minutes = 3.8, 	Units = {1424}},
		[39]	= {Minutes = 3.2, 	Units = {1354}},
		[69]	= {Minutes = 2.1, 	Units = {1425}},
		[75]	= {Seconds = 120, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 65, Y = 308, Range = 7},
}


-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 12,
	MaxClanSize = 8,
	X = 344,
	Y = 372,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1354, 1354, 1354, 1425, 1425}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 8.4, 	Units = {1424}},
		[17]	= {Minutes = 7.2, 	Units = {1424}},
		[36]	= {Minutes = 6, 	Units = {1425}},
		[49]	= {Minutes = 4.8, 	Units = {1354}},
		[66]	= {Seconds = 60, 	Units = {1354}},
	},
	NpcBuildingsExist = {X = 344, Y = 372, Range = 7},
}


-- RTS SPAWN,  Tiejer
RtsSpawnNT
{
	Clan = 11,
	MaxClanSize = 8,
	X = 335,
	Y = 363,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1424, 1424, 1424}, 	--Tijjeer
	SpawnData =
	{
		[0]		= {Minutes = 2.4, 	Units = {1424}},
		[23]	= {Minutes = 2.4, 	Units = {1424}},
		[48]	= {Minutes = 2.4, 	Units = {1424}},
		[83]	= {Minutes = 2.4, 	Units = {1424}},
		[106]	= {Minutes = 2.4, 	Units = {1424}},
	},
	NpcBuildingsExist = {X = 338, Y = 361, Range = 10},
}

-- RTS SPAWN,  Blades ersters Camp I
RtsSpawnNT
{
	Clan = 10,
	MaxClanSize = 7,
	X = 389,
	Y = 75,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 392, Y = 78, Range = 0},
}

-- RTS SPAWN,  Blades ersters Camp II
RtsSpawnNT
{
	Clan = 9,
	MaxClanSize = 7,
	X = 366,
	Y = 74,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 369, Y = 72, Range = 0},
}

-- RTS SPAWN,  Blades zweites  Camp I (dreier Gruppe in der Mitte)
RtsSpawnNT
{
	Clan = 8,
	MaxClanSize = 5,
	X = 145,
	Y = 216,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 145, Y = 216, Range = 7},
}

-- RTS SPAWN,  zweites  Camp II
RtsSpawnNT
{
	Clan = 7,
	MaxClanSize = 5,
	X = 160,
	Y = 226,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 163, Y = 227, Range = 0},
}


-- RTS SPAWN,  Blades zweites Camp III
RtsSpawnNT
{
	Clan = 6,
	MaxClanSize = 5,
	X = 159,
	Y = 207,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 162, Y = 205, Range = 0},
}

-- RTS SPAWN,  Blades zweites Camp IV
RtsSpawnNT
{
	Clan = 5,
	MaxClanSize = 5,
	X = 140,
	Y = 199,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 140, Y = 196, Range = 0},
}

-- RTS SPAWN,  Blades zweites Camp V
RtsSpawnNT
{
	Clan = 4,
	MaxClanSize = 5,
	X = 127,
	Y = 225,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 2, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 125, Y = 227, Range = 0},
}

-- RTS SPAWN,  Blades drittes Camp I
RtsSpawnNT
{
	Clan = 3,
	MaxClanSize = 5,
	X = 149,
	Y = 106,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 152, Y = 104, Range = 0},
}


-- RTS SPAWN,  Blades ersters Camp II
RtsSpawnNT
{
	Clan = 2,
	MaxClanSize = 5,
	X = 136,
	Y = 105,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 1, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 132, Y = 103, Range = 0},
}

-- RTS SPAWN,  Blades ersters Camp III
RtsSpawnNT
{
	Clan = 1,
	MaxClanSize = 5,
	X = 142,
	Y = 117,
	Range = 3,


	Timer	= "BreathingForestMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {306, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[0]		= {Minutes = 2, 	Units = {306, 305}},
	},
	NpcBuildingsExist = {X = 142, Y = 121, Range = 0},
}


