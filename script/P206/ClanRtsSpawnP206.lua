-- RTS Spawn:
-- p104 flee to ice

GlobalSpawnDuration = 360

----Monumentenclaim
--OnPlatformOneTimeEvent
--{
--	Conditions = 
--	{
--		ODER9
--		{
--			IsMonumentInUse {X = 124, Y = 423, Range = 0, UpdateInterval = 10},
--			IsMonumentInUse {X = 91, Y = 422, Range = 0, UpdateInterval = 10},
--			IsMonumentInUse {X = 92, Y = 391, Range = 0, UpdateInterval = 10},
--			IsMonumentInUse {X = 124, Y = 392, Range = 0, UpdateInterval = 10},
--			IsMonumentInUse {X = 279, Y = 300, Range = 0, UpdateInterval = 10},
--			IsMonumentInUse {X = 263, Y = 301, Range = 0, UpdateInterval = 10},
--			IsMonumentInUse {X = 263, Y = 385, Range = 0, UpdateInterval = 10},
--			IsMonumentInUse {X = 280, Y = 284, Range = 0, UpdateInterval = 10},
--		},
--	},
--	Actions =
--	{
--		SetGlobalTimeStamp{Name = "t_P213_MonumentTimer"},
--	}
--}
--
--
------Erstes Mumien Camp im Norden
--RtsSpawnNT
--{
--	Clan = 27,
--	MaxClanSize = 15,
--	X = 268,
--	Y = 449,
--	Range = 3,
--	
--	
--	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {2427, 2428, 2429 ,2430 ,2431}, 	--37 Melee, 35 Melee, 35 Lifetap, 35 Schwert, 35 Poison
--	SpawnData =
--	{
--		[2]		= {Minutes = 3, 	Units = {2428}},
--		[15]	= {Minutes = 3.5, 	Units = {2429}},
--		[23]	= {Minutes = 3, 	Units = {2429, 2430}},
--		[45]	= {Minutes = 2, 	Units = {2431, 2352, 2353}},
--		[70]	= {Minutes = 1.5, 	Units = {2349}},
--	},
--	NpcBuildingsExist = {X = 268, Y = 449, Range = 10},
--	
--}

------Erstes Camp im Sueden
--RtsSpawnNT
--{
--	Clan = 26,
--	MaxClanSize = 12,
--	X = 180,
--	Y = 32,
--	Range = 3,
--	
--	
--	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {2349, 2350, 2351 ,2352 ,2353}, 	--Werwolf 28, 28 Rockbullet, 26, 27, 27 Lifetap
--	SpawnData =
--	{
--		[2]		= {Minutes = 3, 	Units = {2351}},
--		[25]	= {Minutes = 3, 	Units = {2351, 2349}},
--		[45]	= {Minutes = 2, 	Units = {2352, 2352, 2353}},
--		[69]	= {Minutes = 1.5, 	Units = {2349}},
--	},
--	NpcBuildingsExist = {X = 176, Y = 32, Range = 0},
--	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_ZweiWereWolfCamp"},},
--	
--}
-- 
-- 
------Zweites Camp im Sueden
--RtsSpawnNT
--{
--	Clan = 25,
--	MaxClanSize = 12,
--	X = 56,
--	Y = 63,
--	Range = 3,
--	
--	
--	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {2349, 2350, 2351 ,2352 ,2353}, 	--Werwolf 28, 28 Rockbullet, 26, 27, 27 Lifetap
--	SpawnData =
--	{
--		[0]		= {Minutes = 3.5, 	Units = {2351}},
--		[17]	= {Minutes = 3, 	Units = {2351, 2349}},
--		[35]	= {Minutes = 2, 	Units = {2352, 2352, 2353}},
--		[70]	= {Minutes = 1.5, 	Units = {2349}},
--	},
--	NpcBuildingsExist = {X = 56, Y = 63, Range = 5},
--	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_DreiWereWolfCamp"},},
--	
--}
-- 
------Camp Mitte
--RtsSpawnNT
--{
--	Clan = 24,
--	MaxClanSize = 20,
--	X = 106,
--	Y = 122,
--	Range = 3,
--	
--	
--	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {2349, 2350, 2351, 2349, 2350, 2351, 2352 ,2353},
--	SpawnData =
--	{
--		[2]		= {Minutes = 4.5, 	Units = {2350}},
--		[25]	= {Minutes = 3.5, 	Units = {2351, 2351}},
--		[45]	= {Minutes = 2.2, 	Units = {2349, 2352, 2353}},
--		[70]	= {Minutes = 1.2, 	Units = {2349}},
--	},
--	NpcBuildingsExist = {X = 106, Y = 122, Range = 5},
--	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_VierWereWolfCamp"},},
--	
--}
-- 
------Camp Heldenmonument
--RtsSpawnNT
--{
--	Clan = 23,
--	MaxClanSize = 17,
--	X = 148,
--	Y = 237,
--	Range = 3,
--	
--	
--	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {2349, 2350, 2351, 2349, 2350, 2351, 2352 ,2353},
--	SpawnData =
--	{
--		[0]		= {Minutes = 3.5, 	Units = {2351}},
--		[17]	= {Minutes = 3, 	Units = {2351, 2349}},
--		[27]	= {Minutes = 2.2, 	Units = {2349, 2352, 2353}},
--		[56]	= {Minutes = 1.2, 	Units = {2349}},
--	},
--	NpcBuildingsExist = {X = 148, Y = 237, Range = 5},
--	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_FuennefWereWolfCamp"},},
--	
--}
-- 
------Camp Am Tor
--RtsSpawnNT
--{
--	Clan = 22,
--	MaxClanSize = 25,
--	X = 169,
--	Y = 254,
--	Range = 3,
--	
--	
--	Timer	= "t_P213_MonumentTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {2349, 2350, 2351, 2349, 2350, 2351, 2352 ,2353},
--	SpawnData =
--	{
--		[0]		= {Minutes = 3.5, 	Units = {2351}},
--		[17]	= {Minutes = 3, 	Units = {2351, 2349}},
--		[27]	= {Minutes = 2.2, 	Units = {2349, 2352, 2353}},
--		[56]	= {Minutes = 1.2, 	Units = {2349}},
--	},
--	NpcBuildingsExist = {X = 169, Y = 254, Range = 5},
--	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_SechsWereWolfCamp"},},
--	
--}   

-------------------------------------------------
---- 	Tierspawning
-------------------------------------------------
BueffelAmWasserlochAufbau =
{
	X = 226,
	Y = 417,
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
		352 -- Bueffel
	},                    
	ShuffleUnits = TRUE,
	
}
--
--
--Waldschrat1 =
--{
--	X = 327,
--	Y = 80,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		
--		354, 354, 354, 354,	--Animal Deer Old
--		353, 353, 353, 353, 353,	-- Animal Deer Young
--		355		-- Animal Moose
--		
--	},                    
--	ShuffleUnits = FALSE,
--	
--}
--
--Waldschrat2 =
--{
--	X = 296,
--	Y = 125,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		
--		
--		348		-- Wild Boar
--		
--	},                    
--	ShuffleUnits = FALSE,
--	
--}
--
--Waldschrat3 =
--{
--	X = 254,
--	Y = 140,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		354,	--Animal Deer Old
--		353, 353, 353,	-- Animal Deer Young
--		355		-- Animal Moose´
--	},                    
--	ShuffleUnits = TRUE,
--	
--}
--
--Waldschrat4 =
--{
--	X = 234,
--	Y = 160,
--	Range = 3,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		349, 349, 349, 349	--Animal Greywulf
--	},                    
--	ShuffleUnits = FALSE,
--	
--}
--
--
InitSpawn
{
	Clan = 14, 
	Groups = {BueffelAmWasserlochAufbau},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 7,
	Groups = {BueffelAmWasserlochAufbau},
	Conditions = 	
	{
	},
}
