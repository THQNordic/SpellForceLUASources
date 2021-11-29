-- RTS Spawn:
-- p1211 darkwind keep

GlobalSpawnDuration = 90

--Monumentenclaim Zwerge (oben)
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		--IsGlobalFlagTrue {Name = "P211TestFlagCSAus"}
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "DarkwindDwarfMonumentClaimedTimer"},
	}
}
------------------------------------------------

----Blades Camp Ost
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 20,
	X = 318,
	Y = 169,
	Range = 8,
	
	
	Timer	= "DarkwindDwarfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {
	2485, 2485, 2537, 2280, 2537, 2483, 2485, 2280
	}, 	
	--Blades: 
	--minion melee 32 (2485)
	--blade thunderblade 40 (2537)
	--weaver melee 35 (2483)
	--weaver caster 35 (2280)
	

	
	SpawnData =
	{
		[5]		= {Minutes = 4.5, Units = {2485}},
		[15]	= {Minutes = 5, 	Units = {2280, 2485}},
		[25]	= {Minutes = 3, 	Units = {2537, 2485}},
		[45]	= {Minutes = 3, 	Units = {2483, 2280, 2537}},
		[70]	= {Minutes = 2, 	Units = {2483, 2537}},
	},
	NpcBuildingsExist = {X = 319, Y = 169, Range = 8},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P211BladesCampOstDestroyed"}},
	
}


----Echsenmenschen Ost
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 15,
	X = 305,
	Y = 145,
	Range = 8,
	
	
	Timer	= "DarkwindDwarfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {
	2540, 2081, 2079, 2079, 2079, 2083
	}, 	
	--Echsen:
	-- lizardman melee speer 30 (2538)
	-- lizardman healer 30 (2539)

	-- lizardman archer 30 (2540)
	
	--lizardman melee speer 40 (2079)
	--lizardman missile bogen 40 AO2 (2081)
	--lizardman healer 40 AO2(2083)
	
	SpawnData =
	{
	
		[5]		= {Minutes = 5.2,	Units = {2540}},            
		[15]	= {Minutes = 4,		Units = {2079}},            
		[25]	= {Minutes = 3,		Units = {2079, 2083}},      
		[45]	= {Minutes = 2,		Units = {2079, 2081}},
		[70]	= {Minutes = 2,		Units = {2083}},            
	},
	NpcBuildingsExist = {X = 305, Y = 142, Range = 11},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P211EchsenCampOstDestroyed"}},
	
}


----Blades West
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 15,
	X = 231,
	Y = 184,
	Range = 8,
	
	
	Timer	= "DarkwindDwarfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {
	2485, 2485, 2483, 2483, 2537, 2537, 2537
	}, 
	
		--Blades: 
	--minion melee 32 (2485)
	--blade thunderblade 40 (2537)
	--weaver melee 35 (2483)
	--weaver caster 35 (2280)
	
	SpawnData =
	{
	
		[2]		= {Minutes = 5.2, Units = {2483}},            
		[15]	= {Minutes = 4, 	Units = {2485, 2537}},            
		[27]	= {Minutes = 4, 	Units = {2280, 2485, 2483}},      
		[47]	= {Minutes = 2, 	Units = {2280,2537,2483}},
		[75]	= {Minutes = 3, 	Units = {2485}},            
	},
	NpcBuildingsExist = {X = 230, Y = 184, Range = 7},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P211BladesCampWestDestroyed"}},
	
}

----Echsen West
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 219,
	Y = 212,
	Range = 8,
	
	
	Timer	= "DarkwindDwarfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {
	2079, 2538, 2083, 2081, 2081, 2079
	}, 	
	--Echsen:
	-- lizardman melee speer 30 (2538)
	-- lizardman healer 30 (2539)
	-- lizardman archer 30 (2540)
	
	--lizardman melee speer 40 (2079)
	--lizardman missile bogen 40 AO2 (2081)
	--lizardman healer 40 AO2(2083)
	
	
	SpawnData =
	{

		[2]		= {Minutes = 4.4, 	Units = {2079}},            
		[15]	= {Minutes = 3.5, 	Units = {2540}},            
		[27]	= {Minutes = 3.5, 	Units = {2538, 2083}},      
		[47]	= {Minutes = 2, 	Units = {2081}},
		[75]	= {Minutes = 2, 	Units = {2079, 2083}},            
	},
	NpcBuildingsExist = {X = 219, Y = 212, Range = 14},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P211EchsenCampWestDestroyed"}},
	
}


---------------------------------------------------------
---------------------------------------------------------
--Spawning im Gefaengnis

GlobalSpawnDuration = 90

--Monumentenclaim Zwerge (oben)
OnPlatformOneTimeEvent
{
	Conditions = {},
	Actions =
	{
		SetGlobalTimeStamp{Name = "DarkwindGefaegnisTimer"},
	}
}


----Camp1

RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 5,
	X = 172,
	Y = 123,
	Range = 3,
	
	
	Timer	= "DarkwindGefaegnisTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2079, 2081, 2083, 2083, 2081, 2081}, 	
	--lizardman melee speer 40 (2079)
	--lizardman missile bogen 40 AO2 (2081)
	--lizardman healer 40 AO2(2083)
	SpawnData =
	{
		[5]		= {Minutes = 4.5, Units = {2079}},
		[15]	= {Minutes = 5, 	Units = {2081,2083}},
		[25]	= {Minutes = 3, 	Units = {2081, 2079}},
		[45]	= {Minutes = 3, 	Units = {2081, 2079}},
		[70]	= {Minutes = 2, 	Units = {2081, 2079}},
	},
	NpcBuildingsExist = {X = 172, Y = 123, Range = 9},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P211GefaengnisCamp1Destroyed"}},
	
}


----Camp2

RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 3,
	X = 184,
	Y = 146,
	Range = 3,
	
	
	Timer	= "DarkwindGefaegnisTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2079, 2081, 2083, 2083, 2083, 2079, 2081}, 
		--lizardman melee speer 40 (2079)
	--lizardman missile bogen 40 AO2 (2081)
	--lizardman healer 40 AO2(2083)
	SpawnData =
	{
		[5]		= {Minutes = 4.5, Units = {2079}},
		[15]	= {Minutes = 5, 	Units = {2081,2083}},
		[25]	= {Minutes = 3, 	Units = {2081, 2079}},
		[45]	= {Minutes = 3, 	Units = {2081, 2079}},
		[70]	= {Minutes = 2, 	Units = {2081, 2079}},
	},
	NpcBuildingsExist = {X = 184, Y = 146, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P211GefaengnisCamp2Destroyed"}},
	
}

----Camp3

RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 4,
	X = 190,
	Y = 121,
	Range = 4,
	
	
	Timer	= "DarkwindGefaegnisTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2079, 2081, 2083, 2081, 2081, 2079, 2083}, 
	--lizardman melee speer 40 (2079)
	--lizardman missile bogen 40 AO2 (2081)
	--lizardman healer 40 AO2(2083)
	SpawnData =
	{
		[5]		= {Minutes = 4.5, Units = {2079}},
		[15]	= {Minutes = 5, 	Units = {2081,2083}},
		[25]	= {Minutes = 3, 	Units = {2081, 2079}},
		[45]	= {Minutes = 3, 	Units = {2081, 2079}},
		[70]	= {Minutes = 2, 	Units = {2081, 2079}},
	},
	NpcBuildingsExist = {X = 190, Y = 121, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_P211GefaengnisCamp3Destroyed"}},
	
}

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
AufbauDschungel =
{
	X = 367,
	Y = 75,
	Range = 8,
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
		343, 343, 343, --hase
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
	},                    
	ShuffleUnits = TRUE,
	
}


DschungelMitte =
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
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
		
	},                    
	ShuffleUnits = FALSE,
	
}

DschungelAnderesUfer1 =
{
	X = 208,
	Y = 87,
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
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
	},                    
	ShuffleUnits = FALSE,
}


DschungelAnderesUfer2 =
{
	X = 141,
	Y = 106,
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
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
	},                  
	ShuffleUnits = FALSE,
	
}



InitSpawn
{
	Clan = 18, 
	Groups = {AufbauDschungel, DschungelMitte, DschungelAnderesUfer1, DschungelAnderesUfer2},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 18, MaxClanSize = 30,
	Groups = {AufbauDschungel, DschungelMitte, DschungelAnderesUfer1, DschungelAnderesUfer2},
	Conditions = 	
	{
	},
}
