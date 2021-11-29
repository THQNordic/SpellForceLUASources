---- RTS Spawn:
---- p21 Farlornes Hope



--Erstes freundliches Camp nach Portal
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 10,
	X = 291,
	Y = 260,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {974, 974, 974, 974,  974, 974,  974, 974, 993, 993, 993,973}, 	-- Red Legion 10 Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3.4, 	Units = {974}},	
		[1]		= {Minutes = 3, 	Units = {993}},	
		[35]	= {Minutes = 2.5, 	Units = {977}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {974, 993, 973}},
		[70]	= {Seconds = 50, 	Units = {974, 993, 973, 977}},
	},
	NpcBuildingsExist = {X = 284, Y = 256, Range = 8},
}

--Erstes Briar Camp nach Portal
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 10,
	X = 213,
	Y = 302,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969, 969, 969, 969, 969, 969, 994, 994, 994, 968}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 2.8, 	Units = {969}},	
		[1]		= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 206, Y = 307, Range = 10},
}

--erstes einzelnes Briar Camp nach Portal
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 30,
	X = 174,
	Y = 262,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969, 969, 994, 968}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {969}},	
		[1]		= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 169, Y = 256, Range = 10},
}

--Zweites freundliches Camp nach Portal
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 10,
	X = 182,
	Y = 158,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {974, 974, 974, 974,  974, 974, 974, 974, 993, 993, 993,973}, 	-- Red Legion 10 Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3.1, 	Units = {974}},	
		[1]		= {Minutes = 2.5, 	Units = {993}},	
		[35]	= {Minutes = 2.5, 	Units = {977}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {974, 993, 973}},
		[70]	= {Seconds = 50, 	Units = {974, 993, 973, 977}},
	},
	NpcBuildingsExist = {X = 182, Y = 158, Range = 12},
}

--Zweites Briar Camp nach Portal
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 10,
	X = 235,
	Y = 137,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969, 969, 969, 969, 969, 969, 994, 994, 994, 968}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 2.4, 	Units = {969}},	
		[1]		= {Minutes = 2, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 235, Y = 137, Range = 6},
}

--Zweites Briar Camp nach Portal Teil zwei
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 15,
	X = 250,
	Y = 144,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969, 994, 968}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {969}},	
		[1]		= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 245, Y = 150, Range = 0},
}

--Drittes freundliches Camp nach Portal
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 10,
	X = 422,
	Y = 205,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {974, 974, 974, 974,  974, 974, 974, 993, 993, 993, 993,973}, 	-- Red Legion 10 Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3.1, 	Units = {974}},	
		[1]		= {Minutes = 3, 	Units = {993}},	
		[35]	= {Minutes = 2.5, 	Units = {977}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {974, 993, 973}},
		[70]	= {Seconds = 50, 	Units = {974, 993, 973, 977}},
	},
	NpcBuildingsExist = {X = 422, Y = 205, Range = 20},
}

--Drittes Briar Camp nach Portal
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 10,
	X = 327,
	Y = 213,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969, 969, 969, 969, 969, 994, 994, 994, 994, 968}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 2, 	Units = {969}},	
		[1]		= {Minutes = 2.5, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 327, Y = 213, Range = 10},
}


--Kasten 8 freundliches Camp 
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 25,
	X = 449,
	Y = 128,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {974, 974, 974, 974, 993, 973, 974, 974, 974, 974, 993, 973}, 	-- Red Legion 10 Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {974}},	
		[1]		= {Minutes = 2, 	Units = {993}},	
		[35]	= {Minutes = 2.5, 	Units = {977}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {974, 993, 973}},
		[70]	= {Seconds = 50, 	Units = {974, 993, 973, 977}},
	},
	NpcBuildingsExist = {X = 449, Y = 128, Range = 20},
}

--Angriffscamp Rampe
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 10,
	X = 364,
	Y = 143,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969, 969, 994, 994, 968}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 2.8, 	Units = {969}},	
		[1]		= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 361, Y = 143, Range = 12},
}

--Angriffscamp Rampe, Sueden
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 10,
	X = 417,
	Y = 92,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969, 969, 994, 968}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {969}},	
		[1]		= {Minutes = 4.5, 	Units = {994}},	
		[35]	= {Minutes = 3, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 2, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 420, Y = 85, Range = 8},
}

--Kasten 11 freundliches Camp 
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 25,
	X = 304,
	Y = 72,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {974, 974, 974, 974, 993, 973, 974, 974, 974, 974, 993, 973}, 	-- Red Legion 10 Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {974}},	
		[1]		= {Minutes = 2, 	Units = {993}},	
		[35]	= {Minutes = 2.5, 	Units = {977}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {974, 993, 973}},
		[70]	= {Seconds = 50, 	Units = {974, 993, 973, 977}},
	},
	NpcBuildingsExist = {X = 304, Y = 72, Range = 8},
}

--Kasten 11 Angriffscamp
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 10,
	X = 206,
	Y = 64,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969, 969, 969, 969, 994, 994, 994, 968}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {969}},	
		[1]		= {Minutes = 1.8, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 206, Y = 64, Range = 8},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "AssassinFree"},}
}


--/ --kleine Orc Hütte muss noch ein Camp
RtsSpawnNT
{
	Clan = 14,
	MaxClanSize = 10,
	X = 383,
	Y = 98,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {969}},	
		[10]	= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 379, Y = 102, Range = 0},
}

-- Briar Main Camp Vorposten
RtsSpawnNT
{
	Clan = 13,
	MaxClanSize = 10,
	X = 116,
	Y = 108,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {969}},	
		[10]	= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 112, Y = 105, Range = 8},
}

-- Briar Main Camp I
RtsSpawnNT
{
	Clan = 12,
	MaxClanSize = 10,
	X = 107,
	Y = 327,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {969}},	
		[10]	= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 107, Y = 329, Range = 8},
}


-- Briar Main Camp II
RtsSpawnNT
{
	Clan = 11,
	MaxClanSize = 10,
	X = 92,
	Y = 330,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {969}},	
		[10]	= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 80, Y = 331, Range = 15},
}

-- Briar Main Camp III
RtsSpawnNT
{
	Clan = 10,
	MaxClanSize = 10,
	X = 97,
	Y = 313,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {969, 969, 969}, 	-- Briar Wolf Marksman/Recruit/Scout
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {969}},	
		[10]	= {Minutes = 3, 	Units = {994}},	
		[35]	= {Minutes = 2.5, 	Units = {972}}, 	-- Cleric
		[45]	= {Minutes = 1.5, 	Units = {969, 994, 968}},
		[70]	= {Seconds = 50, 	Units = {969, 994, 994, 972}},
	},
	NpcBuildingsExist = {X = 89, Y = 310, Range = 8},
}


-- Drachlinge I
RtsSpawnNT
{
	Clan = 9,
	MaxClanSize = 6,
	X = 167,
	Y = 338,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {585, 585, 585}, 	-- Drachlinge
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {585}},	
		[11]	= {Minutes = 3.5, 	Units = {585}},	
		[33]	= {Minutes = 3, 	Units = {585}},
		[42]	= {Minutes = 1.5, 	Units = {585}},
		[69]	= {Seconds = 50, 	Units = {585}},
	},
	NpcBuildingsExist = {X = 175, Y = 343, Range = 2},
}

-- Drachlinge II
RtsSpawnNT
{
	Clan = 8,
	MaxClanSize = 6,
	X = 159,
	Y = 380,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {585, 585, 585}, 	-- Drachlinge 
	SpawnData =
	{
		[10]	= {Minutes = 3, 	Units = {585}},
		[30]	= {Minutes = 2.5, 	Units = {585}},
		[55]	= {Minutes = 2, 	Units = {585}},
		[69]	= {Minutes = 1.5, 	Units = {585}},
		[96]	= {Seconds = 50, 	Units = {585}},
	},
	NpcBuildingsExist = {X = 167, Y = 381, Range = 0},
}

-- Drachlinge III
RtsSpawnNT
{
	Clan = 7,
	MaxClanSize = 8,
	X = 134,
	Y = 410,
	Range = 3,
	
	
	Timer	= "FarlornsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {585, 585, 585}, 	-- Drachlinge
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {585}},
		[10]	= {Minutes = 3, 	Units = {585}},
		[35]	= {Minutes = 2.5, 	Units = {585}},
		[45]	= {Minutes = 1.5, 	Units = {585}},
		[70]	= {Seconds = 50, 	Units = {585}},
	},
	NpcBuildingsExist = {X = 131, Y = 414, Range = 0},
}
PlatformInitAction (SetGlobalTimeStamp {Name = "FarlornsMonumentClaimedTimer"})
