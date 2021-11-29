-- RTS Spawn:
-- p25 Southern Godmark
GlobalSpawnDuration = 120

--Monumentenclaim

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
		ODER(IsMonumentInUse {X = 203, Y = 463, Range = 0}, IsMonumentInUse {X = 445, Y = 479, Range = 0}),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "SouthernGodmarkMonumentClaimedTimer"},
	}
}

-- RTS SPAWN, Eisgolem
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 67,
	Y = 350,
	Range = 3,
	
	
	Timer	= "SouthernGodmarkMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {117, 117, 117, 117, 117, 117 ,117, 117, 117}, 	--Icegolem
	SpawnData =
	{
		[10]	= {Minutes = 3, 	Units = {117}},	
		[23]	= {Minutes = 2.5, 	Units = {117}},	
		[35]	= {Minutes = 1.5, 	Units = {117}}, 	
		[45]	= {Minutes = 1, 	Units = {117}},
		[70]	= {Seconds = 50, 	Units = {117}},
		[70]	= {Seconds = 50, 	Units = {117}},
	},
	NpcBuildingsExist = {X = 61, Y = 349, Range = 0},     
}

REM = [[
-- RTS SPAWN, Geister"bomben"
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 15,
	X = 58,
	Y = 231,
	Range = 3,
	
	
	Timer	= "SouthernGodmarkMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {769, 769, 769}, 	--Geisterbomben
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {769}},	
		[23]	= {Minutes = 3, 	Units = {769}},	
		[35]	= {Minutes = 2.5, 	Units = {769}}, 	
		[45]	= {Minutes = 1.5, 	Units = {769}},
		[70]	= {Seconds = 50, 	Units = {769}},
	},
	NpcBuildingsExist = {X = 58, Y = 235, Range = 0},     
}
]]

-- RTS SPAWN, Spawnblades
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 20,
	X = 308,
	Y = 127,
	Range = 3,
	
	
	Timer	= "SouthernGodmarkMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {304, 304, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[40]	= {Minutes = 2.5, 	Units = {304}},	
		[63]	= {Minutes = 2, 	Units = {304}},	
		[75]	= {Minutes = 1.5, 	Units = {303, 304, 304}}, 	
		[85]	= {Minutes = 1.5, 	Units = {309}},
		[85]	= {Minutes = 1.5, 	Units = {309}},
		[110]	= {Seconds = 50, 	Units = {304, 305, 304, 304, 304, 309}},
	},
	NpcBuildingsExist = {X = 308, Y = 127, Range = 5},     
}

-- RTS SPAWN, Spawnblades
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 245,
	Y = 73,
	Range = 3,
	
	
	Timer	= "SouthernGodmarkMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {304, 304, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[50]	= {Minutes = 2.5, 	Units = {304}},	
		[73]	= {Minutes = 3, 	Units = {304}},	
		[73]	= {Minutes = 3, 	Units = {304}},	
		[85]	= {Minutes = 2.5, 	Units = {304, 304}}, 	
		[95]	= {Minutes = 1.5, 	Units = {304}},
		[120]	= {Seconds = 50, 	Units = {303, 309}},
	},
	NpcBuildingsExist = {X = 234, Y = 73, Range = 0},     
}


-- RTS SPAWN, Eisgolem
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 20,
	X = 84,
	Y = 432,
	Range = 3,
	
	
	Timer	= "SouthernGodmarkMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {117, 117, 117, 117, 117, 117, 117, 117}, 	--Icegolem
	SpawnData =
	{
		[15]	= {Minutes = 3.5, 	Units = {117}},	
		[28]	= {Minutes = 3, 	Units = {117}},	
		[40]	= {Minutes = 2, 	Units = {117}}, 	
		[50]	= {Minutes = 1.5, 	Units = {117}},
		[70]	= {Minutes = 1.4, 	Units = {117}},
		[75]	= {Seconds = 50, 	Units = {117}},
	},
	NpcBuildingsExist = {X = 90, Y = 434, Range = 0},     
}


RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 20,
	X = 157,
	Y = 147,
	Range = 3,
	
	
	Timer	= "SouthernGodmarkMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {304, 304, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[50]	= {Minutes = 2.5, 	Units = {304}},	
		[60]	= {Minutes = 2.5, 	Units = {304}},	
		[65]	= {Minutes = 2, 	Units = {304, 304}}, 	
		[70]	= {Minutes = 1.5, 	Units = {304}},
		[80]	= {Seconds = 50, 	Units = {303, 309}},
		[100]	= {Seconds = 50, 	Units = {303, 309}},
	},
	NpcBuildingsExist = {X = 145, Y = 147, Range = 0},     
}

RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 20,
	X = 191,
	Y = 147,
	Range = 3,
	
	
	Timer	= "SouthernGodmarkMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {304, 304, 304, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[50]	= {Minutes = 2.5, 	Units = {304}},	
		[63]	= {Minutes = 2.5, 	Units = {304}},	
		[78]	= {Minutes = 2.3, 	Units = {304}},	
		[85]	= {Minutes = 2, 	Units = {304, 304}}, 	
		[95]	= {Minutes = 1.5, 	Units = {304}},
		[100]	= {Seconds = 50, 	Units = {303, 309}},
		[110]	= {Seconds = 50, 	Units = {303, 309}},
	},
	NpcBuildingsExist = {X = 180, Y = 147, Range = 0},     
}

RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 20,
	X = 211,
	Y = 144,
	Range = 3,
	
	
	Timer	= "SouthernGodmarkMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {304, 304, 304, 305, 305}, 	--Blade Minion 13 Melee/Iceburst
	SpawnData =
	{
		[40]	= {Minutes = 3, 	Units = {304}},	
		[53]	= {Minutes = 3, 	Units = {304}},	
		[67]	= {Minutes = 2.5, 	Units = {304}},	
		[75]	= {Minutes = 2.5, 	Units = {304, 304}}, 	
		[82]	= {Minutes = 1.5, 	Units = {304}},
		[100]	= {Seconds = 50, 	Units = {303, 309}},
	},
	NpcBuildingsExist = {X = 202, Y = 136, Range = 0},     
}

