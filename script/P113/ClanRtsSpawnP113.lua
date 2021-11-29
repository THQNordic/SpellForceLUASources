-- RTS Spawn:
-- p113 Final Battle

GlobalSpawnDuration = 90

--Monumentenclaim Orks (Elementare spawnen, Osten)
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 442, Y = 287, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "FinalBattleOrcMonumentClaimedTimer"},
	}
}

----Elementare Nordost1
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 321,
	Y = 283,
	Range = 3,
	
	
	Timer	= "FinalBattleOrcMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1804, 1805, 1805, 1805, 1805}, 	--Elemental Fire 17, 18
	SpawnData =
	{
		[2]		= {Minutes = 4.5, 	Units = {1805}},
		[15]	= {Minutes = 5, 	Units = {1805}},
		[25]	= {Minutes = 3, 	Units = {1804, 1805}},
		[45]	= {Minutes = 3, 	Units = {1805, 1805, 1805}},
		[70]	= {Minutes = 2, 	Units = {1804}},
	},
	NpcBuildingsExist = {X = 321, Y = 283, Range = 7}
	
}


----Elementare Nordost2
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 15,
	X = 306,
	Y = 298,
	Range = 3,
	
	
	Timer	= "FinalBattleOrcMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1805, 1804, 1805, 1805, 1804, 1805}, 	--Elemental Fire 17,18
	SpawnData =
	{
	
		[2]		= {Minutes = 5.2,	Units = {1805}},            
		[15]	= {Minutes = 4,		Units = {1804}},            
		[25]	= {Minutes = 3,		Units = {1805, 1804}},      
		[45]	= {Minutes = 2,		Units = {1804, 1805, 1714}},
		[70]	= {Minutes = 2,		Units = {1805}},            
	},
	NpcBuildingsExist = {X = 306, Y = 298, Range = 6}
	
}


----Elementare Südost1
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 15,
	X = 458,
	Y = 106,
	Range = 3,
	
	
	Timer	= "FinalBattleOrcMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1804, 1805, 1804, 1804, 1805, 1805}, 	--Elemental Fire 17,18
	SpawnData =
	{
	
		[5]		= {Minutes = 5.2, 	Units = {1804}},            
		[17]	= {Minutes = 4, 	Units = {1805}},            
		[27]	= {Minutes = 4, 	Units = {1804, 1805}},      
		[47]	= {Minutes = 2, 	Units = {1805, 1804, 1714}},
		[75]	= {Minutes = 3, 	Units = {1804}},            
	},
	NpcBuildingsExist = {X = 458, Y = 106, Range = 8}
	
}

----Elementare Südost2
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 443,
	Y = 170,
	Range = 3,
	
	
	Timer	= "FinalBattleOrcMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1804, 1805, 1804, 1805, 1805, 1804}, 	--Elemental Fire 17,18
	SpawnData =
	{

		[5]		= {Minutes = 4.4, 	Units = {1804}},            
		[17]	= {Minutes = 3.5, 	Units = {1805}},            
		[27]	= {Minutes = 3.5, 	Units = {1804, 1805}},      
		[47]	= {Minutes = 2, 	Units = {1805, 1804, 1714}},
		[75]	= {Minutes = 2, 	Units = {1804}},            
	},
	NpcBuildingsExist = {X = 443, Y = 170, Range = 10}
	
}


----Elementare Südost3
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 20,
	X = 436,
	Y = 148,
	Range = 3,
	
	
	Timer	= "FinalBattleOrcMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1804, 1805, 1804, 1805, 1805, 1713}, 	--Elemental Fire 17,18
	SpawnData =
	{
	
		[5]		= {Minutes = 4.4, 	Units = {1805}},            
		[17]	= {Minutes = 3.5, 	Units = {1804}},            
		[27]	= {Minutes = 4, 	Units = {1805, 1804}},      
		[47]	= {Minutes = 3, 	Units = {1804, 1805, 1714}},
		[75]	= {Minutes = 2, 	Units = {1713}},            
	},
	NpcBuildingsExist = {X = 436, Y = 148, Range = 8}
	
}


--Monumentenclaim Elfen (Wolfsmenschen spawnen Westen)
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 96, Y = 368, Range = 0, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "FinalBattleElfMonumentClaimedTimer"},
	}
}

----Werwölfe Norwest
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 15,
	X = 73,
	Y = 305,
	Range = 3,
	
	
	Timer	= "FinalBattleElfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1708, 1807, 1806, 1708, 1711}, 	-- Eis Melee 19, Eis Melee 20, Eis Wave of Ice 19
	SpawnData =
	{
	
		[2]		= {Minutes = 5.2, 	Units = {1708}},
		[15]	= {Minutes = 4, 	Units = {1711}},
		[25]	= {Minutes = 3.5, 	Units = {1807, 1708}},
		[45]	= {Minutes = 3, 	Units = {1806, 1709, 1711}},
		[70]	= {Minutes = 2, 	Units = {1807}},
	},
	NpcBuildingsExist = {X = 73, Y = 305, Range = 15}
	
}

----Werwölfe Südwest1
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 20,
	X = 86,
	Y = 109,
	Range = 3,
	
	
	Timer	= "FinalBattleElfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1708, 1711, 1709, 1709, 1711}, 	-- Eis Melee 19, Eis Melee 20, Eis Wave of Ice 19
	SpawnData =
	{
	
		[5]		= {Minutes = 5.5, 	Units = {1708}},
		[17]	= {Minutes = 4, 	Units = {1708, 1709, 1711}}, 
		[27]	= {Minutes = 4, 	Units = {1807}},
		[47]	= {Minutes = 3, 	Units = {1711, 1708, 1709, 1807}},
		[75]	= {Minutes = 3, 	Units = {1709, 1806, 1807}},
	},
	NpcBuildingsExist = {X = 86, Y = 109, Range = 8}
	
}

----Werwölfe Südwest2
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 10,
	X = 107,
	Y = 77,
	Range = 3,
	
	
	Timer	= "FinalBattleElfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1708, 1708, 1709, 1709, 1711, 1807}, 	-- Eis Melee 19, Eis Melee 20, Eis Wave of Ice 19
	SpawnData =
	{
	
		[5]		= {Minutes = 4.5, 	Units = {1708, 1711}},
		[17]	= {Minutes = 3.5, 	Units = {1807, 1709, 1806}}, 
		[27]	= {Minutes = 3, 	Units = {1806, 1711}},
		[47]	= {Minutes = 2, 	Units = {1807, 1711, 1709}},
		[75]	= {Minutes = 2, 	Units = {1709, 1806}},
	},
	NpcBuildingsExist = {X = 107, Y = 77, Range = 15}
	
}

----Werwölfe Südwest3
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 10,
	X = 126,
	Y = 52,
	Range = 3,
	
	
	Timer	= "FinalBattleElfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1708, 1807, 1709, 1708, 1711}, 	-- Eis Melee 19, Eis Melee 20, Eis Wave of Ice 19
	SpawnData =
	{
	
		[5]		= {Minutes = 4.5, 	Units = {1806, 1708}},
		[17]	= {Minutes = 3.5, 	Units = {1807, 1711, 1708}}, 
		[27]	= {Minutes = 3.5, 	Units = {1709, 1806, 1711}},
		[47]	= {Minutes = 3, 	Units = {1708, 1807, 1711}},
		[75]	= {Minutes = 2, 	Units = {1711, 1708}},
	},
	NpcBuildingsExist = {X = 126, Y = 52, Range = 6}
	
}

----------------------------------------
--Darkelf spawning
----------------------------------------
--feuertore offen
OnOneTimeEvent
{
	Conditions = 
	{
		QuestState{QuestId = 622, State = StateSolved, UpdateInterval = 60}, 
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "FinalBattleFireGateOpenTimer"},
	}
}

----Dunkelelfen1 am Tor
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 10,
	X = 188,
	Y = 212,
	Range = 3,
	
	
	Timer	= "FinalBattleFireGateOpenTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	--Init	= {1671, 1698, 1752}, 
	Init	= {}, 
	SpawnData =
	{
	
		[0.5]	= {Minutes = 1, 	Units = {1671}},
		[2]		= {Minutes = 2, 	Units = {1696, 1752}}, 
		[8]		= {Minutes = 1.5, 	Units = {1752, 1673}},
		[9]		= {Minutes = 1, 	Units = {1752, 1673, 1696}},
		
	},
	NpcBuildingsExist = {X = 188, Y = 212, Range = 6}
	
}

----Dunkelelfen2 am Tor
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 10,
	X = 186,
	Y = 196,
	Range = 3,
	
	
	Timer	= "FinalBattleFireGateOpenTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	--Init	= {1671, 1698, 1752}, 	
	Init	= {},
	SpawnData =
	{
	
		[2]		= {Minutes = 0.5, 	Units = {1671}},
		[5]		= {Minutes = 1.5, 	Units = {1696, 1752}}, 
		[6]		= {Minutes = 1, 	Units = {1752, 1673}},
		[9]		= {Minutes = 2, 	Units = {1752, 1673, 1696}},
	},
	NpcBuildingsExist = {X = 186, Y = 196, Range = 4}
	
}

----Dunkelelfen3
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 10,
	X = 274,
	Y = 234,
	Range = 3,
	
	
	Timer	= "FinalBattleFireGateOpenTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	--Init	= {1671, 1698, 1752}, 	
	Init	= {},	
	SpawnData =
	{
	
		[1]		= {Minutes = 1, 	Units = {1671}},
		[2]		= {Minutes = 0.5, 	Units = {1696, 1752}}, 
		[5]		= {Minutes = 2, 	Units = {1752, 1673}},
		[10]	= {Minutes = 1, 	Units = {1752, 1673, 1696}},
	},
	NpcBuildingsExist = {X = 274, Y = 234, Range = 3}
	
}

----Dunkelelfen4
RtsSpawnNT
{
	Clan = 14,
	MaxClanSize = 8,
	X = 302,
	Y = 204,
	Range = 3,
	
	
	Timer	= "FinalBattleFireGateOpenTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	--Init	= {1671, 1698, 1752}, 	
	Init	= {}, 	
	SpawnData =
	{
	
		[0.5]	= {Minutes = 1, 	Units = {1671}},
		[1]		= {Minutes = 0.5, 	Units = {1696, 1752}}, 
		[3]		= {Minutes = 0.5, 	Units = {1752, 1673}},
		[5]		= {Minutes = 0.5, 	Units = {1752, 1673, 1696}},
	},
	NpcBuildingsExist = {X = 302, Y = 204, Range = 6}
	
}


-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Orkaufbau =
{
	X = 413,
	Y = 228,
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
		348, 348, 348, 348,	--Wildes Schwein
		352, 352, 352, 352, 352,	-- büffel
		348		-- Wildschwein
	},                    
	ShuffleUnits = TRUE,
	
}


Elfenaufbau =
{
	X = 142,
	Y = 394,
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
		
		348, 348, 348, 348,	--Wildes Schwein
		352, 352, 352, 352, 352,	-- büffel
		348		-- Wildschwein
		
	},                    
	ShuffleUnits = FALSE,
	
}

Wolfsmenschencamp =
{
	X = 173,
	Y = 63,
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
		
		
		
		348, 348, 348, 348,	--Wildes Schwein
		
		348		-- Wildschwein
		
	},                    
	ShuffleUnits = FALSE,
	
}




InitSpawn
{
	Clan = 18, 
	Groups = {Orkaufbau, Elfenaufbau, Wolfsmenschencamp},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 18, MaxClanSize = 30,
	Groups = {Orkaufbau, Elfenaufbau, Wolfsmenschencamp},
	Conditions = 	
	{
	},
}
