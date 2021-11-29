-- RTS Spawn:
-- p11 Stoneblade Mountain

GlobalSpawnDuration = 180

--Monumentenclaim Elfen & Zwerge
OnPlatformOneTimeEvent
{
	Conditions = 
	{
		ODER (IsMonumentInUse {X = 299, Y = 134, Range = 0}, IsMonumentInUse {X = 349, Y = 111, Range = 0}),
	},
	Actions =
	{
		SetGlobalTimeStamp{Name = "ElfMonumentClaimedTimer"},
	}
}

--Trolle 1 WestCamp
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 25,
	X = 304,
	Y = 287,
	Range = 3,
	
	
	Timer	= "ElfMonumentClaimedTimer",-- name des globalen timers der bei einem bestimmten event gesetzt wird und das spawning auslöst
	Init	= {1215, 1216, 1217}, 	-- Troll Urok Devastator/Bouncer/Hurler
	SpawnData =
	{
		[33]	= {Minutes = 2.5, 	Units = {1215}},			
		[50]	= {Minutes = 2.2, 	Units = {1216}},			
		[70]	= {Minutes = 1.8, 	Units = {1217}}, 	    
		[90]	= {Minutes = 1.2, 	Units = {1215, 1218}}, -- Troll Urok Champion 	
		[125]	= {Seconds = 50, 	Units = {1215, 1216, 1217, 1218}},
	},
	NpcBuildingsExist = {X = 304, Y = 287, Range = 10},
}


--Trolle 2 NordCamp
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 35,
	X = 405,
	Y = 321,
	Range = 3,
	
	
	Timer	= "ElfMonumentClaimedTimer",
	Init	= {1215, 1216, 1217, 1218}, 	-- Troll Urok Devastator/Bouncer/Hurler/Champion
	SpawnData =
	{
		[30]	= {Minutes = 2.5, 	Units = {1216}},			
		[55]	= {Minutes = 2.3, 	Units = {1215}},			
		[66]	= {Minutes = 2, 	Units = {1215}}, 	    
		[95]	= {Minutes = 1.8, 	Units = {1218}},	    	
		[135]	= {Seconds = 50, 	Units = {1216, 1217}},  	
	},
	NpcBuildingsExist = {X = 405, Y = 321, Range = 10},
}


--Trolle 3 SuedCamp
RtsSpawnNT
{
	Clan = 25,
	MaxClanSize = 30,
	X = 390,
	Y = 270,
	Range = 3,
	
	
	Timer	= "ElfMonumentClaimedTimer",
	Init	= {1215, 1216, 1217}, 	-- Troll Urok Devastator/Bouncer/Hurler
	SpawnData =
	{
		[32]	= {Minutes = 2.5, 	Units = {1215}},		
		[53]	= {Minutes = 2.1, 	Units = {1215}},		
		[64]	= {Minutes = 1.8, 	Units = {1216}}, 	
		[90]	= {Seconds = 60, 	Units = {1217}},	    
		[125]	= {Seconds = 50, 	Units = {1218, 1215, 1215}},
	},
	NpcBuildingsExist = {X = 390, Y = 270, Range = 10},
}

--Minotauren 1 Suedlicher Talkessel

RtsSpawnNT
{
	Clan = 24,
	MaxClanSize = 40,
	X = 101,
	Y = 177,
	Range = 3,
	
	
	Timer	= "ElfMonumentClaimedTimer",
	Init	= {1219, 1219, 1220}, 	-- Minotauren  Axt8 &Knüppler9
	SpawnData =
	{
		[6]		= {Minutes = 3.5, 	Units = {1219}},		
		[36]	= {Minutes = 3.0, 	Units = {1220}},		
		[66]	= {Minutes = 2.5, 	Units = {1219}}, 	
		[96]	= {Minutes = 2, 	Units = {1220}},	    
		[126]	= {Minutes = 1, 	Units = {1219, 1220}},
	},
	NpcBuildingsExist = {X = 101, Y = 177, Range = 10},
}

--Minotauren 2 Nördlicher Talkessel

RtsSpawnNT
{
	Clan = 23,
	MaxClanSize = 35,
	X = 127,
	Y = 208,
	Range = 3,
	
	
	Timer	= "ElfMonumentClaimedTimer",
	Init	= {1219, 1220}, 	
	SpawnData =
	{
		[5]		= {Minutes = 2, 	Units = {1219}},		
		[35]	= {Minutes = 1.5, 	Units = {1219}},		
		[64]	= {Minutes = 1.7, 	Units = {1220}}, 	
		[96]	= {Minutes = 1, 	Units = {1220}},	    
		[123]	= {Seconds = 50, 	Units = {1220, 1219}},

	},
	NpcBuildingsExist = {X = 127, Y = 208, Range = 10},
}

-- Clan 22 mal rausgenommen, weil hier kein Camp steht seit Ewigkeiten, drei Minoautren weniger machen den Kohl nicht fett

--Blockade Minotauren

RtsSpawnNT
{
	Clan = 21,
	MaxClanSize = 30,
	X = 168,
	Y = 192,
	Range = 3,
	
	
	Timer	= "ElfMonumentClaimedTimer",
	Init	= {1220, 1220, 1220}, 	
	SpawnData =
	{
		[5]		= {Minutes = 3.5, 	Units = {1220}},		
		[35]	= {Minutes = 2.5, 	Units = {1219}},		
		[65]	= {Minutes = 1.5, 	Units = {1220}}, 	
		[95]	= {Minutes = 1.4, 	Units = {1220}},	    
		[125]	= {Minutes = 1.1, 	Units = {1219, 1220}},

	},
	NpcBuildingsExist = {X = 173, Y = 190, Range = 0},
}

-- Minotauren

RtsSpawnNT
{
	Clan = 20,
	MaxClanSize = 50,
	X = 106,
	Y = 148,
	Range = 3,
	
	
	Timer	= "ElfMonumentClaimedTimer",
	Init	= {1220, 1220, 1220}, 
	SpawnData =
	{
		[5]		= {Minutes = 3.5, 	Units = {1220}},		
		[35]	= {Minutes = 2.5, 	Units = {1219}},		
		[65]	= {Minutes = 1.5, 	Units = {1220}}, 	
		[95]	= {Minutes = 1.3, 	Units = {1220}},	    
		[125]	= {Minutes = 1.1, 	Units = {1219, 1220}},
	},
	NpcBuildingsExist = {X = 100, Y = 147, Range = 0},
}


--Trolle

RtsSpawnNT
{
	Clan = 19,
	MaxClanSize = 20,
	X = 308,
	Y = 230,
	Range = 3,
	
	
	Timer	= "ElfMonumentClaimedTimer",
	Init	= {1220, 1220, 1220}, 
	SpawnData =
	{
		[28]	= {Minutes = 3.5, 	Units = {1220}},		
		[44]	= {Minutes = 3, 	Units = {1219}},		
		[61]	= {Minutes = 2, 	Units = {1220}}, 	
		[89]	= {Minutes = 1.2, 	Units = {1220}},	    
	},
	NpcBuildingsExist = {X = 308, Y = 230, Range = 10},
}


--AI_Main lädt Clans-->die im Editor gesetzt sind


RtsSpawnNT
{
	Clan = 18,
	MaxClanSize = 20,
	X = 393,
	Y = 205,
	Range = 5,
	
	
	Timer	= "ElfMonumentClaimedTimer",
	Init	= {860, 860, 860, 860, 860, 860}, 
	SpawnData =
	{
		[0]		= {Minutes = 3.5, 	Units = {860}},	
	},
	NpcBuildingsExist = {X = 385, Y = 208, Range = 10},
}





    



-- RTS SPAWN, Steinlingcamp schickt Attackewellen zum Dorf, deshalb anderer Clan als "normale" Steinlinge
-- Angriff über Clan Attack, da Ki nicht sofort nach dem Spawnen angreifen würde
-- Ist mit dem Alten Spawn, weil es sonst Probleme mit dem Abstellen des Spawnings gab, da es über Flags auch
-- wieder ausgeschaltet wird


SteinlingcampAttack =
{
	X = 390,
	Y = 207,
	Range = 5,
	Chief = 0,	
	WaitTime = 120,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{

	},
	Units = 
	{
		860, 860, 860, 860, 860, 860 -- Golem Steinling 5
	},
	ShuffleUnits = TRUE,
	
}

InitSpawn
{
	Clan = 17, 
	Groups = {SteinlingcampAttack},
	Conditions = 	
	{ 
		IsGlobalFlagTrue{Name = "Q166GolemStarter"},
		IsGlobalFlagFalse{Name = "Q166GuardiansDead"},
		IsGlobalFlagFalse{Name = "Q166TimeUp"},
	}
}

RtsSpawn
{
	Clan = 17, MaxClanSize = 7,
	Groups = {SteinlingcampAttack},
	Conditions = 	
	{
	    IsGlobalFlagTrue{Name = "Q166GolemStarter"},
	    IsGlobalFlagFalse{Name = "Q166GuardiansDead"},
		IsGlobalFlagFalse{Name = "Q166TimeUp"},
	},
}





-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
Aufbaugebiet =
{
	X = 265,
	Y = 97,
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
		354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}


Portal =
{
	X = 219,
	Y = 102,
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
		349, 349, 349,349	--Animal Greywulf
	},                    
	ShuffleUnits = FALSE,
	
}

FeldDerSteine =
{
	X = 216,
	Y = 346,
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
		354,			-- Animal Deer Old
		353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

WestBerg =
{
	X = 151,
	Y = 301,
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
		354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}

Ringgolem5 =
{
	X = 147,
	Y = 187,
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
		349, 349, 349,349	--Animal Greywulf
	},                    
	ShuffleUnits = FALSE,
}	

SuedWesten =
{
	X = 395,
	Y = 158,
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
		345,			-- Animal Blackbear
		349, 349,349	--Animal Greywulf
	},                    
	ShuffleUnits = TRUE,
	
}

PortalWald =
{
	X = 198,
	Y = 48,
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
		
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

PortalWaldNord =
{
	X = 218,
	Y = 139,
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
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

TrollSchweine =
{
	X = 405,
	Y = 272,
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
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

MinotaurenSchweine =
{
	X = 172,
	Y = 228,
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
		345,			-- Animal Blackbear
		348, 348, 348, 348 	-- Animal Wildboar
	},                    
	ShuffleUnits = TRUE,
	
}

InitSpawn
{
	Clan = 8, 
	Groups = {Aufbaugebiet, Portal, FeldDerSteine, WestBerg, Ringgolem5, SuedWesten, PortalWald, PortalWaldNord, TrollSchweine, MinotaurenSchweine},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 8, MaxClanSize = 90,
	Groups = {Aufbaugebiet, Portal, FeldDerSteine, WestBerg, Ringgolem5, SuedWesten, PortalWald, PortalWaldNord, TrollSchweine, MinotaurenSchweine},
	Conditions = 	
	{
	},
}



-- Caster Steingolem Wachen

SteinlingwachenI =
{
	X = 344,
	Y = 227,
	Range = 2,
	Chief = 2268,	
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		860, 860, 860, 860 -- Golem Steinling 5
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 14, 
	Groups = {SteinlingwachenI},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}	

RtsSpawn
{
	Clan = 14, MaxClanSize = 4,
	Groups = {SteinlingwachenI},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}

-- Caster Steingolem Wachen II

SteinlingwachenII =
{
	X = 322,
	Y = 323,
	Range = 3,
	Chief = 2269,	
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		860, 860, 860, 860 -- Golem Steinling 5
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 13, 
	Groups = {SteinlingwachenII},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}	

RtsSpawn
{
	Clan = 13, MaxClanSize = 4,
	Groups = {SteinlingwachenII},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}

-- Caster Steingolem Wachen III

SteinlingwachenIII =
{
	X = 288,
	Y = 411,
	Range = 3,
	Chief = 2270,	
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		860, 860, 860, 860 -- Golem Steinling 5
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 12, 
	Groups = {SteinlingwachenIII},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}	

RtsSpawn
{
	Clan = 12, MaxClanSize = 4,
	Groups = {SteinlingwachenIII},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}

-- Caster Steingolem Wachen IV

SteinlingwachenIV =
{
	X = 117,
	Y = 363,
	Range = 3,
	Chief = 2271,	
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		860, 860, 860, 860 -- Golem Steinling 5
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 11, 
	Groups = {SteinlingwachenIV},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}	

RtsSpawn
{
	Clan = 11, MaxClanSize = 4,
	Groups = {SteinlingwachenIV},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}

-- Caster Steingolem Wachen V

SteinlingwachenV =
{
	X = 133,
	Y = 294,
	Range = 3,
	Chief = 2272,	
	WaitTime = 60,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		860, 860, 860, 860 -- Golem Steinling 5
	},                    
	ShuffleUnits = FALSE,
	
}

InitSpawn
{
	Clan = 10, 
	Groups = {SteinlingwachenV},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}	

RtsSpawn
{
	Clan = 10, MaxClanSize = 4,
	Groups = {SteinlingwachenV},
	Conditions = 	
	{
		IsGlobalFlagTrue {Name = "Q166GolemStarter"},
	},
}


