-- RTS Spawn:
-- p102 Hero Rune 01

GlobalSpawnDuration = 90

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 93, Y = 62, Range = 3, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "HeroRune01MonumentClaimedTimer"},
			
	}
}

--Waldläuferangriff
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "DialogWasserquelleEnded"},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "WaldlaeuferAngriffsTimer"},
		
	}
}

----Kitharlager im Süd-Westen
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 123,
	Y = 199,
	Range = 3,
	
	
	Timer	= "WaitFlankenangrif",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1607, 1607, 1606, 1606, 1607, 1492}, 	--Kithar Level 1-2
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {1606}},
		[25]	= {Minutes = 4.5, 	Units = {1606}}, 
		[35]	= {Minutes = 4, 	Units = {1606}},
		[75]	= {Minutes = 3, 	Units = {1606, 1487}},
		[90]	= {Minutes = 2.5, 	Units = {1487}},
	},
	NpcBuildingsExist = {X = 118, Y = 202, Range = 8}
	
}

----Kitharlager im Sueden
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 15,
	X = 260,
	Y = 165,
	Range = 3,
	
	
	Timer	= "HeroRune01MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1606, 1606, 1607, 1607, 1606, 1607, 1607, 1607},  	--Kithar Level 1-2
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1606}},
		[30]	= {Minutes = 3.5, 	Units = {1606}},
		[50]	= {Minutes = 3, 	Units = {1606}},
		[70]	= {Minutes = 2, 	Units = {1492}},
		[90]	= {Minutes = 1.5, 	Units = {1487}},
	},
	NpcBuildingsExist = {X = 259, Y = 157, Range = 10}

}

----Kitharlager im Osten
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 20,
	X = 409,
	Y = 176,
	Range = 3,
	
	
	Timer	= "HeroRune01MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1606, 1606, 1607, 1492, 1492, 1607, 1607, 1607, 1606}, 	--Kithar Level 1-2
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {1606}},
		[30]	= {Minutes = 3, 	Units = {1492}}, 
		[45]	= {Minutes = 2, 	Units = {1492, 1606}},
		[55]	= {Minutes = 1.5, 	Units = {1492}},
		[70]	= {Minutes = 1.5, 	Units = {1487}},
	},
	NpcBuildingsExist = {X = 414, Y = 173, Range = 8}
	
}

----kl.Kitharlager im Süden
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 219,
	Y = 173,
	Range = 6,
	
	
	Timer	= "HeroRune01MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1606, 1606, 1606, 1607, 1607}, 	--Kithar Level 1-2
	SpawnData =
	{
		[0]		= {Minutes = 10, 	Units = {1607}},
		[15]	= {Minutes = 8, 	Units = {1607}}, 
		[25]	= {Minutes = 6, 	Units = {1606}},
		[45]	= {Minutes = 4, 	Units = {1606}},
	
	},
	NpcBuildingsExist = {X = 221, Y = 171, Range = 8}
	
} 

----kl.Kitharlager im Osten
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 20,
	X = 347,
	Y = 211,
	Range = 6,
	
	
	Timer	= "HeroRune01MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1607, 1606, 1606, 1606, 1607}, 	--Kithar Level 1-2
	SpawnData =
	{
		[0]		= {Minutes = 10, 	Units = {1607}},
		[15]	= {Minutes = 8, 	Units = {1607}}, 
		[25]	= {Minutes = 6, 	Units = {1606}},
		[45]	= {Minutes = 4, 	Units = {1606}},
	
	},
	NpcBuildingsExist = {X = 351, Y = 213, Range = 10}

}

---KitharFestung Süd

RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 12,
	X = 174,
	Y = 308,
	Range = 3,
	
	
	Timer	= "WaldlaeuferAngriffsTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1606, 1607, 1606}, 	--Kithar Level 1-3
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {1607}},
		[15]	= {Minutes = 6, 	Units = {1492}}, 
		[40]	= {Minutes = 4, 	Units = {1492}},
		
	},
	NpcBuildingsExist = {X = 166, Y = 309, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "Camp1ZerstoertP102"},}
}

--KitharFestung Ost

RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 12,
	X = 194,
	Y = 318,
	Range = 3,
	
	
	Timer	= "WaldlaeuferAngriffsTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1607, 1606, 1606}, 	--Kithar Level 1-3
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {1606}},
		[10]	= {Minutes = 6, 	Units = {1492}}, 
		[40]	= {Minutes = 4, 	Units = {1492}},
		[70]	= {Minutes = 3, 	Units = {1492, 1487}},
		
	},
	NpcBuildingsExist = {X = 201, Y = 323, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "Camp2ZerstoertP102"},}
}

--KitharFestung Nord

RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 12,
	X = 162,
	Y = 335,
	Range = 3,
	
	
	Timer	= "WaldlaeuferAngriffsTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1607, 1607, 1606}, 	--Kithar Level 1-3
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {1492}},
		[8]		= {Minutes = 6, 	Units = {1492}}, 
		[15]	= {Minutes = 4, 	Units = {1492}},
		[50]	= {Minutes = 3, 	Units = {1492, 1487}},

	},
	NpcBuildingsExist = {X = 152, Y = 339, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "Camp3ZerstoertP102"},}
}

--TierSpawning


Rehe1 =
{
	X = 172,
	Y = 45,
	Range = 5,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 353, 354, 353, 355 	-- Animal Deer
	},                    
	ShuffleUnits = FALSE,
	
}

Rehe2 =
{
	X = 140,
	Y = 79,
	Range = 3,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 353, 354, 353, 355 	-- Animal Deer
	},                    
	ShuffleUnits = FALSE,
	
}

Rehe3 =
{
	X = 394,
	Y = 127,
	Range = 5,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 353, 354, 353, 355 	-- Animal Deer
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 19, 
	Groups = {Rehe1, Rehe2, Rehe3},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 19, MaxClanSize = 90,
	Groups = {Rehe1, Rehe2, Rehe3},
	Conditions = 	
	{
	},
}

