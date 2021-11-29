-- RTS Spawn:
-- p16 Wisper

GlobalSpawnDuration = 150

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		
		ODER(IsMonumentInUse {X = 225, Y = 229, Range = 0}, IsMonumentInUse {X = 209, Y = 299, Range = 0}),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "WisperMonumentClaimedTimer"},
	}
}



-- RTS SPAWN, Skeleton Südliche Garnison
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 287,
	Y = 114,
	Range = 3,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1301, 1301, 1301, 147, 147,  147, 147, 147, 149}, 	--Skeleton 8 2H-Schwert/Stachelkeule + Schild/Skeleton 8 Bow
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1301}},	
		[20]	= {Minutes = 3, 	Units = {147}},	
		[35]	= {Minutes = 2.5, 	Units = {1301, 147}}, 	
		[45]	= {Minutes = 1.5, 	Units = {1301, 147, 149}},
		[70]	= {Seconds = 50, 	Units = {1301, 147, 149, 149}},
	},
	NpcBuildingsExist = {X = 289, Y = 116, Range = 0},     
}

--RTS SPAWN, Zombies Südliche Garnison
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 32,
	X = 282,
	Y = 99,
	Range = 3,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {227, 227, 227,  227, 227, 226, 226}, 	-- Zombie 10 Dolch/Fist
	SpawnData =
	{
		[1]		= {Minutes = 3.5, 	Units = {227}},	
		[19]	= {Minutes = 3, 	Units = {226}},	
		[37]	= {Minutes = 2, 	Units = {227, 226}}, 	
		[42]	= {Minutes = 1.5, 	Units = {227, 226, 226}},
		[73]	= {Seconds = 50, 	Units = {227, 226, 226, 226}},
	},
	NpcBuildingsExist = {X = 283, Y = 106, Range = 0},     
}

-- RTS SPAWN, Erste Unforgiven Armee
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 15,
	X = 148,
	Y = 75,
	Range = 3,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {280, 280, 280, 281, 281, 281, 281, 281, 281}, 	-- Wraith Lifatap/Sense
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {281}},	
		[23]	= {Minutes = 3, 	Units = {281}},	
		[39]	= {Minutes = 2, 	Units = {281, 280}}, 	
		[50]	= {Minutes = 1.5, 	Units = {281}},
		[69]	= {Seconds = 50, 	Units = {281, 281, 281, 280}},
	},
	NpcBuildingsExist = {X = 148, Y = 73, Range = 0},     
}



-- RTS SPAWN, Zweite Unforgiven Armee
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 180,
	Y = 116,
	Range = 3,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {280, 280, 280, 281, 281, 281, 281, 281, 281}, 	-- Wraith Lifatap/Sense
	SpawnData =
	{
		[3]		= {Minutes = 4, 	Units = {281}},	
		[22]	= {Minutes = 3.5, 	Units = {281}},	
		[37]	= {Minutes = 2, 	Units = {281, 280}}, 	
		[48]	= {Minutes = 1.5, 	Units = {281}},
		[69]	= {Seconds = 50, 	Units = {281, 281, 281, 280}},
	},
	NpcBuildingsExist = {X = 180, Y = 116, Range = 4},     
}

-- RTS SPAWN, Dritte Unforgiven Armee
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 25,
	X = 133,
	Y = 45,
	Range = 3,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {280, 280, 280, 281, 281, 281, 281, 281, 281}, 	-- Wraith Lifatap/Sense
	SpawnData =
	{
		[0]		= {Minutes = 4.5, 	Units = {281}},	
		[21]	= {Minutes = 3, 	Units = {281}},	
		[33]	= {Minutes = 2, 	Units = {281, 280}}, 	
		[44]	= {Minutes = 1.5, 	Units = {281}},
		[77]	= {Seconds = 50, 	Units = {281, 281, 281, 280}},
	},
	NpcBuildingsExist = {X = 130, Y = 45, Range = 0},     
}

    
-- RTS SPAWN, Schatzkammer
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 50,
	X = 113,
	Y = 166,
	Range = 2,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {153, 296, 294, 295, 153, 296, 294, 295}, 	-- Spectre Lifatap/Amok/Manadrain/Shock
	SpawnData =
	{
		[2]		= {Minutes = 4, 	Units = {295}},	
		[19]	= {Minutes = 3.5, 	Units = {294}},	
		[34]	= {Minutes = 2, 	Units = {294, 295}}, 	
		[47]	= {Minutes = 1.5, 	Units = {296}},
		[69]	= {Seconds = 50, 	Units = {296, 153, 294, 295}},
	},
	NpcBuildingsExist = {X = 113, Y = 164, Range = 0},     
}

-- RTS SPAWN, Bibliothek
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 45,
	X = 392,
	Y = 185,
	Range = 3,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {153, 296, 294, 295, 153, 296, 294, 295}, 	-- Spectre Lifatap/Amok/Manadrain/Shock
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {295}},	
		[19]	= {Minutes = 3.5, 	Units = {294}},	
		[36]	= {Minutes = 2, 	Units = {294, 295}}, 	
		[49]	= {Minutes = 1.5, 	Units = {296}},
		[75]	= {Seconds = 50, 	Units = {296, 153, 294, 295}},
	},
	NpcBuildingsExist = {X = 391, Y = 188, Range = 0},     
}



-- RTS SPAWN, Gesindehaus Zombies
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 30,
	X = 338,
	Y = 188,
	Range = 1,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {227, 227, 227, 227, 227, 227, 227, 226, 226}, 	-- Zombie 10 Dolch/Fist
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {227}},	
		[23]	= {Minutes = 3, 	Units = {226}},	
		[39]	= {Minutes = 2, 	Units = {227, 226}}, 	
		[50]	= {Minutes = 1.5, 	Units = {227, 226, 226}},
		[69]	= {Seconds = 50, 	Units = {227, 226, 226, 226}},
	},
	NpcBuildingsExist = {X = 337, Y = 180, Range = 0},     
}


-- RTS SPAWN, Gesindehaus Skelette
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 20,
	X = 329,
	Y = 225,
	Range = 3,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1301, 1301, 1301, 147, 147, 147, 147, 149}, 	--Skeleton 8 2H-Schwert/Stachelkeule + Schild/Skeleton 8 Bow
	SpawnData =
	{
		[2]		= {Minutes = 4, 	Units = {1301}},	
		[19]	= {Minutes = 3.5, 	Units = {147}},	
		[34]	= {Minutes = 3, 	Units = {1301, 147}}, 	
		[47]	= {Minutes = 2, 	Units = {1301, 149}},
		[69]	= {Minutes = 1.5, 	Units = {1301, 147, 149, 149}},
	},
	NpcBuildingsExist = {X = 324, Y = 225, Range = 0},     
}


-- RTS SPAWN, Stallungen Zombies
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 30,
	X = 425,
	Y = 325,
	Range = 3,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {227, 227, 227, 227, 227, 227, 227, 226, 226}, 	-- Zombie 10 Dolch/Fist
	SpawnData =
	{
		[2]		= {Minutes = 3.5, 	Units = {227}},	
		[23]	= {Minutes = 3, 	Units = {226}},	
		[39]	= {Minutes = 2, 	Units = {227, 226}}, 	
		[47]	= {Minutes = 1.5, 	Units = {226}},
		[69]	= {Seconds = 50, 	Units = {227, 226, 226, 226}},
	},
	NpcBuildingsExist = {X = 426, Y = 327, Range = 2},     
}



-- RTS SPAWN, Stallungen Skelette
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 30,
	X = 424,
	Y = 289,
	Range = 2,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1301, 1301, 147, 147, 147, 147, 147, 149, 149}, 	--Skeleton 8 2H-Schwert/Stachelkeule + Schild/Skeleton 8 Bow
	SpawnData =
	{
		[2]		= {Minutes = 4, 	Units = {1301}},	
		[19]	= {Minutes = 3, 	Units = {147}},	
		[34]	= {Minutes = 2.5, 	Units = {1301, 147}}, 	
		[47]	= {Minutes = 2, 	Units = {1301, 147}},
		[69]	= {Minutes = 1.5, 	Units = {1301, 147, 149, 149}},
	},
	NpcBuildingsExist = {X = 421, Y = 285, Range = 0},     
}


-- RTS SPAWN, Folterturm
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 35,
	X = 133,
	Y = 453,
	Range = 1,
	
	
	Timer	= "WisperMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {153, 296, 294, 295, 153, 296, 294, 295}, 	-- Spectre Lifatap/Amok/Manadrain/Shock
	SpawnData =
	{
		[5]		= {Minutes = 4.5, 	Units = {294}},	
		[23]	= {Minutes = 3.5, 	Units = {295}},	
		[49]	= {Minutes = 2, 	Units = {296}},
		[75]	= {Minutes = 1.5, 	Units = {296, 153, 294, 295}},
	},
	NpcBuildingsExist = {X = 136, Y = 448, Range = 0},     
}



-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Oase1 =
{
	X = 259,
	Y = 279,
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
		352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}


Oase2 =
{
	X = 282,
	Y = 253,
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
		352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

Oase3 =
{
	X = 251,
	Y = 241,
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
		352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

AmSee =
{
	X = 197,
	Y = 182,
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




Westen =
{
	X = 163,
	Y = 178,
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

Osten =
{
	X = 388,
	Y = 319,
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
		350	--Animal Blackwulf
	},                    
	ShuffleUnits = FALSE,
	
}

SchluchtOsten =
{
	X = 331,
	Y = 181,
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


NordWesten =
{
	X = 281,
	Y = 402,
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
	Clan = 15, 
	Groups = {Oase1, Oase2, Oase3, AmSee, Westen, Osten, SchluchtOsten, NordWesten},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 15, MaxClanSize = 23,
	Groups = {Oase1, Oase2, Oase3, AmSee, Westen, Osten, SchluchtOsten, NordWesten},
	Conditions = 	
	{
	},
}
