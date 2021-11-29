-- RTS Spawn:
-- P110	Fire City

GlobalSpawnDuration = 90

--Wenn Orkmonument geclaimed wird


OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 129, Y = 334, Range = 3, UpdateInterval = 10},
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "FireCityStarMonumentClaimedTimer"},
		SetGlobalFlagTrue {Name = "OrkMonument1ClaimedP110"},
	}
}



--Wenn das Angebot des Mondboten abgelehnt wird

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		--IsMonumentInUse {X = 129, Y = 334, Range = 3, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "AngebotAbgelehntP110" }, 
	},
	Actions =
	{
		--SetGlobalTimeStamp{Name = "FireCityStarAbgelehntMonumentClaimedTimer"},
		SetGlobalFlagFalse {Name = "StopRespawnMoonP110"},  --Es werden die Respawns für Moon und Sun eingeschaltet
		SetGlobalFlagFalse {Name = "StopRespawnSunP110"},
		--ChangeRace {Race = 137, NpcId = 6047}, --Bote greift Spieler an
		
		
	}
}

--Wenn das Angebot des Mondboten angenommen wird

OnPlatformOneTimeEvent
{
	Conditions = 
	{
		--IsMonumentInUse {X = 129, Y = 334, Range = 3, UpdateInterval = 10},
		IsGlobalFlagTrue { Name = "AngebotAngenommenP110" },  
	},
	Actions =
	{
		--SetGlobalTimeStamp{Name = "FireCityStarAngenommenMonumentClaimedTimer"},
		SetGlobalFlagTrue {Name = "MondTruppenIdleGoHomeStartP110"},
		SetGlobalFlagTrue {Name = "StopRespawnMoonP110"},
		SetGlobalFlagFalse {Name = "StopRespawnSunP110"},
		--ChangeFigureOwner {NpcId = 6047}, --Bote wird zur SpielerFigur
		Goto { X = 162, Y = 443, NpcId = 6047 , Range = 5 , WalkMode = Run , GotoMode = GotoForced},
		
	}
}



--Sternstadt RTS Spawn
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 25,
	X = 133,
	Y = 250,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1628,1626,431,431,1753,1625}, 	--Dunkelelfen Sternbereich Level 15-18
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {1628, 431, 1753}},
		[15]	= {Minutes = 4, 	Units = {1753, 431, 1626}}, 
		[25]	= {Minutes = 3, 	Units = {431, 1627, 1753}},
		[45]	= {Minutes = 3, 	Units = {435, 1753, 1628}},
		[70]	= {Minutes = 2.5, 	Units = {435, 1753}},
	},
	NpcBuildingsExist = {X = 137, Y = 250, Range = 2},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "StopRespawnStarP110"},}
	
}

--Sternstadt RTS Spawn Klein Süd
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 20,
	X = 144,
	Y = 234,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1626,431,431,1753}, 	--Dunkelelfen Sternbereich Level 15-18
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {1628, 431, 1753}},
		[15]	= {Minutes = 4, 	Units = {1753, 431, 1626}}, 
		[25]	= {Minutes = 3, 	Units = {431, 1627, 1753}},
		[45]	= {Minutes = 3, 	Units = {435, 1753, 1628}},
		[70]	= {Minutes = 2.5, 	Units = {435, 1753}},
	},
	NpcBuildingsExist = {X = 148, Y = 234, Range = 3}
	
}


--Sternstadt RTS Spawn Klein Nord
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 20,
	X = 147,
	Y = 264,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {11626,431,431,1753}, 	--Dunkelelfen Sternbereich Level 15-18
	SpawnData =
	{
		[0]		= {Minutes = 5, 	Units = {1628, 431, 1753}},
		[15]	= {Minutes = 4, 	Units = {1753, 431, 1626}}, 
		[25]	= {Minutes = 3, 	Units = {431, 1627, 1753}},
		[45]	= {Minutes = 3, 	Units = {435, 1753, 1628}},
		[70]	= {Minutes = 2.5, 	Units = {435, 1753}},
	},
	NpcBuildingsExist = {X = 152, Y = 264, Range = 3}
	
}


--Angebot des MondPrister wurde abgelehnt
--Mondstadt RTS Spawn Tempel

RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 25,
	X = 236,
	Y = 454,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1628,1626,431,431,1753,1625}, 	--Dunkelelfen Sternbereich Level 15-18
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1628, 431, 1753}},
		[15]	= {Minutes = 5, 	Units = {1753, 431, 1626}}, 
		[25]	= {Minutes = 5, 	Units = {431, 1627, 1753}},
		[45]	= {Minutes = 5, 	Units = {435, 1753, 1628}},
		[70]	= {Minutes = 5, 	Units = {435, 1753}},
	},
	NpcBuildingsExist = {X = 231, Y = 453, Range = 8},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "StopRespawnMoonP110"},}
	
}


--Mondstadt RTS Spawn Haupthaus
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 20,
	X = 395,
	Y = 471,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1628,1626,431,431,1753,1625}, 	--Dunkelelfen Sternbereich Level 15-18
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {1628, 431, 1753}},
		[15]	= {Minutes = 6, 	Units = {1753, 431, 1626}}, 
		[25]	= {Minutes = 5, 	Units = {431, 1627, 1753}},
		[45]	= {Minutes = 5, 	Units = {435, 1753, 1628}},
		[70]	= {Minutes = 5, 	Units = {435, 1753}},
	},
	NpcBuildingsExist = {X = 401, Y = 462, Range = 8}
	
}


--Sonnenstadt RTS Spawn Tempel
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 25,
	X = 219,
	Y = 96,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1752,1751,1669,1670,1672,1672}, 
	SpawnData =
	{
		[0]		= {Minutes = 6, 	Units = {1752, 1751, 1671, 1670}},
		[20]	= {Minutes = 5, 	Units = {1752, 1751, 1671, 1670}},
		[40]	= {Minutes = 5, 	Units = {1752, 1751, 1671, 1670}},
		[60]	= {Minutes = 5, 	Units = {1752, 1751, 1671, 1670}},
		[70]	= {Minutes = 5, 	Units = {1672, 1669}},
	},
	NpcBuildingsExist = {X = 222, Y = 99, Range = 8},
	CampDestroyedActions = {SetGlobalFlagTrue {Name = "StopRespawnSunP110"},}
	
}

--Sonnenstadt RTS Spawn Haupthaus
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 20,
	X = 363,
	Y = 50,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1752,1751,1669,1670,1672,1672}, 
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {1752, 1751, 1671, 1670}},
		[20]	= {Minutes = 6, 	Units = {1752, 1751, 1671, 1670}},
		[40]	= {Minutes = 5, 	Units = {1752, 1751, 1671, 1670}},
		[60]	= {Minutes = 5, 	Units = {1752, 1751, 1671, 1670}},
		[70]	= {Minutes = 5, 	Units = {1672, 1669}},
	},
	NpcBuildingsExist = {X = 360, Y = 46, Range = 8}
	
}

REM = [[
--Spieler und MondPrister sind verbündet
--Sonnenstadt RTS Spawn Tempel
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 35,
	X = 219,
	Y = 96,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1670,1670,1669,1671,1673,1672}, 
	SpawnData =
	{
		[0]		= {Minutes = 2, 	Units = {1669, 1670, 1671, 1672}},
		[20]	= {Minutes = 2, 	Units = {1669, 1670, 1671, 1672}},
		[40]	= {Minutes = 2, 	Units = {1669, 1670, 1671, 1672}},
		[60]	= {Minutes = 2, 	Units = {1669, 1670, 1671, 1672}},
		[70]	= {Minutes = 1, 	Units = {1673, 1671}},
	},
	NpcBuildingsExist = {X = 222, Y = 99, Range = 8}
	
}

--Sonnenstadt RTS Spawn Haupthaus
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 35,
	X = 363,
	Y = 50,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1670, 1670, 1670, 1670, 1670, 1670, 1670, 1670, 1669, 1669, 1669, 1669, 1669, 1669, 1669, 1669, 1671, 1671, 1673, 1671, 1671, 1672, 1672, 1672, 1672}, 
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {1669, 1670, 1671, 1672}},
		[20]	= {Minutes = 6, 	Units = {1669, 1670, 1671, 1672}},
		[40]	= {Minutes = 4, 	Units = {1669, 1670, 1671, 1672}},
		[60]	= {Minutes = 2, 	Units = {1669, 1670, 1671, 1672}},
		[70]	= {Minutes = 1, 	Units = {1673, 1671}},
	},
	NpcBuildingsExist = {X = 360, Y = 46, Range = 8}
	
}

]]

--Drachenhort
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 8,
	X = 44,
	Y = 216,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1726,1725,1726},--DesertDreagon Level 17 + Unique Dragon 22
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {1726}},
		[20]	= {Minutes = 8, 	Units = {1726}}, 
		[40]	= {Minutes = 8, 	Units = {1726}},
	},
	NpcBuildingsExist = {X = 47, Y = 207, Range = 8}
	
}

--Friedhof
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 8,
	X = 94,
	Y = 157,
	Range = 3,
	
	
	Timer	= "FireCityStarMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {606,616,619,863,606,606,863}, -- Skeletton Level 12
	SpawnData =
	{
		[0]		= {Minutes = 8, 	Units = {606}},
		[20]	= {Minutes = 6, 	Units = {619}}, 
		[40]	= {Minutes = 4, 	Units = {863}},
	},
	NpcBuildingsExist = {X = 93, Y = 155, Range = 8}
	
}



--TierSpawning


OrkAufbau1 =
{
	X = 70,
	Y = 272,
	Range = 2,
	Chief = 0,	
	WaitTime = TierSpawning,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}


REM = [[
OrkAufbau2 =
{
	X = 188,
	Y = 409,
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
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

TrollAufbau1 =
{
	X = 57,
	Y = 62,
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
		352, 352, 352, 352, 352 	-- Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

]]

InitSpawn
{
	Clan = 19, 
	Groups = {OrkAufbau1}, --, OrkAufbau2, TrollAufbau1},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 19, MaxClanSize = 20,
	Groups = {OrkAufbau1}, --, OrkAufbau2, TrollAufbau1},
	Conditions = 	
	{
	},
}
