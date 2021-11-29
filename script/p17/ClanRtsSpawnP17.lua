-- RTS Spawn:
-- p15 The Godwall

GlobalSpawnDuration = 180

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		ODER(IsMonumentInUse {X = 274, Y = 81, Range = 0}, IsMonumentInUse {X = 180, Y = 232, Range = 0}),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "GodwallMonumentClaimedTimer"},
	}
}

-- RTS SPAWN, Aussenhöfe
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 12,
	X = 137,
	Y = 107,
	Range = 3,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {968, 968, 970, 970, 994, 994}, 	--Briar Scout Level 10/Markssman/Recruit
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {968, 970, 994}},	
		[23]	= {Minutes = 3, 	Units = {968, 970, 994}},	
	},
	NpcBuildingsExist = {X = 134, Y = 109, Range = 0},    
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "Aussenhof"},}
}

-- RTS SPAWN, Dorf1
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 25,
	X = 193,
	Y = 170,
	Range = 3,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {968, 968, 970, 970, 994, 994, 972}, 	--Briar Scout Level 10/Markssman/Recruit/Cleric
	SpawnData =
	{
		[0]		= {Minutes = 2.5, 	Units = {968, 970, 994}},	
		[23]	= {Minutes = 2, 	Units = {968}},
		[34]	= {Minutes = 1.5, 	Units = {970}}, 	
		[48]	= {Minutes = 1.5, 	Units = {968, 994}},
		[69]	= {Seconds = 50, 	Units = {968, 968, 970, 970, 994, 972}},	
	},
	NpcBuildingsExist = {X = 193, Y = 170, Range = 10},  
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "ZwergenCamp"},}   
}

-- RTS SPAWN, Dorf2 Teil 1
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 25,
	X = 403,
	Y = 205,
	Range = 3,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {968, 968, 970, 970, 994, 994, 972}, 	--Briar Scout Level 10/Markssman/Recruit/Cleric
	SpawnData =
	{
		[2]		= {Minutes = 2.5, 	Units = {968, 970, 994}},	
		[21]	= {Minutes = 2.5, 	Units = {968}},
		[37]	= {Minutes = 20, 	Units = {970}}, 	
		[44]	= {Minutes = 1.5, 	Units = {968, 994}},
		[73]	= {Seconds = 50, 	Units = {968, 968, 970, 970, 994, 972, 982}},	
	},
	NpcBuildingsExist = {X = 402, Y = 196, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "BauernCamp"},}  
	   
}



-- RTS SPAWN, Plunderer
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 25,
	X = 374,
	Y = 121,
	Range = 3,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {968, 968, 970, 970, 994, 994, 972}, 	--Briar Scout Level 10/Markssman/Recruit/Cleric
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {968, 970, 971}},	
		[19]	= {Minutes = 2.5, 	Units = {968}},
		[35]	= {Minutes = 2, 	Units = {972}}, 	
		[48]	= {Minutes = 1.5, 	Units = {968, 994, 982}},
		[69]	= {Seconds = 50, 	Units = {968, 968, 970, 971, 994, 972}},	
	},
	NpcBuildingsExist = {X = 374, Y = 121, Range = 4}, 
   
}

-- RTS SPAWN, BriarMaincampDefense
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 20,
	X = 145,
	Y = 327,
	Range = 3,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {968, 968, 970, 970, 994, 994, 972}, 	--Briar Scout Level 10/Markssman/Recruit/Cleric
	SpawnData =
	{
		[0]		= {Minutes = 2, 	Units = {968, 970, 971, 968, 968, 970, 970, 994, 994, 972, 971}},
	},
	NpcBuildingsExist = {X = 142, Y = 330, Range = 0}, 
	CampDestroyedActions = {SetGlobalFlagTrue{Name = "LetztesCamp1"},}   
}

-- RTS SPAWN, BriarMaincampOffense
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 25,
	X = 147,
	Y = 352,
	Range = 3,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {968, 968, 970, 970, 994, 994, 972}, 	--Briar Scout Level 10/Markssman/Recruit/Cleric
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {968, 970, 971}},	
		[23]	= {Minutes = 2, 	Units = {968}},
		[42]	= {Minutes = 1.8, 	Units = {972}}, 	
		[69]	= {Seconds = 50, 	Units = {968, 968, 970, 971, 994, 972}},	
	},
	NpcBuildingsExist = {X = 147, Y = 352, Range = 4},    
		CampDestroyedActions = {SetGlobalFlagTrue{Name = "LetztesCamp2"},}   
}

-- RTS SPAWN, Garde
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 25,
	X = 398,
	Y = 312,
	Range = 2,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {968, 968, 970, 970, 994, 994, 972}, 	--Briar Scout Level 10/Markssman/Recruit/Cleric
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {968, 970}},	
		[23]	= {Minutes = 2.5, 	Units = {968}},
		[39]	= {Minutes = 2, 	Units = {970, 982}}, 	
		[67]	= {Minutes = 1.5, 	Units = {968, 968, 970, 971, 994, 972}},
		[105]	= {Seconds = 40, 	Units = {968, 968, 970, 971, 994, 972}},
	},
	NpcBuildingsExist = {X = 401, Y = 316, Range = 6}, 
	   
}


-- RTS SPAWN, Garde
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 25,
	X = 342,
	Y = 389,
	Range = 2,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {970, 970, 970, 970, 994, 994, 972}, 	--Briar Scout Level 10/Markssman/Recruit/Cleric
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {968, 970, 970}},	
		[23]	= {Minutes = 2, 	Units = {968, 971}},
		[35]	= {Minutes = 1.8, 	Units = {970}}, 	
		[69]	= {Minutes = 1.5, 	Units = {968, 968, 970, 971, 994, 972}},	
	},
	NpcBuildingsExist = {X = 338, Y = 393, Range = 3},    
}

-- RTS SPAWN, Garde
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 15,
	X = 307,
	Y = 138,
	Range = 2,
	
	
	Timer	= "GodwallMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {970, 970, 970, 970, 994, 994, 972}, 	--Briar Scout Level 10/Markssman/Recruit/Cleric
	SpawnData =
	{
		[2]		= {Minutes = 4, 	Units = {968, 970, 970}},	
		[23]	= {Minutes = 3, 	Units = {968, 971}},

	},
	NpcBuildingsExist = {X = 307, Y = 138, Range = 10},    
}
-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------



AussenDorf1 =
{
	X = 119,
	Y = 114,
	Range = 1,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = TRUE,
	
}

WegPluenderTrupp =
{
	X = 266,
	Y = 135,
	Range = 1,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		350, 350	--Animal Blackwulf
	},                    
	ShuffleUnits = TRUE,
	
}

Dorf1 =
{
	X = 149,
	Y = 179,
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
		352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

Dorf2 =
{
	X = 400,
	Y = 123,
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
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = FALSE,
	
}

Margay =
{
	X = 84,
	Y = 258,
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
		350, 350	--Animal Blackwulf
	},                    
	ShuffleUnits = FALSE,
	
}

Aufbau2 =
{
	X = 125,
	Y = 290,
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
		352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}


Aufbau2_2 =
{
	X = 110,
	Y = 332,
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
		348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 15, 
	Groups = {AussenDorf1, WegPluenderTrupp, Dorf1, Dorf2, Margay, Aufbau2, Aufbau2_2},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 15, MaxClanSize = 30,
	Groups = {AussenDorf1, WegPluenderTrupp, Dorf1, Dorf2, Margay, Aufbau2, Aufbau2_2},
	Conditions = 	
	{
	},
}
