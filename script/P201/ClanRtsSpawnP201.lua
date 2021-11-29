-- _______________________________________
--I                                      I
--I       P201_Blackwater_Coast          I
--I     		RTS Spawn                I
--I______________________________________I

GlobalSpawnDuration = 90




--Sobald der Spieler die Karte betritt
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagFalse{Name = "GDS_PlayerWasOnPlatform_P203"},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "g_sP201RTSSpawningSkeletonsUrias"},
			
	}
}

--Sobald die Cutszene im Outpost getriggert wurde
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		ODER(IsGlobalFlagTrue {Name = "g_sP201EndeCutszeneOutpost"}, IsGlobalFlagTrue {Name = "g_nP202_SchattenklingeSpieler"}),
		
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "g_sP201RTSSpawningGrab"},
	}
}

--Skeletonlager bei Urias
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 8,
	X = 180,
	Y = 160,
	Range = 3,
	
	
	Timer	= "g_sP201RTSSpawningSkeletonsUrias",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1930, 2059}, 	--Skelette Level 24
	SpawnData =
	{
		[0]		= {Minutes = 12, 	Units = {2059}},
		[25]	= {Minutes = 10, 	Units = {1930}}, 
		[50]	= {Minutes = 8, 	Units = {2059}},
	},		
	NpcBuildingsExist = {X = 175, Y = 165, Range = 15},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP201SkelettCampUriasDestroyed"},}
}


--Skeletonlager1 Grabstätte

RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 15,
	X = 163,
	Y = 81,
	Range = 3,
	
	
	Timer	= "g_sP201RTSSpawningGrab",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1686, 2132, 1930, 1930}, 	--Skelette Level 24
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1930}},
		[25]	= {Minutes = 5, 	Units = {2059}}, 
		[50]	= {Minutes = 4, 	Units = {2059}},
		[70]	= {Minutes = 3, 	Units = {2059}},
	},	 
	NpcBuildingsExist = {X = 157, Y = 85, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP201SkelettCamp1Destroyed"},}
}

--Skeletonlager2 Grabstätte
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 15,
	X = 176,
	Y = 100,
	Range = 3,
	
	
	Timer	= "g_sP201RTSSpawningGrab",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1686, 2132, 1930, 1930}, 	--Skelette Level 24
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1930}},
		[25]	= {Minutes = 5, 	Units = {2059}}, 
		[50]	= {Minutes = 4, 	Units = {2059}},
		[70]	= {Minutes = 3, 	Units = {2059}},
	}, 
	NpcBuildingsExist = {X = 176, Y = 105, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP201SkelettCamp2Destroyed"},}
	
}

--Skeletonlager3 Grabstätte
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 15,
	X = 193,
	Y = 99,
	Range = 3,
	
	
	Timer	= "g_sP201RTSSpawningGrab",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1686, 2132, 1930, 1930}, 	--Skelette Level 24
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1930}},
		[25]	= {Minutes = 5, 	Units = {2059}}, 
		[50]	= {Minutes = 4, 	Units = {2059}},
		[70]	= {Minutes = 3, 	Units = {2059}},
	},
	NpcBuildingsExist = {X = 198, Y = 99, Range = 6},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "g_sP201SkelettCamp3Destroyed"},}
	
}

REM = [[

--TierSpawning


Rehe1 =
{
	X = 172,
	Y = 45,
	Range = 5,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 353, 354, 353, 355 	-- Animal Deer
	},                    
	ShuffleUnits = FALSE,
	
}

Rehe2 =
{
	X = 140,
	Y = 79,
	Range = 3,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 353, 354, 353, 355 	-- Animal Deer
	},                    
	ShuffleUnits = FALSE,
	
}

Rehe3 =
{
	X = 394,
	Y = 127,
	Range = 5,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 353, 354, 353, 355 	-- Animal Deer
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 19, 
	Groups = {Rehe1, Rehe2, Rehe3},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 19, MaxClanSize = 90,
	Groups = {Rehe1, Rehe2, Rehe3},
	Conditions = 	
	{
	},
}

]]