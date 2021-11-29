-- RTS Spawn:
-- p7 Icegate Marsh

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
		ODER(IsMonumentInUse {X = 269, Y = 128, Range = 0}, IsMonumentInUse {X = 342, Y = 301, Range = 0}),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "IcegateMarshMonumentClaimedTimer"},
	}
}

-- RTS SPAWN, Erstes Blade Camp
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 140,
	Y = 96,
	Range = 3,
	
	
	Timer	= "IcegateMarshMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {305, 304, 304, 304, 304, 310}, 	--Blades
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {304}},	
		[23]	= {Minutes = 3, 	Units = {305, 304}},	
		[35]	= {Minutes = 2.5, 	Units = {305, 304, 304, 304}}, 	
		[45]	= {Minutes = 1.5, 	Units = {305, 304}},
		[70]	= {Seconds = 50, 	Units = {305, 304, 303}},
	},
	NpcBuildingsExist = {X = 134, Y = 86, Range = 5},     
}

-- RTS SPAWN, Drachlinge
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 10,
	X = 211,
	Y = 176,
	Range = 3,
	
	
	Timer	= "IcegateMarshMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {586, 586, 586, 586}, 	--Drachlinge
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {586}},	
		[33]	= {Minutes = 3, 	Units = {586}},	
		[45]	= {Minutes = 2.5, 	Units = {586}}, 	
		[55]	= {Minutes = 1.5, 	Units = {586}},
		[80]	= {Seconds = 50, 	Units = {586}},
	},
	NpcBuildingsExist = {X = 211, Y = 176, Range = 7},     
}


-- RTS SPAWN, Eisgolems
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 8,
	X = 405,
	Y = 269,
	Range = 8,
	
	
	Timer	= "IcegateMarshMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {117, 117, 117, 117}, 	--Eisgolems
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {117}},	
		[56]	= {Minutes = 1.5, 	Units = {117, 1417}},
		[74]	= {Seconds = 50, 	Units = {117}},
	},
	NpcBuildingsExist = {X = 404, Y = 262, Range = 0},
}

-- RTS SPAWN, Eisgolems
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 6,
	X = 433,
	Y = 252,
	Range = 8,
	
	
	Timer	= "IcegateMarshMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {117, 117, 117}, 	--Eisgolems
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {117}},	
		[48]	= {Minutes = 2.5, 	Units = {117}}, 	
		[56]	= {Minutes = 1.5, 	Units = {117, 1417}},
		[74]	= {Seconds = 50, 	Units = {117}},
	},
	NpcBuildingsExist = {X = 433, Y = 245, Range = 0},
}

-- RTS SPAWN, Eiselfen
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 35,
	X = 332,
	Y = 455,
	Range = 3,
	
	
	Timer	= "IcegateMarshMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1351, 1350, 1352, 1351, 1350, 1352, 1351, 1350, 1352}, 	--Eiselfen Freeze/Iceelemntal/Iceburst
	SpawnData =
	{
		[9]		= {Minutes = 3, 	Units = {1351}},	
		[42]	= {Minutes = 2.7, 	Units = {1350}},	
		[58]	= {Minutes = 2.5, 	Units = {1351}}, 	
		[69]	= {Minutes = 1.5, 	Units = {1351, 1350, 1352}},
		[99]	= {Seconds = 50, 	Units = {1352}},
	},
	NpcBuildingsExist = {X = 332, Y = 457, Range = 5},
}

-- RTS SPAWN, Eiselfen II
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 30,
	X = 288,
	Y = 444,
	Range = 3,
	
	
	Timer	= "IcegateMarshMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1351, 1351, 1351, 1351, 1350, 1352}, 	--Eiselfen Freeze/Iceelemntal/Iceburst
	SpawnData =
	{
		[9]		= {Minutes = 3, 	Units = {1351}},	
		[42]	= {Minutes = 2.7, 	Units = {1350}},	
		[58]	= {Minutes = 2.5, 	Units = {1351}}, 	
		[69]	= {Minutes = 1.5, 	Units = {1351, 1350, 1352}},
		[99]	= {Seconds = 50, 	Units = {1352}},
	},
	NpcBuildingsExist = {X = 288, Y = 444, Range = 7},
}

-- RTS SPAWN, Eiselementare 
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 25,
	X = 247,
	Y = 394,
	Range = 3,
	
	
	Timer	= "IcegateMarshMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {769, 769, 769, 769, 769, 769}, 	--Eiselemantar
	SpawnData =
	{
		[7]		= {Minutes = 3, 	Units = {769}},	
		[23]	= {Minutes = 2.5, 	Units = {769}},	
		[49]	= {Minutes = 2, 	Units = {769}}, 	
		[69]	= {Minutes = 1.5, 	Units = {769}},
		[73]	= {Seconds = 50, 	Units = {769}},
	},
	NpcBuildingsExist = {X = 255, Y = 385, Range = 0},
}

-- Tierchen

TiereSuedOsten1 =
{
	X = 279,
	Y = 88,
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
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}




TiereWaldAmTaleingang =
{
	X = 211,
	Y = 99,
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
		354, 354, 	--Animal Deer Old
		353, 353, 353, 353, 	-- Animal Deer Young
		355 		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

TiereWesten =
{
	X = 144,
	Y = 174,
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
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}



InitSpawn
{
	Clan = 10, 
	Groups = {TiereSuedOsten1,  TiereWesten, TiereWaldAmTaleingang},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 10, MaxClanSize = 50,
	Groups = {TiereSuedOsten1,  TiereWesten, TiereWaldAmTaleingang},
	Conditions = 	
	{
	},
}