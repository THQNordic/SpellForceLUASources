-- RTS Spawn:
-- p19 Mulandir


-- spawning off, da RPG karte


REM = [[

-- RTS SPAWN, Basilisk 1
Basilisk1 =
{
	X = 205,
	Y = 89,
	Range = 1,
	Chief = 2659,	-- Geistbrecher
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		319, 319, 319 -- Basilisk1
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 27, 
	Groups = {Basilisk1},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 27, MaxClanSize = 4,
	Groups = {Basilisk1},
	Conditions = 	
	{
	},
}

-- Basilisk2

Basilisk2 =
{
	X = 230,
	Y = 185,
	Range = 1,
	Chief = 2660,	-- Geistbrecher
	WaitTime = 90,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		319, 319, 319 -- Basilisk1
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 26, 
	Groups = {Basilisk2},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 26, MaxClanSize = 5,
	Groups = {Basilisk2},
	Conditions = 	
	{
	},
}


-- RTS SPAWN, Basilisk3
Basilisk3 =
{
	X = 80,
	Y = 272,
	Range = 5,
	Chief = 2802,	-- Steinwurm
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		319, 319, 319 -- Basilisk3
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 25, 
	Groups = {Basilisk3},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 25, MaxClanSize = 15,
	Groups = {Basilisk3},
	Conditions = 	
	{
	},
}

-- Manticore1

Manticore1 =
{
	X = 282,
	Y = 125,
	Range = 1,
	Chief = 2661,	-- Brandstifter
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
		
	},
	Units = 
	{
		197, 197, 197, 197 --Manticore
	},                    
	ShuffleUnits = FALSE,
	
}



InitSpawn
{
	Clan = 24, 
	Groups = {Manticore1},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 24, MaxClanSize = 6,
	Groups = {Manticore1},
	Conditions = 	
	{
	},
}


Manticore2 =
{
	X = 134,
	Y = 117,
	Range = 2,
	Chief = 2803,	-- Feuerkralle
	WaitTime = 90,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		197, 197, 197, 197, 197, 197, 197 --Manticore
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 23, 
	Groups = {Manticore2},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 23, MaxClanSize = 8,
	Groups = {Manticore2},
	Conditions = 	
	{
	},
}




Manticore3 =
{
	X = 134,
	Y = 195,
	Range = 2,
	Chief = 2662,	-- Brandstifter
	WaitTime = 20,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		197, 197, 197, 197, 197, 197, 197 --Manticore
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 22, 
	Groups = {Manticore3},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 22, MaxClanSize = 10,
	Groups = {Manticore3},
	Conditions = 	
	{
	},
}


-- RTS SPAWN, Demon1
Demon1 =
{
	X = 291,
	Y = 95,
	Range = 1,
	Chief = 2663,	-- Feuerterror
	WaitTime = 80,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		185, 185	--Lesser Demon Wave of Fire
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 21, 
	Groups = {Demon1},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 21, MaxClanSize = 2,
	Groups = {Demon1},
	Conditions = 	
	{
	},
}

-- RTS SPAWN, Demon1Reinforce
Demon1Reinforce =
{
	X = 291,
	Y = 95,
	Range = 1,
	Chief = 2663,	-- Feuerterror
	WaitTime = 80,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		178, 178	--Lesser Demon Melee
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 20, 
	Groups = {Demon1Reinforce},
	Conditions = 	
	{
		-- !!! Got Aggro fehlt
	},
}
		
RtsSpawn
{
	Clan = 20, MaxClanSize = 2,
	Groups = {Demon1Reinforce},
	Conditions = 	
	{
	},
}


-- RTS SPAWN, Demon2
Demon2 =
{
	X = 172,
	Y = 140,
	Range = 3,
	Chief = 2804,	-- Feuerterror
	WaitTime = 80,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		185, 185	--Lesser Demon Wave of Fire
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 19, 
	Groups = {Demon2},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 19, MaxClanSize = 2,
	Groups = {Demon2},
	Conditions = 	
	{
	},
}

-- RTS SPAWN, Demon2Reinforce
Demon2Reinforce =
{
	X = 172,
	Y = 140,
	Range = 3,
	Chief = 2804,	-- Feuerterror
	WaitTime = 80,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		178, 178	--Lesser Demon Melee
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 18, 
	Groups = {Demon2Reinforce},
	Conditions = 	
	{
		-- !!! Got Aggro fehlt
	},
}
		
RtsSpawn
{
	Clan = 18, MaxClanSize = 2,
	Groups = {Demon2Reinforce},
	Conditions = 	
	{
	},
}

-- RTS SPAWN, Demon3
Demon3 =
{
	X = 245,
	Y = 231,
	Range = 3,
	Chief = 2805,	-- Ar´zach
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		185, 185	--Lesser Demon Wave of Fire
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 17, 
	Groups = {Demon3},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 17, MaxClanSize = 2,
	Groups = {Demon3},
	Conditions = 	
	{
	},
}

-- RTS SPAWN, Demon3Reinforce
Demon3Reinforce =
{
	X = 245,
	Y = 231,
	Range = 3,
	Chief = 2805,	-- Ar´zach
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		178, 178	--Lesser Demon Melee
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 16, 
	Groups = {Demon3Reinforce},
	Conditions = 	
	{
		-- !!! Got Aggro fehlt
	},
}
		
RtsSpawn
{
	Clan = 16, MaxClanSize = 2,
	Groups = {Demon3Reinforce},
	Conditions = 	
	{
	},
}

-- Gargoyle

Gargoyle1 =
{
	X = 330,
	Y = 281,
	Range = 1,
	Chief = 2806,	-- Blutstein
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		326, 326 -- Gargoyl Aura of Slow Fighting
	},                    
	ShuffleUnits = FALSE,
	
}

Gargoyle2 =
{
	X = 347,
	Y = 258,
	Range = 1,
	Chief = 2806,	-- Blutstein
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{	
		326, 326 -- Gargoyl Aura of Slow Fighting
	},                    
	ShuffleUnits = FALSE,
	
}

Gargoyle3 =
{
	X = 316,
	Y = 240,
	Range = 1,
	Chief = 2806,	-- Blutstein
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		326, 326 -- Gargoyl Aura of Slow Fighting
	},                    
	ShuffleUnits = FALSE,
	
}

Gargoyle4 =
{
	X = 312,
	Y = 265,
	Range = 1,
	Chief = 2806,	-- Blutstein
	WaitTime = 40,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		326, 326 -- Gargoyl Aura of Slow Fighting
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 15, 
	Groups = {Gargoyle1, Gargoyle2, Gargoyle3, Gargoyle4},
	Conditions = 	
	{
		-- !!! Got Aggro fehlt
	},
}
		
RtsSpawn
{
	Clan = 15, MaxClanSize = 8,
	Groups = {Gargoyle1, Gargoyle2, Gargoyle3, Gargoyle4},
	Conditions = 	
	{
	},
}


Medusa1 =
{
	X = 125,
	Y = 223,
	Range = 1,
	Chief = 2807,	-- Gespielin der Ewigkeit
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		326, 326, 326, 326 -- Gargoyl Aura of Slow Fighting
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 14, 
	Groups = {Medusa1},
	Conditions = 	
	{
		-- !!! Got Aggro fehlt
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 4,
	Groups = {Medusa1},
	Conditions = 	
	{
	},
}
Medusa2 =
{
	X = 133,
	Y = 395,
	Range = 1,
	Chief = 2808,	-- Schlangentänzerin
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		326, 326, 326, 326, 326, 326, -- Gargoyl Aura of Slow Fighting
		319, 319 -- Basilisk1
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 13, 
	Groups = {Medusa2},
	Conditions = 	
	{
		-- !!! Got Aggro fehlt
	},
}
		
RtsSpawn
{
	Clan = 13, MaxClanSize = 8,
	Groups = {Medusa2},
	Conditions = 	
	{
	},
}

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------

AufbauZone1 =
{
	X = 367,
	Y = 415,
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


AufbauZone2 =
{
	X = 335,
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
		348, 348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = FALSE,
	
}

AufbauZone3 =
{
	X = 442,
	Y = 423,
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
		202,	-- Spider Giant Black 7 Lesser
		751, 751, 751, 751, 751		-- Spider Tiny Black 2
	},                    
	ShuffleUnits = FALSE,
	
}

Ruinenbereich =
{
	X = 247,
	Y = 338,
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
		211, 211, 211 --Giant Beetle 8 Rock 
	},                    
	ShuffleUnits = FALSE,
	
}

Obelisk =
{
	X = 271,
	Y = 200,
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
		211, 211 --Giant Beetle 8 Rock
	},                    
	ShuffleUnits = FALSE,
	
}

Arena =
{
	X = 307,
	Y = 212,
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
		202, 202	-- Spider Giant Black 7 Lesser
	},                    
	ShuffleUnits = FALSE,
	
}

RuinenbereichArena =
{
	X = 386,
	Y = 236,
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
		202,	-- Spider Giant Black 7 Lesser
		751, 751,		-- Spider Tiny Black 2
		211, 211 --Giant Beetle 8 Rock
	},                    
	ShuffleUnits = FALSE,
	
}

GrosserLavaseeOst =
{
	X = 269,
	Y = 85,
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
		211, 211, 211, 211, 211 --Giant Beetle 8 Rock
	},                    
	ShuffleUnits = FALSE,
	
}

SWesten =
{
	X = 160,
	Y = 89,
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
		202,	-- Spider Giant Black 7 Lesser
		751, 751		-- Spider Tiny Black 2
	},                    
	ShuffleUnits = FALSE,
	
}


NordWesten =
{
	X = 90,
	Y = 373,
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
		202,		-- Spider Giant Black 7 Lesser
		751, 751,	-- Spider Tiny Black 2
		211, 211	--Giant Beetle 8 Rock
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 12, 
	Groups = {AufbauZone1, AufbauZone2, AufbauZone3, Ruinenbereich, Obelisk, Arena, RuinenbereichArena, GrosserLavaseeOst, SWesten, NordWesten},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 12, MaxClanSize = 35,
	Groups = {AufbauZone1, AufbauZone2, AufbauZone3, Ruinenbereich, Obelisk, Arena, RuinenbereichArena, GrosserLavaseeOst, SWesten, NordWesten},
	Conditions = 	
	{
	},
}

]]