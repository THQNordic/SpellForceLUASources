-- RTS Spawn:
-- p23 The Rift

--!!! Lesser Demons Rain of Fire, in Absprache mit Arne, durch Wave of Fire ersetzt, weil a) die KI das zur Zeit sowieso nicht kann und b) es auch zu heftig sein könnte
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		-- Links Orc Monument, Links Troll Monument
		IsMonumentInUse {X = 57, Y = 266, Range = 0},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "RiftMonumentClaimedTimer"},
	}
}


-- RTS SPAWN, Daemonen auf dem ersten Pass
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 20,
	X = 151,
	Y = 166,
	Range = 3,
	
	
	Timer	= "RiftMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {179, 179, 179, 179, 179},
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {179}},	
		[20]	= {Minutes = 3, 	Units = {179}},	
		[35]	= {Minutes = 2.5, 	Units = {179}}, 	
		[45]	= {Minutes = 1.5, 	Units = {179}},
		[70]	= {Seconds = 50, 	Units = {179}},
	},
	NpcBuildingsExist = {X = 146, Y = 166, Range = 0},     
}
---- RTS SPAWN, Aufbaustörer Manticoras
--RtsSpawnNT
--{
--	Clan = 27,
--	MaxClanSize = 15,
--	X = 121,
--	Y = 277,
--	Range = 3,
--	
--	
--	Timer	= "RiftMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {197, 197, 197, 197, 197, 197}, 	--Skeleton 8 2H-Schwert/Stachelkeule + Schild/Skeleton 8 Bow
--	SpawnData =
--	{
--		[1]		= {Minutes = 3, 	Units = {197}},	
--		[19]	= {Minutes = 3, 	Units = {197}},	
--		[37]	= {Minutes = 2.5, 	Units = {197}}, 	
--		[42]	= {Minutes = 1.5, 	Units = {197}},
--		[73]	= {Seconds = 50, 	Units = {197}},
--	},
--	NpcBuildingsExist = {X = 121, Y = 270, Range = 0},     
--}
--
---- Erste Wanderdämonentruppe
--RtsSpawnNT
--{
--	Clan = 26,
--	MaxClanSize = 10,
--	X = 194,
--	Y = 177,
--	Range = 3,
--	
--	
--	Timer	= "RiftMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
--	Init	= {319, 319, 319, 319, 319, 319}, 	--Skeleton 8 2H-Schwert/Stachelkeule + Schild/Skeleton 8 Bow
--	SpawnData =
--	{
--		[0]		= {Minutes = 3, 	Units = {319}},	
--		[17]	= {Minutes = 3, 	Units = {319}},	
--		[35]	= {Minutes = 2.5, 	Units = {319}}, 	
--		[44]	= {Minutes = 1.5, 	Units = {319}},
--		[69]	= {Seconds = 50, 	Units = {319}},
--	},
--	NpcBuildingsExist = {X = 197, Y = 176, Range = 0},     
--}
--




-- RTS SPAWN, FireCasterDemons1
comment = [[
FireCasterDemons1 =
{
	X = 153,
	Y = 289,
	Range = 1,
	Chief = 2595, -- Feuerterror
	WaitTime = 65,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{

	},
	Units = 
			{
				179, 179, 179, 179	-- Demon Lesser 12 Wave of Fire
			},
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 25, 
	Groups = {FireCasterDemons1},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 25, MaxClanSize = 4,
	Groups = {FireCasterDemons1},
	Conditions	= 	
	{
	},
}


-- RTS SPAWN, FireCasterDemons2

FireCasterDemons2 =
{
	X = 140,
	Y = 252,
	Range = 1,
	Chief = 2596, --  Feuerterror
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		179, 179, 179, 179, 179	-- Demon Lesser 12 Wave of Fire
		--1013				-- Demon Lesser 12 Rain of Fire
	},
	ShuffleUnits = TRUE,
	
}

InitSpawn
{
	Clan = 24, 
	Groups = {FireCasterDemons2},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 24, MaxClanSize = 5,
	Groups = {FireCasterDemons2},
	Conditions	= 	
	{
	},
}

-- RTS SPAWN, FireCasterDemons3

FireCasterDemons3 =
{
	X = 213,
	Y = 267,
	Range = 1,
	Chief = 2597, -- Feuerterror
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		179, 179, 179, 179, 179, 179, 179	-- Demon Lesser 12 Wave of Fire
		--1013, 1013, 1013				-- Demon Lesser 12 Rain of Fire
	},
	ShuffleUnits = TRUE,
	
}

InitSpawn
{
	Clan = 23, 
	Groups = {FireCasterDemons3},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 23, MaxClanSize = 7,
	Groups = {FireCasterDemons3},
	Conditions	= 	
	{
	},
}


-- RTS SPAWN, FireCasterDemons4

FireCasterDemons4 =
{
	X = 238,
	Y = 222,
	Range = 1,
	Chief = 2598, -- Feuerterror 
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		179, 179, 179, 179, 179, 179, 179	-- Demon Lesser 12 Wave of Fire
		--1013, 1013, 1013				-- Demon Lesser 12 Rain of Fire
	},
	ShuffleUnits = TRUE,
	
}

InitSpawn
{
	Clan = 22, 
	Groups = {FireCasterDemons4},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 22, MaxClanSize = 5,
	Groups = {FireCasterDemons4},
	Conditions	= 	
	{
	},
}

-- RTS SPAWN, FireCasterDemons5

FireCasterDemons5 =
{
	X = 322,
	Y = 210,
	Range = 1,
	Chief = 2599, -- Feuerterror 
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		179, 179, 179, 179, 179, 179, 179, 179, 179	-- Demon Lesser 12 Wave of Fire
		--1013, 1013, 1013, 1013				-- Demon Lesser 12 Rain of Fire
	},
	ShuffleUnits = TRUE,
	
}

InitSpawn
{
	Clan = 21, 
	Groups = {FireCasterDemons5},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 21, MaxClanSize = 9,
	Groups = {FireCasterDemons5},
	Conditions	= 	
	{
	},
}

FireCasterDemons6 =
{
	X = 364,
	Y = 213,
	Range = 1,
	Chief = 2600, -- Feuerterror 
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		179, 179, 179, 179, 179, 179, 179, 179, 179, 179, 179, 179	-- Demon Lesser 12 Wave of Fire
		--1013, 1013, 1013, 1013, 1013				-- Demon Lesser 12 Rain of Fire
	},
	ShuffleUnits = TRUE,
	
}

InitSpawn
{
	Clan = 20, 
	Groups = {FireCasterDemons6},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 20, MaxClanSize = 12,
	Groups = {FireCasterDemons6},
	Conditions	= 	
	{
	},
}





-- RTS SPAWN, Basilisken2

Basilisken2 =
{
	X = 436,
	Y = 336,
	Range = 1,
	Chief = 2602,	-- Geistbrecher 
	WaitTime = 20,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		319, 319, 319, 319, 319, 319, 319, 319	-- Basilisk 11
	},
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 18, 
	Groups = {Basilisken2},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 18, MaxClanSize = 8,
	Groups = {Basilisken2},
	Conditions	= 	
	{
	},
}


-- RTS SPAWN, LavaGolem1

LavaGolem1 =
{
	X = 298,
	Y = 323,
	Range = 1,
	Chief = 2603,	-- Vulcanoid 
	WaitTime = 90,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		120, 120,	-- LavaGolem 14 Fireshield
		121, 121	-- LavaGolem 14 Melee
	},
	ShuffleUnits = TRUE
	
}


InitSpawn
{
	Clan = 17, 
	Groups = {LavaGolem1},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 17, MaxClanSize = 4,
	Groups = {LavaGolem1},
	Conditions	= 	
	{
	},
}


-- RTS SPAWN, LavaGolem2

LavaGolem2 =
{
	X = 274,
	Y = 228,
	Range = 2,
	Chief = 2604,	-- Vulcanoid
	WaitTime = 65,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		-- !!! EA Hack
		120, 120, 120, 120, 120, 120, 120, 120,	-- LavaGolem 14 Fireshield
		121, 121, 121, 121, 121, 121	-- LavaGolem 14 Melee
	},
	ShuffleUnits = TRUE,
	
}


InitSpawn
{
	Clan = 16, 
	Groups = {LavaGolem2},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 16, MaxClanSize = 4,
	Groups = {LavaGolem2},
	Conditions	= 	
	{
	},
}

-- RTS SPAWN, Medusa

Medusa =
{
	X = 351,
	Y = 293,
	Range = 2,
	Chief = 2605,	-- Verfluchte Houri
	WaitTime = 55,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		126, 126,	-- Meduas 17 Petrify
		326, 326, 326, 326	-- Gargoyl 13 Aura of Slow Fighting
	},
	ShuffleUnits = TRUE,
	
}


InitSpawn
{
	Clan = 15, 
	Groups = {Medusa},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 15, MaxClanSize = 6,
	Groups = {Medusa},
	Conditions	= 	
	{
	},
}

-- RTS SPAWN, MedusaReinforce

MedusaReinforce =
{
	X = 355,
	Y = 289,
	Range = 2,
	Chief = 2605,	-- Verfluchte Houri
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		126, 126, 126	-- Meduas 17 Petrify
	},
	ShuffleUnits = TRUE,
	
}


InitSpawn
{
	Clan = 14, 
	Groups = {MedusaReinforce},
	Conditions = 
	{
		-- !!!GotAggro
	},
}

RtsSpawn
{
	Clan = 14, MaxClanSize = 3,
	Groups = {MedusaReinforce},
	Conditions	= 	
	{
		--!!!GotAggro
	},
}

-- RTS SPAWN, Succubus

Succubus =
{
	X = 388,
	Y = 206,
	Range = 5,
	Chief = 2606,	-- Sinistrim
	WaitTime = 80,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		338, 338, 338, 
		--338, 338, 338,	-- Succubus 14 Firreball
		--337, 337, 
		337, 337,	-- Succubus 14 Charm
		--1013, 1013, 
		1013,				-- Demon Lesser 12 Rain of Fire
		--179, 179, 
		179,	-- Demon Lesser 12 Wave of Fire
		326, 
		--326	-- Gargoyl 13 Aura of Slow Fighting
		
	},
	ShuffleUnits = TRUE,
}


InitSpawn
{
	Clan = 13, 
	Groups = {Succubus},
	Conditions = 
	{
	},
}

RtsSpawn
{
	Clan = 13, MaxClanSize = 18,
	Groups = {Succubus},
	Conditions	= 	
	{
	},
}

-- RTS SPAWN, SuccubusReinforce

SuccubusReinforce =
{
	X = 388,
	Y = 206,
	Range = 4,
	Chief = 2606,	-- Sinistrim
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		--338, 338, 
		338, 338,	-- Succubus 14 Firreball
		--337, 337, 
		337, 
		--337,	-- Succubus 14 Charm
		179, 179, 
		--179,	-- Demon Lesser 12 Wave of Fire
		326, 326, 
		--326, 326	-- Gargoyl 13 Aura of Slow Fighting
	},
	ShuffleUnits = TRUE,
}


InitSpawn
{
	Clan = 12, 
	Groups = {SuccubusReinforce},
	Conditions = 
	{
		-- !!!GotAggro
	},
}

RtsSpawn
{
	Clan = 12, MaxClanSize = 4,
	Groups = {SuccubusReinforce},
	Conditions	= 	
	{
		--!!!GotAggro
	},
}
]]
comment = nil
-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Lager1_1 =
{
	X = 57,
	Y = 215,
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
		352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}


Lager1_2 =
{
	X = 63,
	Y = 207,
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

Lager2_1 =
{
	X = 444,
	Y = 236,
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
		352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

Lager2_2 =
{
	X = 431,
	Y = 245,
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
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 11, 
	Groups = {Lager1_1, Lager1_2, Lager2_1, Lager2_2},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 11, MaxClanSize = 23,
	Groups = {Lager1_1, Lager1_2, Lager2_1, Lager2_2},
	Conditions = 	
	{
	},
}


---------------------------------------------------
--
--	Postpersistentes Spawnen
--
---------------------------------------------------
--Golem1 =
--{
--	X = 208,
--	Y = 182,
--	Range = 1,
--	Chief = 2830,	-- Lava Golem Meelee
--	WaitTime = 60,
--	AvatarMinLevel = 25,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		120, 120, 120, 120, 120, 120, 120, 120, 120, 120	-- LavaGolem 14 Fireshield
--	},                   
--	ShuffleUnits = FALSE,
--}
--
--InitSpawn
--{
--	Clan = 10, 
--	Groups = {Golem1},
--	Conditions = {},
--}
--
--RtsSpawn
--{
--	Clan = 10, MaxClanSize = 12,
--	Groups = {Golem1},
--	Conditions = 	
--	{
--	},
--}
--
--
--Golem2 =
--{
--	X = 359,
--	Y = 288,
--	Range = 1,
--	Chief = 2832,	-- Lava Golem Meelee
--	WaitTime = 60,
--	AvatarMinLevel = 25,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		120, 120, 120, 120, 120, 	-- LavaGolem 14 Fireshield
--		121, 121, 121, 121, 121, 121	-- LavaGolem 14 Melee
--	},                   
--	ShuffleUnits = TRUE,
--}
--
--InitSpawn
--{
--	Clan = 9, 
--	Groups = {Golem2},
--	Conditions = {},
--}
--
--RtsSpawn
--{
--	Clan = 9, MaxClanSize = 10,
--	Groups = {Golem2},
--	Conditions = 	
--	{
--	},
--}
--
--
--Golem3 =
--{
--	X = 207,
--	Y = 312,
--	Range = 1,
--	Chief = 2833,	-- Lava Golem Meelee
--	WaitTime = 60,
--	AvatarMinLevel = 25,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		120, 120, 120, 120, 120, 	-- LavaGolem 14 Fireshield
--		121, 121, 121, 121, 121, 121	-- LavaGolem 14 Melee
--	},                   
--	ShuffleUnits = TRUE,
--}
--
--InitSpawn
--{
--	Clan = 8, 
--	Groups = {Golem3},
--	Conditions = {},
--}
--
--RtsSpawn
--{
--	Clan = 8, MaxClanSize = 8,
--	Groups = {Golem3},
--	Conditions = 	
--	{
--	},
--}