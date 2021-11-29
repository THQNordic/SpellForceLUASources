-- RTS Spawn:
-- p108 Herstellung

GlobalSpawnDuration = 90



----Skelette am Nahe Stadt
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 20,
	X = 205,
	Y = 248,
	Range = 3,
	
	
	Timer	= "KarteBetretenP108",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1303, 1303, 1303, 1301, 1301, 1301, 1302}, 	--Level 12 Skelette Chaossschwert und Schwe und Schild
	SpawnData =
	{
		[2]		= {Minutes = 3, 	Units = {1303}},
		[15]	= {Minutes = 3.5, 	Units = {1303}},
		[25]	= {Minutes = 3, 	Units = {1301, 1302}},
		[45]	= {Minutes = 2, 	Units = {1301, 1303, 1302}},
		[70]	= {Minutes = 1.5, 	Units = {1301}},
	},
	NpcBuildingsExist = {X = 205, Y = 248, Range = 15}
	
}

----Skelette im Süden
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 30,
	X = 292,
	Y = 219,
	Range = 3,
	
	
	Timer	= "KarteBetretenP108",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {226, 226, 226, 226, 226, 227, 227}, 	--Zombies 10 Rotting Fist, Säbel
	SpawnData =
	{
		[5]		= {Minutes = 3, 	Units = {226}},
		[18]	= {Minutes = 3.5, 	Units = {227}},
		[33]	= {Minutes = 3, 	Units = {226, 227}},
		[45]	= {Minutes = 2, 	Units = {226, 226, 227}},
		[69]	= {Minutes = 1.5, 	Units = {227}},
	},
	NpcBuildingsExist = {X = 293, Y = 219, Range = 0}
	
}

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
--Waldschrat =
--{
--	X = 360,
--	Y = 119,
--	Range = 5,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
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
--
--Waldschrat1 =
--{
--	X = 327,
--	Y = 80,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		
--		344	-- Animal Brownbear
--		
--	},                    
--	ShuffleUnits = FALSE,
--	
--}
--
--Waldschrat2 =
--{
--	X = 294,
--	Y = 102,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		
--		344	-- Animal Brownbear
--		
--	},                    
--	ShuffleUnits = FALSE,
--	
--}
--
--Waldschrat3 =
--{
--	X = 254,
--	Y = 140,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		354,	--Animal Deer Old
--		353, 353, 353,	-- Animal Deer Young
--		355		-- Animal Moose´
--	},                    
--	ShuffleUnits = TRUE,
--	
--}
--
--Waldschrat4 =
--{
--	X = 234,
--	Y = 160,
--	Range = 3,
--	Chief = 0,	
--	WaitTime = SchratSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		349, 349, 349, 349	--Animal Greywulf
--	},                    
--	ShuffleUnits = FALSE,
--	
--}
--
--
--InitSpawn
--{
--	Clan = 14, 
--	Groups = {Waldschrat, Waldschrat1, Waldschrat2, Waldschrat3, Waldschrat4},
--	Conditions = 	
--	{
--	},
--}
--		
--RtsSpawn
--{
--	Clan = 14, MaxClanSize = 90,
--	Groups = {Waldschrat, Waldschrat1, Waldschrat2, Waldschrat3, Waldschrat4},
--	Conditions = 	
--	{
--	},
--}
