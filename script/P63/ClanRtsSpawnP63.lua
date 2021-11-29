-- RTS Spawn:
-- p63 Greyfell

GlobalSpawnDuration = 75
--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 194, Y = 293, Range = 0},
	},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "GreyfellMonumentClaimedTimer"},
	},
}

--
--Gobblins I
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 25,
	X = 194,
	Y = 164,
	Range = 3,
	
	
	Timer	= "GreyfellMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {777, 779, 655, 777, 779, 655, 777, 779}, 	-- Gobblin Faust, Keule, RockBullet
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {777}},
	},
	NpcBuildingsExist = {X = 192, Y = 166, Range = 3},     
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "GobblinCamp"},}
}


--Gobbos II
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 20,
	X = 178,
	Y = 162,
	Range = 3,
	
	
	Timer	= "GreyfellMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	
	Init	= {655, 777, 779}, 	-- Gobbos
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {777}},     
	},
	NpcBuildingsExist = {X = 174, Y = 157, Range = 13},
}

--Orkdorf
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 10,
	X = 254,
	Y = 168,
	Range = 3,
	
	
	Timer	= "GreyfellMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1161, 1161, 1161, 1161, 1161, 1161, 1161, 1161}, 	-- Höhlenorks
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {1161}},
	},
	NpcBuildingsExist = {X = 254, Y = 168, Range = 6},
}












GreyfellPatrullje1 =
{
	X = 399, Y = 166,
	Units = 
	{
		476, 476,	-- patrol
		481, 481,	-- heavy infantryman
		482,		-- veteran
	},                    
}
GreyfellPatrullje2 =
{
	X = 439, Y = 215,
	Units = 
	{
		476, 476,	-- patrol
		481, 481,	-- heavy infantryman
		482,		-- veteran
	},                    
}
GreyfellPatrullje3 =
{
	X = 418, Y = 272,
	Units = 
	{
		476, 476,	-- patrol
		481, 481,	-- heavy infantryman
		482,		-- veteran
	},                    
}
GreyfellPatrullje4 =
{
	X = 440, Y = 192,
	Units = 
	{
		476, 476,	-- patrol
		481, 481,	-- heavy infantryman
		482,		-- veteran
	},                    
}
GreyfellPatrullje5 =
{
	X = 400, Y = 222,
	Units = 
	{
		476, 476,	-- patrol
		481, 481,	-- heavy infantryman
		482,		-- veteran
	},                    
}
GreyfellPatrullje6 =
{
	X = 415, Y = 315,
	Units = 
	{
		476, 476,	-- patrol
		481, 481,	-- heavy infantryman
		482,		-- veteran
	},                    
}

InitSpawn
{
	Clan = 24, 
	Groups = {
		GreyfellPatrullje1, GreyfellPatrullje2, GreyfellPatrullje3,
		GreyfellPatrullje4, GreyfellPatrullje5, GreyfellPatrullje6, 
	},
	Conditions = {},
}




TiereSuedOsten1 =
{
	X = 223,
	Y = 278,
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
--
--TiereSuedOsten2 =
--{
--	X = 207,
--	Y = 141,
--	Range = 4,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		354, 354,	--Animal Deer Old
--		353, 353, 353, 353,	-- Animal Deer Young
--		355,		-- Animal Moose
--		344	-- Animal Brownbear
--		
--	},                    
--	ShuffleUnits = TRUE,
--	
--}
--
--TiereSuedOsten3 =
--{
--	X = 219,
--	Y = 39,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		354,	--Animal Deer Old
--		353, 353, 353,	-- Animal Deer Young
--		355		-- Animal Moose
--	},                    
--	ShuffleUnits = TRUE,
--	
--}
--
--
--
--TiereSuedlichVomFluss =
--{
--	X = 159,
--	Y = 51,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		354, 354, 	--Animal Deer Old
--		353, 353, 353, 353, 	-- Animal Deer Young
--		355 		-- Animal Moose
--	},                    
--	ShuffleUnits = TRUE,
--	
--}
--
--TiereSuedWesten1 =
--{
--	X = 62,
--	Y = 77,
--	Range = 3,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
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
--TiereSuedWesten2 =
--{
--	X = 66,
--	Y = 114,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		354, 354,	--Animal Deer Old
--		353, 353, 353, 353,	-- Animal Deer Young
--		355,		-- Animal Moose
--	},                    
--	ShuffleUnits = TRUE,
--	
--}
--]]
--

InitSpawn
{
	Clan = 23, 
	Groups = {TiereSuedOsten1},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 23, MaxClanSize = 30,
	Groups = {TiereSuedOsten1},
	Conditions = 	
	{
	},
}


