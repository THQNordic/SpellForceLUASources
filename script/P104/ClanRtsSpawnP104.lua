-- RTS Spawn:
-- p104 flee to ice

GlobalSpawnDuration = 90

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 386, Y = 146, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "FleeToIceMonumentClaimedTimer"},
	}
}

----Trolle am Orkdorf Nördlich
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 420,
	Y = 201,
	Range = 3,
	
	
	Timer	= "FleeToIceMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1594, 1594, 1594, 1595, 1595, 1595, 1596}, 	--Urok Destroy 3, Devastator 4, Champion 5
	SpawnData =
	{
		[2]	= {Minutes = 3, 	Units = {1594}},
		[15]	= {Minutes = 3.5, 	Units = {1594}},
		[25]	= {Minutes = 3, 	Units = {1594, 1595}},
		[45]	= {Minutes = 2, 	Units = {1594, 1594, 1595}},
		[70]	= {Minutes = 1.5, 	Units = {1596}},
	},
	NpcBuildingsExist = {X = 420, Y = 201, Range = 15}
	
}

----Trolle am Orkdorf Suedlich
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 12,
	X = 354,
	Y = 87,
	Range = 3,
	
	
	Timer	= "FleeToIceMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1594, 1594, 1594, 1595, 1595, 1595, 1596}, --Urok Destroy 3, Devastator 4, Champion 5
	SpawnData =
	{
		[5]		= {Minutes = 3, 	Units = {1594}},
		[17]	= {Minutes = 3.5, 	Units = {1594, 1595}}, -- Troll Urok Thrower
		[27]	= {Minutes = 3, 	Units = {1594}},
		[47]	= {Minutes = 2, 	Units = {1594, 1594, 1595}},
		[75]	= {Minutes = 1.5, 	Units = {1595, 1596}},
	},
	NpcBuildingsExist = {X = 352, Y = 80, Range = 10}
	
}


-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Waldschrat =
{
	X = 360,
	Y = 119,
	Range = 5,
	Chief = 0,	
	WaitTime = SchratSpawnTime,
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


Waldschrat1 =
{
	X = 327,
	Y = 80,
	Range = 2,
	Chief = 0,	
	WaitTime = SchratSpawnTime,
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
	ShuffleUnits = FALSE,
	
}

Waldschrat2 =
{
	X = 296,
	Y = 125,
	Range = 2,
	Chief = 0,	
	WaitTime = SchratSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		
		
		348		-- Wild Boar
		
	},                    
	ShuffleUnits = FALSE,
	
}

Waldschrat3 =
{
	X = 254,
	Y = 140,
	Range = 2,
	Chief = 0,	
	WaitTime = SchratSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354,	--Animal Deer Old
		353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose´
	},                    
	ShuffleUnits = TRUE,
	
}

Waldschrat4 =
{
	X = 234,
	Y = 160,
	Range = 3,
	Chief = 0,	
	WaitTime = SchratSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		349, 349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 14, 
	Groups = {Waldschrat, Waldschrat1, Waldschrat2, Waldschrat3, Waldschrat4},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 30,
	Groups = {Waldschrat, Waldschrat1, Waldschrat2, Waldschrat3, Waldschrat4},
	Conditions = 	
	{
	},
}
