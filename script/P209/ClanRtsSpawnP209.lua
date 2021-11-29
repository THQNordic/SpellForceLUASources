-- _______________________________________
--I                                      I
--I              P209_Kathai             I
--I     	      RTS Spawn              I
--I______________________________________I

GlobalSpawnDuration = 90


--Sobald der Spieler das Dunkelelfenmonument geclaimed hat.
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 113, Y = 410, Range = 3, UpdateInterval = 10},
		--PlayerBuildingExists { BuildingId = 75, Amount = 1, OnlyWhenBuiltUp = TRUE , Player = self},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "g_sP209RTSSpawningSkeletons"},
	}
}


--Skeletonlager1 OstTor
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 15,
	X = 183,
	Y = 255,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 176, Y = 253, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp1_OstTor_Destroyed"},}
}

--Skeletonlager2 OstTor
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 15,
	X = 186,
	Y = 288,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 185, Y = 293, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp2_OstTor_Destroyed"},}
}

--Mumienlager3 OstTor
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 15,
	X = 218,
	Y = 298,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2089, 2588, 2587, 2587, 2089, 2850, 2587, 2587},  	--Mumien Level 26-35
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2587}},
		[25]	= {Minutes = 4, 	Units = {2587}}, 
		[50]	= {Minutes = 3, 	Units = {2588}},
	},		
	NpcBuildingsExist = {X = 210, Y = 300, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp3_OstTor_Destroyed"},}
}

--Skeletonlager4 OstTor
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 15,
	X = 215,
	Y = 261,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 223, Y = 259, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp4_OstTor_Destroyed"},}
}

--Mumienlager5 OstTor
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 15,
	X = 222,
	Y = 241,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2089, 2588, 2587, 2587, 2089, 2850, 2587, 2587},  	--Mumien Level 26-35
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2587}},
		[25]	= {Minutes = 4, 	Units = {2587}}, 
		[50]	= {Minutes = 3, 	Units = {2588}},
	},		
	NpcBuildingsExist = {X = 222, Y = 243, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp5_OstTor_Destroyed"},}
}

--Skeletonlager1 NordTor
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 15,
	X = 247,
	Y = 407,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 242, Y = 412, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp1_NordTor_Destroyed"},}
}

--Mumienlager2 NordTor
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 15,
	X = 265,
	Y = 413,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2089, 2588, 2587, 2587, 2089, 2850, 2587, 2587},  	--Mumien Level 26-35
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2587}},
		[25]	= {Minutes = 4, 	Units = {2587}}, 
		[50]	= {Minutes = 3, 	Units = {2588}},
	},		
	NpcBuildingsExist = {X = 269, Y = 417, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp2_NordTor_Destroyed"},}
}

--Skeletonlager3 NordTor
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 15,
	X = 254,
	Y = 383,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 248, Y = 385, Range = 10},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp3_NordTor_Destroyed"},}
}

--Mumienlager4 NordTor
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 15,
	X = 266,
	Y = 361,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2089, 2588, 2587, 2587, 2089, 2850, 2587, 2587},  	--Mumien Level 26-35
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2587}},
		[25]	= {Minutes = 4, 	Units = {2587}}, 
		[50]	= {Minutes = 3, 	Units = {2588}},
	},		
	NpcBuildingsExist = {X = 269, Y = 356, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp4_NordTor_Destroyed"},}
}

--Skeletonlager1 SüdTor
RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 15,
	X = 142,
	Y = 152,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518, 2278, 2278}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 135, Y = 152, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp1_SuedTor_Destroyed"},}
}

--Mumienlager2 SüdTor
RtsSpawnNT
{
	Clan = 17,
	MaxClanSize = 15,
	X = 166,
	Y = 150,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2089, 2588, 2587, 2587, 2089, 2850, 2587, 2587, 2850, 2850},  	--Mumien Level 26-35
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2587}},
		[25]	= {Minutes = 4, 	Units = {2587}}, 
		[50]	= {Minutes = 3, 	Units = {2588}},
	},		
	NpcBuildingsExist = {X = 168, Y = 143, Range = 12},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp2_SuedTor_Destroyed"},}
}

--Skeletonlager3 SüdTor
RtsSpawnNT
{
	Clan = 16,
	MaxClanSize = 15,
	X = 192,
	Y = 156,
	Range = 3,
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2123, 2123, 2278, 2277, 2055, 2518, 2278, 2278}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 196, Y = 158, Range = 12},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SkelettCamp3_SuedTor_Destroyed"},}
}

--Skeletonlager Innenstadt1
RtsSpawnNT
{
	Clan = 15,
	MaxClanSize = 5,
	X = 364,
	Y = 86,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 369, Y = 83, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton1"},}
}

--Skeletonlager Innenstadt2
RtsSpawnNT
{
	Clan = 14,
	MaxClanSize = 5,
	X = 374,
	Y = 340,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[25]	= {Minutes = 4, 	Units = {2518}}, 
		[50]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 379, Y = 344, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton2"},}
}

--Skeletonlager Innenstadt3
RtsSpawnNT
{
	Clan = 13,
	MaxClanSize = 5,
	X = 340,
	Y = 302,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {}, 	--Skelette Level 27
	SpawnData =
	{
		[0]		= {Minutes = 20, 	Units = {2055}},
		[50]	= {Minutes = 6, 	Units = {2277}}, 
		[100]	= {Minutes = 3, 	Units = {2054}},
	},		
	NpcBuildingsExist = {X = 339, Y = 307, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton3"},}
}

--Skeletonlager Innenstadt4
RtsSpawnNT
{
	Clan = 12,
	MaxClanSize = 5,
	X = 324,
	Y = 246,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {},  	--Skelette Level 27
	SpawnData =
	{
		[0]		= {Minutes = 20, 	Units = {2055}},
		[50]	= {Minutes = 6, 	Units = {2277}}, 
		[100]	= {Minutes = 3, 	Units = {2054}},
	},		
	NpcBuildingsExist = {X = 320, Y = 246, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton4"},}
}

--Skeletonlager Innenstadt5
RtsSpawnNT
{
	Clan = 11,
	MaxClanSize = 5,
	X = 330,
	Y = 206,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {},  	--Skelette Level 27
	SpawnData =
	{
		[0]		= {Minutes = 20, 	Units = {2055}},
		[50]	= {Minutes = 6, 	Units = {2277}}, 
		[100]	= {Minutes = 3, 	Units = {2054}},
	},		
	NpcBuildingsExist = {X = 326, Y = 202, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton5"},}
}


--Skeletonlager Innenstadt6
RtsSpawnNT
{
	Clan = 10,
	MaxClanSize = 5,
	X = 311,
	Y = 380,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[40]	= {Minutes = 4, 	Units = {2518}}, 
		[70]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 316, Y = 380, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton6"},}
}


--Skeletonlager Innenstadt7
RtsSpawnNT
{
	Clan = 9,
	MaxClanSize = 5,
	X = 289,
	Y = 262,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[40]	= {Minutes = 4, 	Units = {2518}}, 
		[70]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 293, Y = 260, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton7"},}
}

--Skeletonlager Innenstadt8
RtsSpawnNT
{
	Clan = 8,
	MaxClanSize = 5,
	X = 268,
	Y = 87,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[40]	= {Minutes = 4, 	Units = {2518}}, 
		[70]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 270, Y = 91, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton8"},}
}


--Skeletonlager Innenstadt9
RtsSpawnNT
{
	Clan = 7,
	MaxClanSize = 5,
	X = 285,
	Y = 179,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {},  	--Skelette Level 27
	SpawnData =
	{
		[0]		= {Minutes = 50, 	Units = {2055}},
		[70]	= {Minutes = 15, 	Units = {2277}}, 
		[100]	= {Minutes = 10, 	Units = {2054}},
	},		
	NpcBuildingsExist = {X = 288, Y = 176, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton9"},}
}

--Skeletonlager Innenstadt10
RtsSpawnNT
{
	Clan = 6,
	MaxClanSize = 5,
	X = 325,
	Y = 63,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[40]	= {Minutes = 4, 	Units = {2518}}, 
		[70]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 320, Y = 65, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton10"},}
}

--Skeletonlager Innenstadt11
RtsSpawnNT
{
	Clan = 5,
	MaxClanSize = 5,
	X = 393,
	Y = 133,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[40]	= {Minutes = 4, 	Units = {2518}}, 
		[70]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 397, Y = 133, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton11"},}
}

--Skeletonlager Innenstadt12
RtsSpawnNT
{
	Clan = 4,
	MaxClanSize = 5,
	X = 286,
	Y = 238,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[40]	= {Minutes = 4, 	Units = {2518}}, 
		[70]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 284, Y = 233, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton12"},}
}


--Skeletonlager Innenstadt13
RtsSpawnNT
{
	Clan = 3,
	MaxClanSize = 5,
	X = 349,
	Y = 383,
	Range = 3,
	
	
	Timer	= "g_sP209RTSSpawningSkeletons",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {2054, 2851, 2056, 2123, 2278, 2277, 2055, 2518}, 	--Skelette Level 28-36
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {2054}},
		[40]	= {Minutes = 4, 	Units = {2518}}, 
		[70]	= {Minutes = 3, 	Units = {2277}},
	},		
	NpcBuildingsExist = {X = 352, Y = 386, Range = 3},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP209SpawnstopSkeleton13"},}
}



--TierSpawning

Bueffel1 =
{
	X = 133,
	Y = 394,
	Range = 6,
	Chief = 0,	
	WaitTime = 300,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352 	-- Animal Bueffel
	},                    
	ShuffleUnits = FALSE,
	
}

Bueffel2 =
{
	X = 91,
	Y = 345,
	Range = 6,
	Chief = 0,	
	WaitTime = 300,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352 	-- Animal Bueffel
	},                    
	ShuffleUnits = FALSE,
	
}

Bueffel3 =
{
	X = 200,
	Y = 438,
	Range = 6,
	Chief = 0,	
	WaitTime = 300,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352 	-- Animal Bueffel
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 10, 
	Groups = {Bueffel1, Bueffel2, Bueffel3},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 10, MaxClanSize = 90,
	Groups = {Bueffel1, Bueffel2, Bueffel3},
	Conditions = 	
	{
	},
}

