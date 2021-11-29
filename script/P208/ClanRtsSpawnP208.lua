-- RTS Spawn:
-- p104 flee to ice

GlobalSpawnDuration = 180

g_P208_GrabWestenX = 75
g_P208_GrabWestenY = 420
     
g_P208_DorfEinsX = 241
g_P208_DorfEinsY = 436
     
g_P208_DorfZweiX = 114 
g_P208_DorfZweiY = 413

g_P208_DorfDreiX = 213
g_P208_DorfDreiY = 377

g_P208_DorfVierX = 179
g_P208_DorfVierY = 329

g_P208_DorfFuenfX = 198
g_P208_DorfFuenfY = 282

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 263, Y = 54, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "BlazingStonesMonumentClaimedTimer"},
	}
}

----Erstes Camp im Norden
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 264,
	Y = 172,
	Range = 3,
	
	
	Timer	= "BlazingStonesMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2350, 2350, 2351 ,2352 ,2353}, 	--Werwolf 28, 28 Rockbullet, 26, 27, 27 Lifetap
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {2351, 2352}},
		[15]	= {Minutes = 3.5, 	Units = {2350, 2352}},
		[23]	= {Minutes = 3, 	Units = {2351, 2350, 2352}},
		[45]	= {Minutes = 2, 	Units = {2352, 2352, 2353}},
		[70]	= {Minutes = 1.5, 	Units = {2350}},
	},
	NpcBuildingsExist = {X = 264, Y = 170, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_EinsWereWolfCamp"},},
	
}

----Erstes Camp im Sueden
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 12,
	X = 180,
	Y = 32,
	Range = 3,
	
	
	Timer	= "BlazingStonesMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2350, 2351 ,2352 ,2353}, 	--Werwolf 28 Rockbullet, 26, 27, 27 Lifetap
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {2351, 2352, 2352}},
		[25]	= {Minutes = 3, 	Units = {2351, 2352}},
		[45]	= {Minutes = 2, 	Units = {2352, 2352, 2353}},
		[69]	= {Minutes = 1.5, 	Units = {2351, 2352}},
	},
	NpcBuildingsExist = {X = 176, Y = 32, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_ZweiWereWolfCamp"},},
	
}


----Zweites Camp im Sueden
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 12,
	X = 56,
	Y = 63,
	Range = 3,
	
	
	Timer	= "BlazingStonesMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2352, 2350, 2351 ,2352 ,2353}, 	--Werwolf 28 Rockbullet, 26, 27, 27 Lifetap
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2351}},
		[17]	= {Minutes = 3, 	Units = {2351, 2352}},
		[35]	= {Minutes = 2, 	Units = {2352, 2352, 2353}},
		[70]	= {Minutes = 1.5, 	Units = {2353}},
	},
	NpcBuildingsExist = {X = 56, Y = 63, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_DreiWereWolfCamp"},},
	
}

----Camp Mitte
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 106,
	Y = 122,
	Range = 3,
	
	
	Timer	= "BlazingStonesMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2350, 2351, 2350, 2351, 2352 ,2353},
	SpawnData =
	{
		[2]		= {Minutes = 4.5, 	Units = {2350, 2352}},
		[25]	= {Minutes = 3.5, 	Units = {2351, 2351}},
		[45]	= {Minutes = 2.2, 	Units = {2353, 2352, 2353}},
		[70]	= {Minutes = 1.2, 	Units = {2352}},
	},
	NpcBuildingsExist = {X = 106, Y = 122, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_VierWereWolfCamp"},},
	
}

----Camp Heldenmonument
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 17,
	X = 148,
	Y = 237,
	Range = 3,
	
	
	Timer	= "BlazingStonesMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2350, 2351, 2350, 2351, 2352 ,2353},
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2351, 2352}},
		[17]	= {Minutes = 3, 	Units = {2351, 2350, 2352}},
		[27]	= {Minutes = 2.2, 	Units = {2352, 2352, 2353}},
		[56]	= {Minutes = 1.2, 	Units = {2350}},
	},
	NpcBuildingsExist = {X = 148, Y = 237, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_FuennefWereWolfCamp"},},
	
}

----Camp Am Tor
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 25,
	X = 169,
	Y = 254,
	Range = 3,
	
	
	Timer	= "BlazingStonesMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2350, 2351, 2350, 2351, 2352 ,2353},
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2351, 2352}},
		[17]	= {Minutes = 3, 	Units = {2351, 2350, 2352}},
		[27]	= {Minutes = 2.2, 	Units = {2351, 2352, 2353}},
		[56]	= {Minutes = 1.2, 	Units = {2353}},
	},
	NpcBuildingsExist = {X = 169, Y = 254, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_SechsWereWolfCamp"},},
	
}

--Erstes Beastman/Goblincamp
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 25,
	X = g_P208_DorfEinsX,
	Y = g_P208_DorfEinsY,
	Range = 3,
	
	
	Timer	= "gt_P208_GobllinSpawning",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2995, 2994, 2996, 2276},
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2276, 2995, 2996}},
		[17]	= {Minutes = 3, 	Units = {2276, 2995, 2994}},
		[27]	= {Minutes = 2.2, 	Units = {2995}},
		[56]	= {Minutes = 1.2, 	Units = {2276, 2995}},
	},
	NpcBuildingsExist = {X = g_P208_DorfEinsX, Y = g_P208_DorfEinsY, Range = 5},
	
}

--Zweites Beastman/Goblincamp
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 18,
	X = g_P208_DorfZweiX,
	Y = g_P208_DorfZweiY,
	Range = 1,
	
	
	Timer	= "gt_P208_GobllinSpawning",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2276, 2995, 2995, 2994, 2996, 2276},
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {2995}},
		[15]	= {Minutes = 2.8, 	Units = {2276, 2995, 2994}},
		[29]	= {Minutes = 2.6, 	Units = {2276, 2995, 2996}},
		[54]	= {Minutes = 1.4, 	Units = {2276, 2995, 2994, 2996}},
	},
	NpcBuildingsExist = {X = g_P208_DorfZweiX, Y = g_P208_DorfZweiY, Range = 5},
	
}

--Drittes Beastman/Goblincamp
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 15,
	X = g_P208_DorfDreiX,
	Y = g_P208_DorfDreiY,
	Range = 1,
	
	
	Timer	= "gt_P208_GobllinSpawning",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2276, 2995, 2995, 2996, 2994, 2276},
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2995}},
		[23]	= {Minutes = 2.5, 	Units = {2276, 2994, 2996}},
		[44]	= {Minutes = 2.2, 	Units = {2276, 2995, 2994}},
		[62]	= {Minutes = 1.2, 	Units = {2276, 2995}},
	},
	NpcBuildingsExist = {X = g_P208_DorfDreiX, Y = g_P208_DorfDreiY, Range = 5},
	
}

--Viertes Beastman/Goblincamp
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 30,
	X = g_P208_DorfVierX,
	Y = g_P208_DorfVierY,
	Range = 3,
	
	
	Timer	= "gt_P208_GobllinSpawning",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2276, 2995, 2995, 2996, 2994, 2276},
	SpawnData =
	{
		[5]		= {Minutes = 3.5, 	Units = {2276, 2995}},
		[17]	= {Minutes = 3, 	Units = {2276, 2995, 2994}},
		[42]	= {Minutes = 1.2, 	Units = {2276, 2995, 2994, 2996}},
	},
	NpcBuildingsExist = {X = g_P208_DorfVierX, Y = g_P208_DorfVierY, Range = 5},
	
}

--Fuenftes Beastman/Goblincamp
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 18,
	X = g_P208_DorfFuenfX,
	Y = g_P208_DorfFuenfY,
	Range = 3,
	
	
	Timer	= "gt_P208_GobllinSpawning",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2276, 2995, 2995, 2994, 2996, 2276},
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {2276, 2996}},
		[23]	= {Minutes = 2.5, 	Units = {2276, 2994}},
		[42]	= {Minutes = 2, 	Units = {2276, 2995}},
		[69]	= {Minutes = 15, 	Units = {2276, 2994, 2996, 2995}},
	},
	NpcBuildingsExist = {X = g_P208_DorfFuenfX, Y = g_P208_DorfFuenfY, Range = 5},
	
}


--Werwoelfe mitten in der Map
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 15,
	X = 196,
	Y = 200,
	Range = 3,
	
	
	Timer	= "BlazingStonesMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2350, 2351, 2350, 2351, 2352 ,2353},
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2351}},
		[17]	= {Minutes = 3, 	Units = {2351, 2350}},
		[27]	= {Minutes = 2.2, 	Units = {2351, 2352, 2353}},
		[56]	= {Minutes = 1.2, 	Units = {2353}},
	},
	NpcBuildingsExist = {X = 198, Y = 202, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P208_SiebenWereWolfCamp"},},
	
}
-------------------------------------------------
---- 	Tierspawning
-------------------------------------------------
--Waldschrat =
--{
--	X = 360,
--	Y = 119,
--	Range = 5,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		354, 354, 354, 354,	--Animal Deer Old
--		353, 353, 353, 353, 353,	-- Animal Deer Young
--		355		-- Animal Moose
--	},                    
--	ShuffleUnits = TRUE,
--	
--}
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
--InitSpawn
--{
--	Clan = 14, 
--	Groups = {Waldschrat, Waldschrat1, Waldschrat2, Waldschrat3, Waldschrat4},
--	Conditions = 	
--	{
--	},
--}
--		
--RtsSpawn
--{
--	Clan = 14, MaxClanSize = 30,
--	Groups = {Waldschrat, Waldschrat1, Waldschrat2, Waldschrat3, Waldschrat4},
--	Conditions = 	
--	{
--	},
--}
