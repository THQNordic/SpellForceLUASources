-- RTS Spawn:
-- p203 Onyx Shores

GlobalSpawnDuration = 90



--Monumentenclaim erster Teil vor der Blockade
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 107, Y = 358, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "t_P203MonumentEins"},
	}
}


--Monumentenclaim hinter der Blockade
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 227, Y = 318, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "t_P203MonumentZwei"},
	}
}

----Aufbaustörer Orks 
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 239,
	Y = 403,
	Range = 3,
	
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2984, 2985, 2986, 2987, 2985, 2984, 2984}, 	--Orkstreuner Level 25
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {2984}},
		[15]	= {Minutes = 3.5, 	Units = {2985}},
		[25]	= {Minutes = 3, 	Units = {2986}},
		[45]	= {Minutes = 2, 	Units = {2987}},
		[70]	= {Minutes = 1.5, 	Units = {2984}},
	},
	NpcBuildingsExist = {X = 241, Y = 404, Range = 0}
	
}

----Aufbaustörer Orks 
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 12,
	X = 282,
	Y = 393,
	Range = 3,
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	-- !!! Zeiten und so natürlich auch anpassen
	Init	= {2984, 2985, 2986, 2987, 2984, 2985, 2984, 2984}, 	--Orkstreuner Level 25
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {2984}},
		[15]	= {Minutes = 3.5, 	Units = {2985}},
		[25]	= {Minutes = 3, 	Units = {2986}},
		[45]	= {Minutes = 2, 	Units = {2987}},
		[70]	= {Minutes = 1.5, 	Units = {2984}},
	},
	NpcBuildingsExist = {X = 282, Y = 394, Range = 4}
	
}

----Aufbaustörer Orks Dritte Dorf
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 12,
	X = 323,
	Y = 394,
	Range = 3,
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2984, 2985, 2986, 2987, 2984, 2985, 2984, 2984}, 	--Orkstreuner Level 25
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {2984}},
		[23]	= {Minutes = 2.8, 	Units = {2985}},
		[39]	= {Minutes = 2.5, 	Units = {2986}},
		[69]	= {Minutes = 2, 	Units = {2987}},
		[70]	= {Minutes = 1.5, 	Units = {2984}},
	},
	NpcBuildingsExist = {X = 324, Y = 399, Range = 10}
	
}


----Endcamp
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 344,
	Y = 143,
	Range = 3,
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2050, 2051, 2049, 2050, 2050, 2049}, 	-- Wüstenräuber/ Derwische Level 22/24
	SpawnData =
	{
		[0]		= {Minutes = 3.6, 	Units = {2051}},
		[26]	= {Minutes = 3.2, 	Units = {2050}},
		[37]	= {Minutes = 3, 	Units = {2048, 2049}},
		[58]	= {Minutes = 2, 	Units = {2051, 2051, 2048}},
		[89]	= {Minutes = 1.5, 	Units = {2050}},
	},
	NpcBuildingsExist = {X = 344, Y = 143, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P203Camp1Zerstoert"},}
	
}

--Endcamp
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 12,
	X = 322,
	Y = 96,
	Range = 3,
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2050, 2050, 2050, 2050, 2049, 2048}, 	-- Wüstenräuber/ Derwische Level 22/24
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {2050}},
		[29]	= {Minutes = 3, 	Units = {2050}},
		[39]	= {Minutes = 2.8, 	Units = {2050, 2051}},
		[59]	= {Minutes = 2, 	Units = {2050, 2050, 2050}},
		[84]	= {Minutes = 1.5, 	Units = {2050}},
	},
	NpcBuildingsExist = {X = 325, Y = 96, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P203Camp2Zerstoert"},}
}


--Endcamp
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 12,
	X = 298,
	Y = 101,
	Range = 3,
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2050, 2050, 2051, 2051, 2050, 2050}, 	-- Wüstenräuber/ Derwische Level 22/24
	SpawnData =
	{
		[2]		= {Minutes = 4, 	Units = {2050}},
		[27]	= {Minutes = 3.5, 	Units = {2050}},
		[37]	= {Minutes = 3.3, 	Units = {2051, 2048}},
		[57]	= {Minutes = 2.9, 	Units = {2049, 2048, 2051}},
		[82]	= {Minutes = 2, 	Units = {2050}},
	},
	NpcBuildingsExist = {X = 298, Y = 95, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P203Camp3Zerstoert"},}
}

--Endcamp
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 12,
	X = 285,
	Y = 117,
	Range = 3,
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2049, 2049, 2048, 2048, 2048, 2050, 2050}, 	-- Wüstenräuber/ Derwische Level 22/24
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {2050}},
		[25]	= {Minutes = 3.5, 	Units = {2051}},
		[45]	= {Minutes = 3, 	Units = {2050, 2049}},
		[65]	= {Minutes = 2, 	Units = {2048, 2050, 2051}},
		[90]	= {Minutes = 1.5, 	Units = {2050}},
	},
	NpcBuildingsExist = {X = 280, Y = 117, Range = 4},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P203Camp4Zerstoert"},}
	
}

--Endcamp
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 8,
	X = 301,
	Y = 118,
	Range = 3,
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2049, 2049, 2048, 2048, 2048, 2050}, 	-- Wüstenräuber/ Derwische Level 22/24
	SpawnData =
	{
		[30]		= {Minutes = 3, 	Units = {2050, 2049, 2048}},
	},
	NpcBuildingsExist = {X = 301, Y = 121, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P203Camp5Zerstoert"},}
	
}

--Endcamp
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 8,
	X = 330,
	Y = 118,
	Range = 3,
	
	Timer	= "t_P203MonumentEins",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2049, 2049, 2048, 2048, 2048, 2050}, 	-- Wüstenräuber/ Derwische Level 22/24
	SpawnData =
	{
		[30]		= {Minutes = 3, 	Units = {2050, 2049, 2048}},
	},
	NpcBuildingsExist = {X = 330, Y = 121, Range = 4},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P203Camp6Zerstoert"},}
	
}

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
WaldAmAufbau =
{
	X = 66,
	Y = 376,
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
		354, 354, 354, 354,	354, 354, 354,--Animal Deer Old
		353, 353, 353, 353, 353, 353, 353, 353,	-- Animal Deer Young
		355, 355, 355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

ZweiterWaldAmAufbau =
{
	X = 84,
	Y = 442,
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
		354, 354, 354, 354,	354, 354, 354,--Animal Deer Old
		353, 353, 353, 353, 353, 353, 353, 353,	-- Animal Deer Young
		355, 355, 355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}


WaldAmBerg =
{
	X = 144,
	Y = 392,
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
		
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
		
	},                    
	ShuffleUnits = FALSE,
	
}

BlockadeTruppe =
{
	X = 369,
	Y = 396,
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
		
		
		348		-- Wild Boar
		
	},                    
	ShuffleUnits = FALSE,
	
}

ZweiterAufbau =
{
	X = 250,
	Y = 427,
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
		354,	--Animal Deer Old
		353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose´
	},                    
	ShuffleUnits = TRUE,
	
}

UntenLinks =
{
	X = 95,
	Y = 105,
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
		349, 349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 14, 
	Groups = {WaldAmAufbau, ZweiterWaldAmAufbau, WaldAmBerg, BlockadeTruppe, ZweiterAufbau, UntenLinks},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 60,
	Groups = {WaldAmAufbau, ZweiterWaldAmAufbau, WaldAmBerg, BlockadeTruppe, ZweiterAufbau, UntenLinks},
	Conditions = 	
	{
	},
}
