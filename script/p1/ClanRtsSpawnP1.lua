-- RTS Spawn:
-- p3 Lianon

NpcDump = WAHR



OneTimeInitAction(	SetGlobalTimeStamp{Name = "LianonMonumentClaimedTimer"} )


--Gobblins Snarf
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 4,
	X = 63,
	Y = 127,
	Range = 3,
	
	
	Timer	= "LianonMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {779, 783, 777, 784}, 	--
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {779, 783, 777}},
	},
	NpcBuildingsExist = {X = 63, Y = 127, Range = 4},
}

--Gobblins Burgle
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 12,
	X = 159,
	Y = 209,
	Range = 3,
	
	
	Timer	= "LianonMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {779, 783, 777, 784, 266, 262, 658}, 	--
	SpawnData =
	{
		[0]		= {Minutes = 2, 	Units = {779, 783, 777, 658}},
	},
	NpcBuildingsExist = {X = 159, Y = 209, Range = 6},
}

--Banditen
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 3,
	X = 104,
	Y = 39,
	Range = 3,
	
	
	Timer	= "LianonMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {831, 831, 831}, 	--
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {831}},
	},
	NpcBuildingsExist = {X = 104, Y = 39, Range = 1},
}
-- RTS SPAWN, Tiere am Portal



UniqueBear =
{
	X = 122,
	Y = 199,
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
		
		345, 	--Animal Blackbear
		
	},                    
	ShuffleUnits = TRUE,
	
}

WolfPortal =
{
	X = 66,
	Y = 196,
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
		349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = TRUE,
	
}

TiereWegZumPortal =
{
	X = 72,
	Y = 168,
	Range = 6,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		349, 349,	--Animal Greywulf
		344, 344, 344,	-- Animal Brownbear
		348, 348, 348, 348 	-- Animal Wildboar
		
	},                    
	ShuffleUnits = TRUE,
	
}


TiereNordOsten1 =
{
	X = 170,
	Y = 191,
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
		349, 349, 	--Animal Greywulf
		344, 	-- Animal Brownbear
		348, 348, 348 	-- Animal Wildboar
		
	},                    
	ShuffleUnits = TRUE,
	
}

TiereNordOsten2 =
{
	X = 192,
	Y = 189,
	Range = 4,
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
	ShuffleUnits = TRUE,
	
}


TiereSuedOsten1 =
{
	X = 211,
	Y = 140,
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



TiereSuedOsten3 =
{
	X = 219,
	Y = 39,
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
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}



TiereSuedlichVomFluss =
{
	X = 159,
	Y = 51,
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

TiereSuedWesten1 =
{
	X = 62,
	Y = 77,
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

TiereSuedWesten2 =
{
	X = 66,
	Y = 114,
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
		354, 354,	--Animal Deer Old
		353, 353, 353, 353,	-- Animal Deer Young
		355,		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}


InitSpawn
{
	Clan = 25, 
	Groups = {TiereSuedlichVomFluss, TiereSuedOsten1, TiereWegZumPortal, UniqueBear, WolfPortal, TiereNordOsten1, TiereNordOsten2,  TiereSuedOsten3, TiereSuedWesten1, TiereSuedWesten2},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 25, MaxClanSize = 100,
	Groups = {TiereSuedlichVomFluss, TiereSuedOsten1, TiereWegZumPortal, UniqueBear, WolfPortal, TiereNordOsten1, TiereNordOsten2, TiereSuedOsten3, TiereSuedWesten1, TiereSuedWesten2},
	Conditions = 	
	{
	},
}