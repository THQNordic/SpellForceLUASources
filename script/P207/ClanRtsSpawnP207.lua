-------------------------------
-- Rts Spawn P207_Raven_Pass --
-------------------------------

-------------------------------------
-- Spawning stoppt nach 90 Minuten --
-------------------------------------

GlobalSpawnDuration = 90

-----------------------------
-- Rts Spawn Erste Festung --
-----------------------------

RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 25,
	X = 169,
	Y = 282,
	Range = 3,
	
	Timer	= "g_p207_start_rts_spawning", -- Name des globalen Timers der bei einem bestimmten Event gesetzt wird und das Spawning auslöst
	Init	= {2585, 2583, 2586, 2584}, 	-- Skelette
	-- 2591		Mummy RavenPass Boss 32 Death AO2 (Key)
	-- 2585		Skeleton Sword 25 AO2
	-- 2583		Skeleton Fist 25 AO2
	-- 2586		Skeleton Axe and Shield 25 AO2
	-- 2584		Skeleton Bow 25 AO2
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {2585, 2583, 2586, 2584}},
		[15]	= {Minutes = 3.5, 	Units = {2585, 2583, 2586, 2584}},
		[25]	= {Minutes = 3, 	Units = {2585, 2583, 2586, 2584}},
		[45]	= {Minutes = 2, 	Units = {2585, 2583, 2586, 2584}},
		[70]	= {Minutes = 1.5, 	Units = {2585, 2583, 2586, 2584}},
	},
	NpcBuildingsExist = 
	{
		X = 169,
		Y = 282,
		Range = 6
	},
	CampDestroyedActions = 
	{
		SetGlobalFlagTrue {Name = "g_P207_Erste_Festung_Eingenommen"},
		QuestSolve {QuestId = 976},
		QuestBegin {QuestId = 977},
	}
	
}

-----------------------------
-- Rts Spawn Zweite Festung --
-----------------------------

RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 35,
	X = 438,
	Y = 261,
	Range = 3,
	Timer	= "g_p207_second_rts_spawning", -- Globaltimestamp, nachdem das erste Monument geclaimt wurde
	Init	= {2624, 2625, 2627, 2629, 2630},
	-- 2624		Muscleman 32 Leader AO2
	-- 2625		Muscleman 26 Crossbow A02
	-- 2626		Muscleman 26 Bow AO2
	-- 2627		Muscleman 26 Sword Shield AO2
	-- 2628		Muscleman 26 Sword AO2
	-- 2629		Muscleman 26 Staff AO2
	-- 2630		Muscleman 26 Axe AO2
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {2625, 2626, 2627, 2628, 2629, 2630}},
		[15]	= {Minutes = 3.5, 	Units = {2625, 2626, 2627, 2628, 2629, 2630}},
		[25]	= {Minutes = 3, 	Units = {2625, 2626, 2627, 2628, 2629, 2630}},
		[45]	= {Minutes = 2, 	Units = {2625, 2626, 2627, 2628, 2629, 2630}},
		[70]	= {Minutes = 1.5, 	Units = {2625, 2626, 2627, 2628, 2629, 2630}},
	},
	NpcBuildingsExist = 
	{
		X = 438,
		Y = 261,
		Range = 6
	},
	CampDestroyedActions = 
	{
		SetGlobalFlagTrue {Name = "g_P207_Zweite_Festung_Camp_Besiegt"},
	}
	
}

------------------------------
-- Rts Spawn Dritte Festung --
------------------------------

RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 35,
	X = 105,
	Y = 183,
	Range = 3,
	Timer	= "g_p207_third_rts_spawning", -- Globaltimestamp, nachdem das erste Monument geclaimt wurde
	Init	= {2587, 2587, 2587, 2588, 2589, 2584},
	-- 2587		Mummy Leader 2 Swords 30 AO2
	-- 2588		Mummy RavenPass Sword 26 AO2
	-- 2589		Mummy RavenPass Fist 26 AO2
	-- 2584		Skeleton RavenPass Bow 25 AO2
	SpawnData =
	{
		[0]		= {Minutes = 4, 	Units = {2588, 2589, 2584}},
		[15]	= {Minutes = 3.5, 	Units = {2588, 2589, 2584}},
		[25]	= {Minutes = 3, 	Units = {2588, 2589, 2584}},
		[45]	= {Minutes = 2, 	Units = {2588, 2589, 2584}},
		[70]	= {Minutes = 1.5, 	Units = {2588, 2589, 2584}},
	},
	NpcBuildingsExist = 
	{
		X = 107,
		Y = 181,
		Range = 0
	},
	CampDestroyedActions = 
	{
		SetGlobalFlagTrue {Name = "g_P207_Dritte_Festung_Camp_Besiegt"},
	}
	
}


-------------------
-- 	Tierspawning --
-------------------

TrollAufbau1 =
{
	X = 201,
	Y = 436,
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
		348, 348, 348, 348, 348, 348,		-- Wild Boar
	},                    
	ShuffleUnits = TRUE,
}

TrollAufbau2 =
{
	X = 258,
	Y = 446,
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
		348, 348, 348, 348, 348, 348,		-- Wild Boar
	},                    
	ShuffleUnits = TRUE,
}

TrollAufbau3 =
{
	X = 209,
	Y = 398,
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
		348, 348, 348, 348, 348, 348,		-- Wild Boar
	},                    
	ShuffleUnits = TRUE,
}

InitSpawn
{
	Clan = 14, 
	Groups = {TrollAufbau1, TrollAufbau2, TrollAufbau3},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 14, MaxClanSize = 32,
	Groups = {TrollAufbau1, TrollAufbau2, TrollAufbau3},
	Conditions = 	
	{
	},
}
