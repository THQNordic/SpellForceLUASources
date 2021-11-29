-- RTS Spawn:
-- p103 Hero Rune 02

GlobalSpawnDuration = 90

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 32, Y = 231, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "HeroRune02MonumentClaimedTimer"},
	}
}

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		--IsMonumentInUse {X = 199, Y = 351, Range = 0, UpdateInterval = 10},
		IsGlobalFlagTrue{Name = "Nordtor_auf"},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "HeroRune02Monument2ClaimedTimer"},
	}
}


--Wenn das erste Orktor geöffnet wurde
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue{ Name = "OrkTor_offen", UpdateInterval =10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "HeroRune02OrkTorGeoeffnetTimer"},
	}
}



----3 Ogerhuetten bei Eisen 
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 12,
	X = 140,
	Y = 268,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {686,687,686,687,687,686}, 	--Oger Level 4
	SpawnData =
	{
		[0]		= {Minutes = 2, 	Units = {686}},
		[15]	= {Minutes = 2, 	Units = {686, 687}}, 
		[25]	= {Minutes = 2, 	Units = {686}},
		[45]	= {Minutes = 1.5, 	Units = {686, 687}},
		[70]	= {Minutes = 1, 	Units = {687}},
	},
	NpcBuildingsExist = {X = 140, Y = 268, Range = 15}
	
}

----Orklager von Sveran 01
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 12,
	X = 93,
	Y = 377,
	Range = 3,
	
	
	Timer	= "HeroRune02OrkTorGeoeffnetTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {369, 370, 370, 369, 369, 370}, 	--Orks Level 4
	SpawnData =
	{
		[10]	= {Minutes = 2, 	Units = {370}},
		[25]	= {Minutes = 2.5, 	Units = {369, 370}}, 
		[40]	= {Minutes = 2, 	Units = {370}},
		[55]	= {Minutes = 1, 	Units = {369, 369}},
		[70]	= {Minutes = 1, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 99, Y = 387, Range = 10}
	
}

----Orklager von Sveran 02 
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 12,
	X = 84,
	Y = 424,
	Range = 3,
	
	
	Timer	= "HeroRune02OrkTorGeoeffnetTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {370, 370, 369, 369, 370, 370}, 	--Orks Level 4
	SpawnData =
	{
		[15]	= {Minutes = 3, 	Units = {369}},
		[25]	= {Minutes = 3.5, 	Units = {370, 369}}, 
		[40]	= {Minutes = 3, 	Units = {370}},
		[50]	= {Minutes = 2, 	Units = {370, 370}},
		[70]	= {Minutes = 1.5, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 75, Y = 430, Range = 10}
	
}

----Orklager von Sveran 03 
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 12,
	X = 131,
	Y = 392,
	Range = 3,
	
	
	Timer	= "HeroRune02OrkTorGeoeffnetTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {369, 370, 370, 370}, 	--Orks Level 4
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {370}},
		[15]	= {Minutes = 4.5, 	Units = {370, 370}}, 
		[25]	= {Minutes = 4, 	Units = {370}},
		[45]	= {Minutes = 3, 	Units = {369, 369}},
		[70]	= {Minutes = 2, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 133, Y = 398, Range = 10}
	
}


----Orklager von Händler 
RtsSpawnNT
{
	Clan = 14,
	MaxClanSize = 6,
	X = 179,
	Y = 436,
	Range = 3,
	
	
	Timer	= "HeroRune02Monument2ClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {370, 369, 370, 370, 369, 370}, 	--Orks Level 4
	SpawnData =
	{
		[15]	= {Minutes = 3, 	Units = {369}},
		[25]	= {Minutes = 3.5, 	Units = {369, 370}}, 
		[45]	= {Minutes = 3, 	Units = {370}},
		[55]	= {Minutes = 2, 	Units = {370, 370}},
		[70]	= {Minutes = 1.5, 	Units = {369}},
	},
	NpcBuildingsExist = {X = 183, Y = 438, Range = 10}
	
}



----Orklager 2 von Händler 
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 6,
	X = 197,
	Y = 402,
	Range = 3,
	
	
	Timer	= "HeroRune02Monument2ClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {370, 370, 370, 369, 370}, 	--Orks Level 4
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {369}},
		[15]	= {Minutes = 3.5, 	Units = {370, 369}}, 
		[25]	= {Minutes = 3, 	Units = {370}},
		[45]	= {Minutes = 2, 	Units = {369, 369}},
		[70]	= {Minutes = 1.5, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 191, Y = 399, Range = 10}
	
}

----Orklager 3 von Händler 
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 6,
	X = 220,
	Y = 419,
	Range = 3,
	
	
	Timer	= "HeroRune02Monument2ClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {369, 370, 370, 370, 369, 370}, 	--Orks Level 4
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {370}},
		[15]	= {Minutes = 3.5, 	Units = {370, 369}}, 
		[25]	= {Minutes = 3, 	Units = {370}},
		[45]	= {Minutes = 2, 	Units = {370, 370}},
		[70]	= {Minutes = 1.5, 	Units = {369}},
	},
	NpcBuildingsExist = {X = 225, Y = 422, Range = 3}
	
}

----Lager01 OgerFestung03 im Süd-Osten 
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 12,
	X = 307,
	Y = 238,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {686, 687, 686, 687, 686, 687}, 	--Oger Level 4
	SpawnData =
	{
		[15]	= {Minutes = 3, 	Units = {686}},
		[25]	= {Minutes = 3.5, 	Units = {686, 687}}, 
		[35]	= {Minutes = 3, 	Units = {686}},
		[45]	= {Minutes = 2, 	Units = {686, 687}},
		[70]	= {Minutes = 1.5, 	Units = {687}},
	},
	NpcBuildingsExist = {X = 306, Y = 236, Range = 15}
	
}

----Lager02 OrkFestung03 im Süd-Osten 
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 12,
	X = 318,
	Y = 260,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {370, 369, 370, 370, 370, 369}, 	--Orks Level 4
	SpawnData =
	{
		[15]	= {Minutes = 3, 	Units = {369}},
		[25]	= {Minutes = 3.5, 	Units = {370, 369}}, 
		[35]	= {Minutes = 3, 	Units = {370}},
		[45]	= {Minutes = 2, 	Units = {369, 370}},
		[70]	= {Minutes = 1.5, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 324, Y = 257, Range = 15}
	
}

----Orklager von Whorim 01 
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 12,
	X = 389,
	Y = 331,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {370, 369}, 	--Orks Level 4
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {370}},
		[15]	= {Minutes = 3.5, 	Units = {369, 370}}, 
		[25]	= {Minutes = 3, 	Units = {370}},
		[45]	= {Minutes = 2, 	Units = {370, 369}},
		[70]	= {Minutes = 1.5, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 393, Y = 325, Range = 3}
	
}

----Orklager von Whorim 02 
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 12,
	X = 372,
	Y = 341,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {370, 370}, 	--Orks Level 4
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {370}},
		[15]	= {Minutes = 3.5, 	Units = {370, 370}}, 
		[25]	= {Minutes = 3, 	Units = {370}},
		[45]	= {Minutes = 2, 	Units = {370, 370}},
		[70]	= {Minutes = 1.5, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 365, Y = 341, Range = 3}
	
}

----Orklager von Whorim 03 
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 15,
	X = 377,
	Y = 348,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {369, 370, 370}, 	--Orks Level 4
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {370}},
		[15]	= {Minutes = 3.5, 	Units = {369, 370}}, 
		[25]	= {Minutes = 3, 	Units = {369}},
		[45]	= {Minutes = 2, 	Units = {370, 370}},
		[70]	= {Minutes = 1.5, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 372, Y = 353, Range = 3}
	
}

----Orklager von Whorim 04 
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 12,
	X = 392,
	Y = 312,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {369, 369, 370, 370}, 	--Orks Level 4
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {369}},
		[15]	= {Minutes = 3.5, 	Units = {369, 370}}, 
		[25]	= {Minutes = 3, 	Units = {370}},
		[45]	= {Minutes = 2, 	Units = {369, 370}},
		[70]	= {Minutes = 1.5, 	Units = {369}},
	},
	NpcBuildingsExist = {X = 398, Y = 310, Range = 3}
	
}

----Huette bei Ariaquelle 
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 12,
	X = 154,
	Y = 187,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {686, 687, 686, 687, 686, 687}, 	--Oger Level 4
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {686}},
		[15]	= {Minutes = 3.5, 	Units = {686, 687}}, 
		[25]	= {Minutes = 3, 	Units = {686}},
		[45]	= {Minutes = 2, 	Units = {686, 687}},
		[70]	= {Minutes = 1.5, 	Units = {686}},
	},
	NpcBuildingsExist = {X = 150, Y = 182, Range = 3}
}
	
----Orklager vor Sveran 01
RtsSpawnNT
{
	Clan = 13,
	MaxClanSize = 6,
	X = 55,
	Y = 324,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {370, 369, 370, 370, 370, 370}, 	--Orks Level 4
	SpawnData =
	{
		[15]	= {Minutes = 2, 	Units = {370}},
		[20]	= {Minutes = 2.5, 	Units = {370, 370}}, 
		[40]	= {Minutes = 2, 	Units = {369}},
		[55]	= {Minutes = 1, 	Units = {370, 369}},
		[70]	= {Minutes = 1, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 55, Y = 324, Range = 5}
	
}

----Orklager vor Sveran 02
RtsSpawnNT
{
	Clan = 12,
	MaxClanSize = 6,
	X = 48,
	Y = 332,
	Range = 3,
	
	
	Timer	= "HeroRune02MonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {370, 369, 370, 370, 370, 370}, 	--Orks Level 4
	SpawnData =
	{
		[15]	= {Minutes = 2, 	Units = {370}},
		[20]	= {Minutes = 2.5, 	Units = {370, 370}}, 
		[40]	= {Minutes = 2, 	Units = {369}},
		[55]	= {Minutes = 1, 	Units = {370, 369}},
		[70]	= {Minutes = 1, 	Units = {370}},
	},
	NpcBuildingsExist = {X = 48, Y = 332, Range = 5}
	
}

	
