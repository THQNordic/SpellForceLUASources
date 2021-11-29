-- RTS Spawn:
-- P107 Cross/Eichbaum

GlobalSpawnDuration = 90

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 156, Y = 152, Range = 3, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "CrossToHerstellungMonumentClaimedTimer"},
		SetGlobalFlagTrue{Name = "ZwergenMonumentGeclaimedP107"}, 
	}
}

--Skelettlager im Eingangsbereich
OnPlatformOneTimeEvent
{
	Conditions = 
	{
	
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "BetretendesLevelsP107"},
		
	}
}

--SchlachtfeldSpawning 1
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 35,
	X = 115,
	Y = 109,
	Range = 3,
	
	
	Timer	= "CrossToHerstellungMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1588,1588,1588,1588,1588,1588,1587,1587,1587,1587,1587,1588,1587,1587}, 	--Geister Elfen und Geister Zwerge Level 10
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1588, 1587}},
		[25]	= {Minutes = 4, 	Units = {1588, 1587}}, 
		[45]	= {Minutes = 3, 	Units = {1588, 1587}},
		[65]	= {Minutes = 2, 	Units = {1588, 1587}},
		[70]	= {Minutes = 2, 	Units = {1588, 1587}},
	},
	NpcBuildingsExist = {X = 113, Y = 114, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "StopRespawnGeisterP107"}},
	
}

--SkelettSpawning beim Mondsilber
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 10,
	X = 134,
	Y = 181,
	Range = 3,
	
	
	Timer	= "BetretendesLevelsP107",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1638, 1602, 1703, 1302, 1303, 1302, 1303}, 	--Skelette Level 10
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {1700}},
		[15]	= {Minutes = 3, 	Units = {1702}}, 
		[25]	= {Minutes = 2.5, 	Units = {1637, 1703}},
		[45]	= {Minutes = 2, 	Units = {1645, 1303}},
		[70]	= {Minutes = 2, 	Units = {1303, 1302}},
	},
	NpcBuildingsExist = {X = 136, Y = 185, Range = 8},
	
}

--SkelettSpawning beim Schlachtfeld
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 16,
	X = 112,
	Y = 68,
	Range = 3,
	
	
	Timer	= "BetretendesLevelsP107",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1701, 1638, 1601, 1303, 1703, 1701, 1703}, 	--Skelette Level 10
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {1700, 1702}},
		[15]	= {Minutes = 2.5, 	Units = {1700, 1702}}, 
		[25]	= {Minutes = 2, 	Units = {1638, 1701}},
		[45]	= {Minutes = 2, 	Units = {1637, 1701}},
		[70]	= {Minutes = 2, 	Units = {1303, 1302}},
	},
	NpcBuildingsExist = {X = 108, Y = 66, Range = 8},
	
}

--SkelettSpawning beim Eingang
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 8,
	X = 66,
	Y = 142,
	Range = 3,
	
	
	Timer	= "BetretendesLevelsP107",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1701, 1702}, 	--Skelette Level 10
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1700, 1702}},
		[15]	= {Minutes = 2.5, 	Units = {1700, 1702}}, 
		[25]	= {Minutes = 2, 	Units = {1638, 1701}},
		[45]	= {Minutes = 2, 	Units = {1637, 1701}},
		[70]	= {Minutes = 2, 	Units = {1303, 1302}},
	},
	NpcBuildingsExist = {X = 65, Y = 146, Range = 8}
	
}

--SchlachtfeldSpawning 2
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 15,
	X = 108,
	Y = 107,
	Range = 3,
	
	
	Timer	= "CrossToHerstellungMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1588,1588,1588,1587,1587,1587}, 	--Geister Elfen und Geister Zwerge Level 10
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1588, 1587}},
		[25]	= {Minutes = 5, 	Units = {1588, 1587}}, 
		[45]	= {Minutes = 4, 	Units = {1588, 1587}},
		[65]	= {Minutes = 3, 	Units = {1588, 1587}},
		[70]	= {Minutes = 2, 	Units = {1588, 1587}},
	},
	NpcBuildingsExist = {X = 105, Y = 113, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "StopRespawnGeister2P107"}},
	
}

--SchlachtfeldSpawning 3
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 15,
	X = 101,
	Y = 101,
	Range = 3,
	
	
	Timer	= "CrossToHerstellungMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1588,1588,1588,1587,1587,1587}, 	--Geister Elfen und Geister Zwerge Level 10
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1588, 1587}},
		[25]	= {Minutes = 5, 	Units = {1588, 1587}}, 
		[45]	= {Minutes = 4, 	Units = {1588, 1587}},
		[65]	= {Minutes = 3, 	Units = {1588, 1587}},
		[70]	= {Minutes = 2, 	Units = {1588, 1587}},
	},
	NpcBuildingsExist = {X = 95, Y = 103, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "StopRespawnGeister3P107"}},
	
}