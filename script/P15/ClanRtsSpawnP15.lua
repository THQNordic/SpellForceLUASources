
--Aussenwachenverstärkung
-- am Ende des FIles (wg. Clannnummern)


-- RTS Spawn:
-- p15 Howling Mounts

GlobalSpawnDuration = 180

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		ODER(IsMonumentInUse {X = 182, Y = 146, Range = 0},IsMonumentInUse {X = 180, Y = 259, Range = 0})
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "HowlingMoundsMonumentClaimedTimer"},
	}
}

-- Timer für die Attackwave
OnOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "Q237UndeadAttack"},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "HowlingMoundsAttackWaveTimer"},
	}
}


--RTS SPAWN,  Bogenschuetzentruppe
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 8,
	X = 124,
	Y = 244,
	Range = 3,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",
	Init	= {149, 149, 149, 149}, 	-- Bogenschützen
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {149}},	
	},
	NpcBuildingsExist = {X = 127, Y = 244, Range = 0},
}

--RTS SPAWN,  Spectres Hauptcamp Zwergenmonument
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 30,
	X = 202,
	Y = 313,
	Range = 2,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",
	Init	= {294, 295, 294, 295, 295 ,295, 295, 295}, 	-- Spectres Shock/Manadrain
	SpawnData =
	{
		[10]	= {Minutes = 3, 	Units = {295, 294}},	
		[50]	= {Minutes = 2.5, 	Units = {294}}, 	
		[90]	= {Minutes = 1.5, 	Units = {294, 295}},
	},
	NpcBuildingsExist = {X = 202, Y = 320, Range = 6},
}

-- Nordarmee
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 50,
	X = 110,
	Y = 298,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {172, 164, 172, 164, 172, 164, 172, 164, 295}, 	-- Ghoul Axt/Fist, Spectre Shock
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {172, 172, 172, 172, 164, 164, 164, 295}},
		[23]	= {Minutes = 3, 	Units = {172}},
		[45]	= {Minutes = 2.5, 	Units = {164}},
		[60]	= {Minutes = 1.5, 	Units = {172, 164, 295}},
		[90]	= {Seconds = 50, 	Units = {172, 295, 296}},
	},
	NpcBuildingsExist = {X = 112, Y = 294, Range = 9},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "Nordarmee"},}
}

-- Suedarmee
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 50,
	X = 88,
	Y = 192,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {227, 227, 226, 226, 227, 226, 226, 295}, 	-- zombie Dolch/Rotting Fist, Spectre Shock
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {226, 226, 226, 226, 227, 227, 227, 295}},
		[26]	= {Minutes = 3, 	Units = {227}},	                                  
		[42]	= {Minutes = 2.5, 	Units = {226}}, 	                              
		[65]	= {Minutes = 1.5, 	Units = {227, 226, 295}},                         
		--[110]	= {Seconds = 50, 	Units = {226, 227, 295}},	                          
	},
	NpcBuildingsExist = {X = 87, Y = 192, Range = 9},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "Suedarmee"},}
}



-- Schockcaster1
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 20,
	X = 273,
	Y = 258,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {295, 295}, 	-- Spectre Shock
	SpawnData =
	{
		[17]	= {Minutes = 5, 	Units = {295}},
		[60]	= {Minutes = 2.5, 	Units = {295}}, 	                              
		--[110]	= {Seconds = 50, 	Units = {295}},	                          
	},
	NpcBuildingsExist = {X = 270, Y = 260, Range = 0},
}


-- Schockcaster2
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 20,
	X = 275,
	Y = 213,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {295, 295}, 	-- Spectre Shock
	SpawnData =
	{
		[23]	= {Minutes = 4, 	Units = {295}},	                                  
		[69]	= {Minutes = 1.5, 	Units = {295}},                         
		--[110]	= {Seconds = 50, 	Units = {295}},	                          
	},
	NpcBuildingsExist = {X = 268, Y = 210, Range = 0},
}

-- Erster Teil Hauptarmee

RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 30,
	X = 312,
	Y = 206,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {227, 226, 226, 295}, 	-- zombie Dolch/Rotting Fist, Spectre Shock
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {226, 226, 226, 226, 227, 227, 227, 295}},
		[50]	= {Minutes = 4, 	Units = {164}}, -- Ghoul Fist	                                  
		[100]	= {Minutes = 1.2, 	Units = {172, 226, 294}},  -- 226 Ghoul Axe                        
		--[120]	= {Seconds = 50, 	Units = {226, 227, 295}},	                          
	},
	NpcBuildingsExist = {X = 307, Y = 212, Range = 0},
}

-- Zweiter Teil Hauptarmee

RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 25,
	X = 320,
	Y = 283,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {227, 226, 226, 295, 294}, 	-- zombie Dolch/Rotting Fist, Spectre Shock
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {226, 226, 164, 164, 227, 227, 227, 295}},
		[38]	= {Minutes = 4, 	Units = {227}},	                                  
		[55]	= {Minutes = 2.8, 	Units = {296}}, 	                              
		[73]	= {Minutes = 1.7, 	Units = {227, 226, 164}},                         
		--[110]	= {Seconds = 50, 	Units = {226, 227, 296}},	                          
	},
	NpcBuildingsExist = {X = 317, Y = 283, Range = 0},
}

-- Dritter Teil Hauptarmee
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 20,
	X = 335,
	Y = 259,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {227, 226, 226, 295}, 	-- zombie Dolch/Rotting Fist, Spectre Shock
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {226, 226, 226, 226, 227, 227, 227, 295}},
		[39]	= {Minutes = 4, 	Units = {227}},	                                  
		[53]	= {Minutes = 3, 	Units = {226}}, 	                              
		[69]	= {Minutes = 1.8, 	Units = {227, 226, 295}},                         
		--[110]	= {Seconds = 50, 	Units = {226, 227, 295}},	                          
	},
	NpcBuildingsExist = {X = 334, Y = 257, Range = 6},
}

-- Portalwachen
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 15,
	X = 343,
	Y = 220,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {148, 148, 148, 295}, 	-- Skelett Level 11Chaosaxe, Spectre Shock
	SpawnData =
	{
		[0]		= {Minutes = 4.5, 	Units = {148}},
		[35]	= {Minutes = 3.5, 	Units = {148}},	                                  
		[65]	= {Minutes = 1.5, 	Units = {148, 148, 295}},                         
	},
	NpcBuildingsExist = {X = 343, Y = 223, Range = 0},
}

-- Aussenwachen
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 10,
	X = 235,
	Y = 237,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {227, 227, 226, 226}, 	-- Zombie Dolch/Rotting Fist
	SpawnData =
	{
		[0]		= {Minutes = 4.5, 	Units = {226, 227}},
	},
	NpcBuildingsExist = {X = 223, Y = 242, Range = 0},
}

-- Oasencamp
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 10,
	X = 160,
	Y = 238,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {164, 164, 164, 164, 164, 164, 164, 164, 164}, 	-- Zombie Dolch/Rotting Fist
	SpawnData =
	{
		[0]		= {Minutes = 4.5, 	Units = {164}},
		[35]	= {Minutes = 3.5, 	Units = {148}},	                                  
		[65]	= {Minutes = 1.5, 	Units = {172, 164}},
	},
	NpcBuildingsExist = {X = 165, Y = 240, Range = 0},
}

-- Turmcamp
RtsSpawnNT
{
	Clan = 14,
	MaxClanSize = 30,
	X = 65,
	Y = 245,
	Range = 1,
	
	
	Timer	= "HowlingMoundsMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {280, 281, 281, 281, 281, 281, 281}, 	-- Wraith Lifetap, Sense
	SpawnData =
	{
		[0]		= {Minutes = 4.5, 	Units = {281}},
		[35]	= {Minutes = 3.5, 	Units = {281}},	                                  
		[65]	= {Minutes = 1.5, 	Units = {281, 281, 281, 281, 281, 280}},
	},
	NpcBuildingsExist = {X = 63, Y = 245, Range = 5},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "Turmarmee"},}
}

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Oase1 =
{
	X = 178,
	Y = 268,
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
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}


Oase2 =
{
	X = 217,
	Y = 251,
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
		348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = FALSE,
	
}

Oase3 =
{
	X = 189,
	Y = 200,
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
		352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

Sueden =
{
	X = 188,
	Y = 136,
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
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

AmSee1 =
{
	X = 73,
	Y = 254,
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
		352 	-- Animal Buffalo
	},                    
	ShuffleUnits = TRUE,
	
}

AmSee2 =
{
	X = 74,
	Y = 306,
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
		348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = FALSE,
	
}

Norden =
{
	X = 140,
	Y = 328,
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
		350, 350	--Animal Blackwulf
	},                    
	ShuffleUnits = FALSE,
	
}

Aussenwache =
{
	X = 231,
	Y = 289,
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
		352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

Festung1 =
{
	X = 297,
	Y = 287,
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
		350	--Animal Blackwulf
	},                    
	ShuffleUnits = FALSE,
	
}


Festung2 =
{
	X = 300,
	Y = 196,
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
		350	--Animal Blackwulf
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 8, 
	Groups = {Oase1, Oase2, Oase3, Sueden, AmSee1, AmSee2, Norden, Aussenwache, Festung1, Festung2},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 8, MaxClanSize = 25,
	Groups = {Oase1, Oase2, Oase3, Sueden, AmSee1, AmSee2, Norden, Aussenwache, Festung1, Festung2},
	Conditions = 	
	{
	},
}
