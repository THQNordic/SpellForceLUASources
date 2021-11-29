-- RTS Spawn:
-- P115	Dragon

GlobalSpawnDuration = 90


--Wenn Zwergenmonument geclaimed wird


OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 106, Y = 164, Range = 3, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "DragonMonumentClaimedTimerP115"},
		--SetGlobalFlagTrue { Name = "ArbeiterStartP115"},
	}
}




REM =[[
--DrachenKristall 1 RTS Spawn
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 56,
	Y = 70,
	Range = 3,
	
	
	Timer	= "DragonMonumentClaimedTimerP115",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1717, 1717, 1716}, 	--Small IceDragon Level 22, 24
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1717, 1716}},
		[15]	= {Minutes = 3, 	Units = {1717, 1716}}, 
		[25]	= {Minutes = 2.5, 	Units = {1716, 1717}},
		[45]	= {Minutes = 2, 	Units = {1716, 1717}},
		[70]	= {Minutes = 1, 	Units = {1716, 1717}},
	},
	NpcBuildingsExist = {X = 51, Y = 69, Range = 8}
	
}

--DrachenKristall 2 RTS Spawn
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 15,
	X = 68,
	Y = 30,
	Range = 3,
	
	
	Timer	= "DragonMonumentClaimedTimerP115",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1717, 1717, 1716}, 	--Small IceDragon Level 22, 24
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1717, 1716}},
		[15]	= {Minutes = 3, 	Units = {1717, 1716}}, 
		[25]	= {Minutes = 2.5, 	Units = {1716, 1717}},
		[45]	= {Minutes = 2, 	Units = {1716, 1717}},
		[70]	= {Minutes = 1, 	Units = {1716, 1717}},
	},
	NpcBuildingsExist = {X = 66, Y = 26, Range = 8}
	
}

--DrachenKristall 3 RTS Spawn
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 15,
	X = 107,
	Y = 22,
	Range = 3,
	
	
	Timer	= "DragonMonumentClaimedTimerP115",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1717, 1717, 1716}, 	--Small IceDragon Level 22, 24
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1717, 1716}},
		[15]	= {Minutes = 3, 	Units = {1717, 1716}}, 
		[25]	= {Minutes = 2.5, 	Units = {1716, 1717}},
		[45]	= {Minutes = 2, 	Units = {1716, 1717}},
		[70]	= {Minutes = 1, 	Units = {1716, 1717}},
	},
	NpcBuildingsExist = {X = 107, Y = 17, Range = 8}
	
}

--DrachenKristall 4 RTS Spawn
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 15,
	X = 234,
	Y = 176,
	Range = 3,
	
	
	Timer	= "DragonMonumentClaimedTimerP115",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= { 1717, 1716}, 	--Small IceDragon Level 22, 24
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1717, 1716}},
		[15]	= {Minutes = 3, 	Units = {1717, 1716}}, 
		[25]	= {Minutes = 2.5, 	Units = {1716, 1717}},
		[45]	= {Minutes = 2, 	Units = {1716, 1717}},
		[70]	= {Minutes = 1, 	Units = {1716, 1717}},
	},
	NpcBuildingsExist = {X = 231, Y = 172, Range = 8}
	
}

--DrachenKristall 5 RTS Spawn
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 15,
	X = 226,
	Y = 212,
	Range = 3,
	
	
	Timer	= "DragonMonumentClaimedTimerP115",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1717, 1717, 1716}, 	--Small IceDragon Level 22, 24
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1717, 1716}},
		[15]	= {Minutes = 3, 	Units = {1717, 1716}}, 
		[25]	= {Minutes = 2.5, 	Units = {1716, 1717}},
		[45]	= {Minutes = 2, 	Units = {1716, 1717}},
		[70]	= {Minutes = 1, 	Units = {1716, 1717}},
	},
	NpcBuildingsExist = {X = 230, Y = 208, Range = 8}
	
}

--DrachenKristall 6 RTS Spawn
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 15,
	X = 188,
	Y = 205,
	Range = 3,
	
	
	Timer	= "DragonMonumentClaimedTimerP115",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1717, 1716}, 	--Small IceDragon Level 22, 24
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1717, 1716}},
		[15]	= {Minutes = 3, 	Units = {1717, 1716}}, 
		[25]	= {Minutes = 2.5, 	Units = {1716, 1717}},
		[45]	= {Minutes = 2, 	Units = {1716, 1717}},
		[70]	= {Minutes = 1, 	Units = {1716, 1717}},
	},
	NpcBuildingsExist = {X = 185, Y = 199, Range = 8}
	
}
]]