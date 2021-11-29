-- RTS Spawn:
-- p9 Northern Windwalls

GlobalSpawnDuration = 150

--Monumentenclaim
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 353, Y = 452, Range = 0},
	},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "NorthernWindwallsClaimedTimer"},
	},
}


-- Wenn alle Waves durch sind gibt es einen neuen Attacktimer
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "Q112ThirdWaveAttack"},
	},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "NorthernWindwallsAttackWaveTimer"},
	},
}

-- Timer für die Attackwaves 
-- eins
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "NorthernWindwallsClaimedTimer" , Seconds = 900, UpdateInterval = 60},
--		QuestState{QuestId = 112 , State = StateActive},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "Q112FirstWaveAttack"},
	},
}

-- zwei
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "NorthernWindwallsClaimedTimer" , Seconds = 1300, UpdateInterval = 60},
--		QuestState{QuestId = 112 , State = StateActive},
		IsGlobalFlagTrue {Name = "Q112FirstWaveAttack"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "Q112SecondWaveAttack"},
	},
}

--drei
OnOneTimeEvent
{
	Conditions = 
	{
		IsGlobalTimeElapsed {Name = "NorthernWindwallsClaimedTimer" , Seconds = 1600, UpdateInterval = 60},
--		QuestState{QuestId = 112 , State = StateActive},
		IsGlobalFlagTrue {Name = "Q112SecondWaveAttack"},
	},
	Actions = 
	{
		SetGlobalFlagTrue {Name = "Q112ThirdWaveAttack"},
	},
}
-- Attackwaves
--Erste Angriffswelle starten
OnOneTimeEvent
{
	Conditions =	
	{
		IsGlobalFlagTrue{Name = "Q112FirstWaveAttack"},
--		QuestState{QuestId = 112 , State = StateActive},
		IsGlobalTimeElapsed{Name = "NorthernWindwallsClaimedTimer" , Seconds = 930 , UpdateInterval = 60},
		IsClanSize {Clan = 27, Size = 1},
	},
	Actions =		
	{
		ClanAttack {Number = 30, SourceClan = 27, TargetX = 263,TargetY = 371},
		SetGlobalFlagTrue{Name = "Q112FirstWaveGo"},
		--ShowDebugText{String = "Erste Welle sollte jetzt loslaufen! 2 Mins ca."},
	}
}


--Zweite Angriffswelle starten
OnOneTimeEvent
{
	Conditions =	
	{
--		QuestState{QuestId = 112 , State = StateActive},
		IsGlobalTimeElapsed{Name = "NorthernWindwallsClaimedTimer" , Seconds = 1330 , UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "Q112SecondWaveAttack"},
		IsClanSize {Clan = 26, Size = 1},
	},
	Actions =		
	{
		ClanAttack {Number = 30, SourceClan = 26, TargetX = 263,TargetY = 371},
		SetGlobalFlagTrue{Name = "Q112SecondWaveGo"},
		--ShowDebugText{String = "Zweite Welle sollte jetzt loslaufen!"},
	}
}
-- dritte Angriffswelle starten
--Dritte Angriffswelle starten
OnOneTimeEvent
{
	Conditions =	
	{
--		QuestState{QuestId = 112 , State = StateActive},
		IsGlobalTimeElapsed{Name = "NorthernWindwallsClaimedTimer" , Seconds = 1630 , UpdateInterval = 60},
		IsGlobalFlagTrue{Name = "Q112ThirdWaveAttack"},
		IsClanSize {Clan = 25, Size = 1},
	},
	Actions =		
	{
		ClanAttack {Number = 30, SourceClan = 25, TargetX = 264,TargetY = 371},
		SetGlobalFlagTrue{Name = "Q112ThirdWaveGo"},
		--ShowDebugText{String = "Dritte Welle sollte jetzt loslaufen!"},
	}
}
---MARKER: Atack Waves kleienr als die ClanAttack hatlen, damit IsClanSize = 0 abgefragt werden kann
-- RTS SPAWN, Skeleton Attack Wave 1 // besteht nur aus Meleekämpfern
AttackWave1 =
{
	X = 213,
	Y = 55,
	Range = 10,
	Chief = 0,
	WaitTime = 1,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
		
	},
	Units = 
	{
		1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192,  -- Zombie Handaxt
		1193, 1193, 1193, 1193, 1193, 1193, 1193, 1193, 1193 	-- Zombie Schlachtbeil
	},
	ShuffleUnits = TRUE,
	SpawnLimit = -1,
}


InitSpawn
{
	Clan = 27, 
	Groups = {AttackWave1},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q112FirstWaveAttack"},
		IsGlobalFlagFalse {Name = "Q112FirstWaveDefeated"},
	},
}

-- RTS SPAWN, Skeleton Attack Wave 2 // Melee- und Bogenkämpfer
AttackWave2 =
{
	X = 213,
	Y = 55,
	Range = 10,
	Chief = 0,
	WaitTime = 1,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	--	IsGlobalTimeElapsed{Name = "Q112MasterTimer" , Seconds = 10 , UpdateInterval = 60}
	},
	Units = 
	{
		1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192, 1192,-- Zombie HAndaxt
		1193, 1193, 1193, 1193, 1193, 1193, 1193, 1193, 1193,			-- Zombie Schlachtbeil
		617, 617, 617, 617, 617, 617 -- Skeleton 5 Bow
	},
	ShuffleUnits = TRUE,
	SpawnLimit = -1,
}


InitSpawn
{
	Clan = 26,
	Groups = {AttackWave2},
	Conditions = 	
	{
		IsGlobalFlagTrue{Name = "Q112SecondWaveAttack"},
		IsGlobalFlagFalse {Name = "Q112SecondWaveDefeated"},
	},
}

-- RTS SPAWN, Skeleton Attack Wave 3 // Fernkämpfer, Melee, Caster
AttackWave3 =
{
	X = 213,
	Y = 55,
	Range = 10,
	Chief = 0,
	WaitTime = 1,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	--	IsGlobalTimeElapsed{Name = "Q112MasterTimer" , Seconds = 10 , UpdateInterval = 60}
	},
	Units = 
	{
		1192, 1192, 1192, 1192, 1192, 1192, 1192, -- Zombie Handaxt
		1193, 1193, 1193, 1193, 1193, 1193, 1193, 		-- Zombie Schlachtbeil
		617, 617, 617, 617, 617, 617, 617, 617, 	-- Skeleton 5 Bow
		134 , 134 ,134 ,134 ,134  					-- Skeleton Caster Pain
	},
	ShuffleUnits = TRUE,
	SpawnLimit = -1,
}


InitSpawn
{
	Clan = 25,
	Groups = {AttackWave3},
	Conditions = 	
	{
		IsGlobalFlagTrue{Name = "Q112ThirdWaveAttack"},
		IsGlobalFlagFalse {Name = "Q112ThirdWaveDefeated"},
	},
}

--Skelette vor der Blockade im Osten 
RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 20,
	X = 381,
	Y = 330,
	Range = 3,
	
	
	Timer	= "NorthernWindwallsClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1192, 1192, 1192, 1192, 1192, 1193, 1193, 1193}, 	-- Zombie Handaxt/Schlachtbeil
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1192, 1193}},
	},
	NpcBuildingsExist = {X = 386, Y = 327, Range = 0},     
}


--Skeleton Untoten Zwischenlager
RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 20,
	X = 142,
	Y = 320,
	Range = 3,
	
	
	Timer	= "NorthernWindwallsClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {133, 133, 133, 605, 605, 605, 617, 617, 134 ,134}, 	-- Skelette Leeser Dolch, 1h-Schwert, Bogen, Caster Pain
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {133, 605, 617}},
	},
	NpcBuildingsExist = {X = 139, Y = 323, Range = 0},     
}



--Skeleton Skirmisher Camp Altes Zwischenlager 2
RtsSpawnNT
{
	Clan = 22,
	MaxClanSize = 30,
	X = 206,
	Y = 203,
	Range = 3,
	
	
	Timer	= "NorthernWindwallsAttackWaveTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {133, 133, 133, 605, 605, 605, 617, 617, 133, 133, 133, 605, 605, 605, 617, 617}, 	-- Skelette Leeser Dolch, 1h-Schwert, Bogen
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {133, 133, 605}},
		[10]	= {Minutes = 3, 	Units = {133, 605, 617}},
		[20]	= {Minutes = 3, 	Units = {133, 605, 617, 134}},
	},
	NpcBuildingsExist = {X = 208, Y = 202, Range = 8},
}



--Skeleton Portal Camp 
RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 30,
	X = 226,
	Y = 46,
	Range = 3,
	
	
	Timer	= "NorthernWindwallsAttackWaveTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {133, 133, 133, 605, 605, 605, 617, 617, 134 ,134}, 	-- Skelette Leeser Dolch, 1h-Schwert, Bogen
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {133, 605}},
		[10]	= {Minutes = 3, 	Units = {133, 605}},
		[20]	= {Minutes = 2, 	Units = {133, 133, 133, 605}},
		[40]	= {Minutes = 1.5, 	Units = {133, 133, 133, 605, 134}},
	},
	NpcBuildingsExist = {X = 227, Y = 50, Range = 4},     
}

--Schattencamp
RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 30,
	X = 325,
	Y = 196,
	Range = 3,
	
	
	Timer	= "NorthernWindwallsAttackWaveTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1192, 1192, 1192, 1192, 1192, 1193, 1193, 1193}, 	-- Zombies Handaxt /Schwert
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1192}},
		[10]	= {Minutes = 3, 	Units = {1193}},
		[23]	= {Minutes = 2, 	Units = {1192, 1193}},
		[46]	= {Minutes = 1.5, 	Units = {1192, 1192, 1193}},
	},
	NpcBuildingsExist = {X = 322, Y = 200, Range = 1},     
}

--Eisenblockade 
RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 30,
	X = 182,
	Y = 377,
	Range = 3,
	
	
	Timer	= "NorthernWindwallsClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {133, 133, 133, 605, 605, 605, 617, 617, 134 ,134}, 	-- Skelette Leeser Dolch, 1h-Schwert, Bogen
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {133, 605}},
		[10]	= {Minutes = 3, 	Units = {133, 605}},
	},
	NpcBuildingsExist = {X = 182, Y = 380, Range = 0},     
}





-- RTS SPAWN, Spinnennest
Spinnennest =
{
	X = 148,
	Y = 125,
	Range = 7,
	Chief = 0,
	WaitTime = 30,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	
	Units = 
	{
		202, 202, 202, 202, 202, 202,	-- Spider Giant Black 7 Lesser
		751, 751, 751, 751, 751, 751, 751, 751, 751, 751		-- Spider Tiny Black 2
	},
	ShuffleUnits = TRUE,
}

InitSpawn
{
	Clan = 18,
	Groups = {Spinnennest},
	Conditions =
	{
		
	},
}



-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
AuffangLager =
{
	X = 202,
	Y = 413,
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
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

--StartPortal =
--{
--	X = 279,
--	Y = 481,
--	Range = 10,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		350, 350, 350	-- Animal BlackWulf
--	},                    
--	ShuffleUnits = FALSE,
--	
--}

--FestungsInsel =
--{
--	X = 240,
--	Y = 410,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		348, 348, 348, 348, 348, 348, 348 	-- Animal Wildboar
--	},                    
--	ShuffleUnits = FALSE,
--	
--}

--Aufbaugebiet1 =
--{
--	X = 282,
--	Y = 482,
--	Range = 2,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		349, 349, 349,	--Animal Greywulf
--		348, 348, 348, 348, 348 	-- Animal Wildboar
--	},                    
--	ShuffleUnits = TRUE,
--	
--}
--
Aufbaugebiet2 =
{
	X = 339,
	Y = 464,
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
		353, 353, 353,	-- Animal Deer Young
		354, 354, 354, 354, 354, 354,	--Animal Deer Old
		355, 355, 355, 355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

Aufbaugebiet3 =
{
	X = 335,
	Y = 410,
	Range = 15,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		344, 344, 344, 344, 344	-- Animal Brownbear
	},                    
	ShuffleUnits = TRUE,
	
}

FriedhofWolf =
{
	X = 330,
	Y = 355,
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
		350, 350, 350	-- Animal BlackWulf
	},                    
	ShuffleUnits = FALSE,
	
}

WaldInDerMitte =
{
	X = 285,
	Y = 263,
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
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355, 355,		-- Animal Moose
		344, 344, 344	-- Animal Brownbear
	},                    
	ShuffleUnits = TRUE,
	
}

OstKueste1 =
{
	X = 395,
	Y = 227,
	Range = 20,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 354, 354, 354, 354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353, 353, 353,	-- Animal Deer Young
		355, 355, 355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

OstKueste2 =
{
	X = 409,
	Y = 143,
	Range = 4,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		344, 344, 344, 344, 344,	-- Animal Brownbear
		349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = TRUE,
	
}

--OstKueste3 =
--{
--	X = 310,
--	Y = 395,
--	Range = 4,
--	Chief = 0,	
--	WaitTime = AnimalSpawnTime,
--	AvatarMinLevel = 0,
--	AvatarMaxLevel = 0,
--	Conditions = 
--	{
--	},
--	Units = 
--	{
--		348, 348, 348, 348, 348, 348, 348, 	-- Animal Wildboar
--		354, 354,	--Animal Deer Old
--		353,	-- Animal Deer Young
--		355		-- Animal Moose
--	},                    
--	ShuffleUnits = TRUE,
--	
--}

SchluchtSueden =
{
	X = 313,
	Y = 148,
	Range = 13,
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
		353, 353, 353, 353,	-- Animal Deer Young
		355, 355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

SuedKuesteOst =
{
	X = 288,
	Y = 83,
	Range = 4,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		344, 344, 344, 344, 344,	-- Animal Brownbear
		349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = TRUE,
	
}

SuedKuesteWest =
{
	X = 144,
	Y = 67,
	Range = 30,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		348, 348, 348, 348, 348, 348, 348, 	-- Animal Wildboar
		354, 354,	--Animal Deer Old
		353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
}	

WestKueste1 =
{
	X = 125,
	Y = 221,
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
		349, 349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = FALSE,
	
}

WestKueste2 =
{
	X = 113,
	Y = 144,
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
		344, 344, 344,	-- Animal Brownbear
		349, 349	--Animal Greywulf
	},                    
	ShuffleUnits = TRUE,
	
}



InitSpawn
{
	Clan = 17, 
	Groups = {AuffangLager, Aufbaugebiet2, Aufbaugebiet3, FriedhofWolf, WaldInDerMitte, OstKueste1, OstKueste2,  SchluchtSueden, SuedKuesteOst, SuedKuesteWest, WestKueste1, WestKueste2},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 17, MaxClanSize = 120,
	Groups = {AuffangLager, Aufbaugebiet2, Aufbaugebiet3, FriedhofWolf, WaldInDerMitte, OstKueste1, OstKueste2,  SchluchtSueden, SuedKuesteOst, SuedKuesteWest, WestKueste1, WestKueste2},
	Conditions = 	
	{
	},
}

---------------------------------------------
--
--		Postpersistentes Spawnen
--
---------------------------------------------

-- RTS SPAWN, ein paar Trolle, damit die Welt nicht so leer ist, wenn der Spieler zurück kommt
Trolle1 =
{
	X = 119,
	Y = 223,
	Range = 2,
	Chief = 0, -- Urok 11 Smasher
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
		IsGlobalFlagTrue {Name = "AfterSpawn"}, 
	},
	
	Units = 
	{
		1021, 1021, 1021, 1021, 1021, 1021, 1021, 1021, 	-- Urok 11 Smasher
		440, 440, 440, 440, 440, 440, 						-- Urok 10 Thrower
		439, 439, 439, 439, 439, 439						-- Urok 10 Rowdy
	},
	ShuffleUnits = TRUE,
}

InitSpawn
{
	Clan = 16,
	Groups = {Trolle1},
	Conditions =
	{
	},
}

RtsSpawn
{
	Clan = 16, MaxClanSize = 10,
	Groups = {Trolle1},
	Conditions = {},
}


