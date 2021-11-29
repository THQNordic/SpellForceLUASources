-- RTS Spawn:
-- p10 Southern Windwalls










--Beastmen defensiv
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 10,
	X = 323,
	Y = 390,
	Range = 3,
	
	
	Timer	= "SouthernWindwallsTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {725, 725, 725, 215, 215, 215}, 	-- Beastmen Unarmed Paws/ Doppelaxt (Level6)
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {215, 725}},
	},
	NpcBuildingsExist = {X = 327, Y = 388, Range = 0},     
}

 --Beastmen offensiv, durch defensive *g
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 10,
	X = 319,
	Y = 389,
	Range = 3,
	
	
	Timer	= "SouthernWindwallsTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {725, 725, 725, 725, 215, 215, 215}, 	-- Beastmen Unarmed Paws/ Doppelaxt (Level6)
	SpawnData =
	{
		[0]		= {Minutes = 4.5, 	Units = {215, 725}},
	},
	NpcBuildingsExist = {X = 318, Y = 386, Range = 0},     
}


 --Trolle am Gebäude bei Hörgr
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 5,
	X = 244,
	Y = 424,
	Range = 3,
	
	
	Timer	= "SouthernWindwallsTimer",
	Init	= {439, 439, 439, 439, 439}, 	-- Trolle Urok Rowdy
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {439}}, -- Trolle Urok Rowdy
	},
	NpcBuildingsExist = {X = 250, Y = 429, Range = 0},     
}



-- Zwergengeister
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 10,
	X = 706,
	Y = 443,
	Range = 3,
	
	
	Timer	= "SouthernWindwallsTimer",
	Init	= {405, 405, 405, 405, 405}, 	-- Zwergengeister
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {405}}, -- Zwergengeister
	},
	NpcBuildingsExist = {X = 704, Y = 443, Range = 0},     
}


-- Trolle II
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 5,
	X = 588,
	Y = 482,
	Range = 3,
	
	
	Timer	= "SouthernWindwallsTimer",
	Init	= {439, 439, 439, 439, 439}, 	-- Trolle Urok Rowdy
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {439}}, -- Trolle Urok Rowdy
	},
	NpcBuildingsExist = {X = 591, Y = 477, Range = 0},     
}

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
SuedPortal =
{
	X = 270,
	Y = 392,
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
		354, 354,	--Animal Deer Old
		353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}


TrollOutpost =
{
	X = 265,
	Y = 423,
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
		344, 344	-- Animal Brownbear
	},                    
	ShuffleUnits = TRUE,
	
}

BeastmanCamp =
{
	X = 368,
	Y = 455,
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
		349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = TRUE,
	
}

FarmWald =
{
	X = 267,
	Y = 520,
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
		348, 348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}



NordPortal =
{
	X = 306,
	Y = 631,
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
		350, 350	-- Animal BlackWulf
	},                    
	ShuffleUnits = FALSE,
	
}





InitSpawn
{
	Clan = 22, 
	Groups = {SuedPortal, TrollOutpost, BeastmanCamp, FarmWald, NordPortal},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 22, MaxClanSize = 90,
	Groups = {SuedPortal, TrollOutpost, BeastmanCamp, FarmWald, NordPortal},
	Conditions = 	
	{
	},
}

---------------------------------------------------
--
--	Postpesistentes Spawnen
--
---------------------------------------------------
Ghoul1 =
{
	X = 723,
	Y = 454,
	Range = 1,
	Chief = 2828,	-- Ghoul 8 Fist
	WaitTime = 15,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		172, 172, 172, 172, 172, 172, 172, 172	-- Ghoul Cloth 8 Axe
	},                   
	ShuffleUnits = FALSE,
}

InitSpawn
{
	Clan = 21, 
	Groups = {Ghoul1},
	Conditions = {},
}

RtsSpawn
{
	Clan = 21, MaxClanSize = 12,
	Groups = {Ghoul1},
	Conditions = 	
	{
	},
}

Zombie =
{
	X = 669,
	Y = 542,
	Range = 1,
	Chief = 2829,	-- Zombie Dolch
	WaitTime = 15,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		227, 227, 227, 227, 227, 227, 227, 227 --Zombie 10 Dolch
	},                   
	ShuffleUnits = FALSE,
}

InitSpawn
{
	Clan = 20, 
	Groups = {Zombie},
	Conditions = {},
}

RtsSpawn
{
	Clan = 20, MaxClanSize = 8,
	Groups = {Zombie},
	Conditions = 	
	{
	},
}

