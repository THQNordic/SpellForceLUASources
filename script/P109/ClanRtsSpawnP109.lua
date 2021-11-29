-- RTS Spawn:
-- p109 Warzone

GlobalSpawnDuration = 90

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		ODER(ODER(IsMonumentInUse {X = 106, Y = 391, Range = 0, UpdateInterval = 10},
		IsMonumentInUse {X =  48, Y = 115, Range = 0, UpdateInterval = 10}),
		IsMonumentInUse {X = 388, Y = 441, Range = 0, UpdateInterval = 10})
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "WarZoneSpawnTimer"},
	}
}

OnPlatformOneTimeEvent
{
	Conditions =
	{
		IsGlobalFlagTrue {Name = "EinTrollCamp"},
		IsGlobalFlagTrue {Name = "ZweiTrollCamp"},
	},
	Actions =
	{
		SetGlobalTimeStamp {Name = "TrolleKaputtCounter"},
	}
}


--Dunkelelfen im  Westen I
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 20,
	X = 157,
	Y = 295,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1506, 1507, 1508, 1509, 1510, 1628, 1628, 1672}, 	--Dark Elf Necromancer 9, Deathknight 9, Battlemaster 10, Warlock 10, Havoc 10, Assasin 16
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1509, 1751, 1672}},
		[12]	= {Minutes = 2.5, 	Units = {1507}},
		[25]	= {Minutes = 1, 	Units = {1508, 1509}},
		[45]	= {Minutes = 2, 	Units = {1507, 1508, 1509}},
		[70]	= {Minutes = 1.5, 	Units = {1672}},
	},
	NpcBuildingsExist = {X = 157, Y = 295, Range = 7}
	
}

--Dunkelelfen im  Westen III
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 15,
	X = 162,
	Y = 314,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1506, 1507, 1508, 1509, 1510, 1672, 1672}, --Dark Elf Necromancer 9, Deathknight 9, Battlemaster 10, Warlock 10, Havoc 10, Assasin 16
	SpawnData =
	{
		[3]		= {Minutes = 3, 	Units = {1752, 1507}},
		[17]	= {Minutes = 3, 	Units = {1751}},
		[29]	= {Minutes = 1, 	Units = {1508, 1509}},
		[44]	= {Minutes = 2, 	Units = {1507, 1508, 1509}},
		[69]	= {Minutes = 1.5, 	Units = {1670}},
	},
	NpcBuildingsExist = {X = 162, Y = 314, Range = 10}
	
}

REM = [[
--Westliches Trolllager
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 15,
	X = 45,
	Y = 321,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217, 1218, 1215, 1215}, --Urok Devastator 10, Bouncer 11, Hurler 12, Champion 13
	SpawnData =
	{
		[5]		= {Minutes = 3, 	Units = {1215}},
		[17]	= {Minutes = 3.5, 	Units = {1215}},
		[29]	= {Minutes = 3, 	Units = {1215, 1216}},
		[44]	= {Minutes = 2, 	Units = {1216, 1217, 1216}},
		[69]	= {Minutes = 1.5, 	Units = {1218}},
	},
	NpcBuildingsExist = {X = 46, Y = 322, Range = 15}
	
}
]]

--Trollfestung Part 1
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 389,
	Y = 132,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217, 1218, 1215, 1810}, --Urok Devastator 10, Bouncer 11, Hurler 12, Champion 13  
	SpawnData =
	{
		[10]	= {Minutes = 3.5, 	Units = {1215, 1216}},
		[27]	= {Minutes = 3, 	Units = {1215, 1215, 1217}},
		[39]	= {Minutes = 2.8, 	Units = {1215, 1810}},
		[54]	= {Minutes = 2, 	Units = {1218}},
		[69]	= {Minutes = 1.5, 	Units = {1215}},
	},
	NpcBuildingsExist = {X = 385, Y = 135, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "EinsMegaTrollCamp"},},
	
}


--Trollfestung Part 2
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 15,
	X = 402,
	Y = 108,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217, 1218, 1215, 1215}, --Urok Devastator 10, Bouncer 11, Hurler 12, Champion 13  
	SpawnData =
	{
		[10]	= {Minutes = 3.5, 	Units = {1215, 1216}},
		[27]	= {Minutes = 3, 	Units = {1215, 1215, 1217}},
		[39]	= {Minutes = 2.8, 	Units = {1215, 1216}},
		[54]	= {Minutes = 2, 	Units = {1218}},
		[69]	= {Minutes = 1.5, 	Units = {1215}},
	},
	NpcBuildingsExist = {X = 406, Y = 115, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "ZweiMegaTrollCamp"},},
	
}

--Trollfestung Part 3
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 25,
	X = 438,
	Y = 106,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217, 1218, 1215, 1215}, --Urok Devastator 10, Bouncer 11, Hurler 12, Champion 13  
	SpawnData =
	{
		[ 8]	= {Minutes = 3.5, 	Units = {1215, 1216}},
		[25]	= {Minutes = 3, 	Units = {1215, 1215, 1217}},
		[33]	= {Minutes = 2.8, 	Units = {1215, 1216}},
		[54]	= {Minutes = 2, 	Units = {1810}},
		[69]	= {Minutes = 1.5, 	Units = {1215}},
	},
	NpcBuildingsExist = {X = 438, Y = 106, Range = 15},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "DreiMegaTrollCamp"},},
	
}

--Dunkelelfen im  Westen III
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 10,
	X = 177,
	Y = 291,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1506, 1507, 1508, 1509, 1510, 1672}, --Dark Elf Necromancer 9, Deathknight 9, Battlemaster 10, Warlock 10, Havoc 10
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {1506, 1672}},            
		[13]	= {Minutes = 3.5, 	Units = {1507}},            
		[23]	= {Minutes = 1, 	Units = {1508, 1509, 1672}},      
		--[44]	= {Minutes = 2, 	Units = {1507, 1508, 1509}},
		[69]	= {Minutes = 1.5, 	Units = {1751}},            
	},
	NpcBuildingsExist = {X = 177, Y = 291, Range = 10}
	
}

--Troll direkt am Menschenaufbau
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 15,
	X = 80,
	Y = 160,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217, 1218, 1215, 1215}, --Dark Elf Necromancer 9, Deathknight 9, Battlemaster 10, Warlock 10, Havoc 10, Assasin 16
	SpawnData =
	{
		[ 0]	= {Minutes = 3.5, 	Units = {1215, 1216}},
		[18]	= {Minutes = 3, 	Units = {1215, 1216}},
		[33]	= {Seconds = 50, 	Units = {1215, 1215, 1217}},
		--[54]	= {Minutes = 2, 	Units = {1215}},
		--[69]	= {Minutes = 1.5, 	Units = {1218}},
	},
	NpcBuildingsExist = {X = 75, Y = 164, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "ZweiTrollCamp"},},
	
}

--Troll direkt am Menschenaufbau II
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 25,
	X = 81,
	Y = 153,
	Range = 3,
	
	
	Timer	= "WarZoneSpawnTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217, 1218, 1215, 1215}, --Dark Elf Necromancer 9, Deathknight 9, Battlemaster 10, Warlock 10, Havoc 10, Assasin 16
	SpawnData =
	{
		[ 0]	= {Minutes = 3, 	Units = {1215, 1218}},
		[18]	= {Minutes = 2.5, 	Units = {1215, 1216}},
		[33]	= {Minutes = 1, 	Units = {1215, 1215, 1217}},
		--[54]	= {Minutes = 1.8, 	Units = {1215}},
		--[69]	= {Minutes = 1.5, 	Units = {1218}},
	},
	NpcBuildingsExist = {X = 76, Y = 153, Range = 0},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "EinTrollCamp"},},
}

--Trolle  am Elfenaufbau I
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 20,
	X = 146,
	Y = 395,
	Range = 3,
	
	
	Timer	= "TrolleKaputtCounter",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217, 1218, 1215, 1215}, --Urok Trolle
	SpawnData =
	{
		[ 0]	= {Minutes = 3, 	Units = {1215, 1218}},
		[18]	= {Minutes = 2.5, 	Units = {1215, 1216}},
		[33]	= {Minutes = 2, 	Units = {1215, 1215, 1217}},
		[54]	= {Minutes = 1.8, 	Units = {1215}},
		[69]	= {Minutes = 1.5, 	Units = {1218}},
	},
	NpcBuildingsExist = {X = 148, Y = 389, Range = 7},
}

--Trolle  am Elfenaufbau II
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 25,
	X = 122,
	Y = 393,
	Range = 3,
	
	
	Timer	= "TrolleKaputtCounter",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217, 1218, 1215, 1215}, --Urok Trolle
	SpawnData =
	{
		[ 0]	= {Minutes = 3, 	Units = {1215, 1218}},
		[14]	= {Minutes = 2.5, 	Units = {1215, 1216}},
		[30]	= {Minutes = 1, 	Units = {1215, 1215, 1217}},
		[33]	= {Minutes = 1.8, 	Units = {1215}},
		[42]	= {Minutes = 1.5, 	Units = {1218}},
	},
	NpcBuildingsExist = {X = 113, Y = 402, Range = 0},
}
-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Menschenaufbau =
{
	X = 125,
	Y = 73,
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
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}


EbeneMenschenaufbau =
{
	X = 98,
	Y = 182,
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
		
		344	-- Animal Brownbear
		
	},                    
	ShuffleUnits = FALSE,
	
}

Dunkelelfen =
{
	X = 96,
	Y = 276,
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
		
		344	-- Animal Brownbear
		
	},                    
	ShuffleUnits = FALSE,
	
}

MenschenaufbauII =
{
	X = 86,
	Y = 119,
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
		354,	--Animal Deer Old
		353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose´
	},                    
	ShuffleUnits = TRUE,
	
}

Elfenaufbau =
{
	X = 158,
	Y = 406,
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
		349, 349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = FALSE,
	
}


InitSpawn
{
	Clan = 14, 
	Groups = {Menschenaufbau, EbeneMenschenaufbau, Dunkelelfen, MenschenaufbauII, Elfenaufbau},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 90,
	Groups = {Menschenaufbau, EbeneMenschenaufbau, Dunkelelfen, MenschenaufbauII, Elfenaufbau},
	Conditions = 	
	{
	},
}
