dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

AggressiveDefault =
{
	MinimalHomePointCrew = 6,
	MaximalHomePointCrew = 15,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 47, y1 = 481, x2 = 454, y2 = 68},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	MaximalNumberScoutGroups = 4,
	Range = 512,
	AttackFrequency = 300,
	AttackGroupSize = 8,
	AlarmedWaitTime = 10,
}

-- Erstes Mumien Camp im Norden
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 268, y = 449}
Clan_27["AttackFrequency"] = 223
	
-- Mumien am Eisen 
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 233, y = 384}
Clan_26["AttackFrequency"] = 248

-- Gottesanbeterinnen Nordöstliche Ecke
Clan_25 =
{
	Goal = Idle,
}
 
-- Gottesanbeterinnen Ruinen

Clan_24 = tcopy(AggressiveDefault)
Clan_24["HomePoint"] = {x = 429, y = 417}
Clan_24["AttackFrequency"] = 311
 
---- Gottesanbeterinnen Am Teich
Clan_23 =
{
	Goal = Idle,
}

---- Gottesanbeterinnen Rohstofflager unterhalb der Festung
Clan_22 =
{
	Goal = Idle,
}


-- Noerdliches Camp Blades vor dem Tor

Clan_21 = tcopy(AggressiveDefault)
Clan_21["HomePoint"] = {x = 436, y = 248}
Clan_21["AttackFrequency"] = 311

Clan_20 =
{
	Goal = Idle,
}


-- Alle Blade Camps bis auf eins in der Festung auf Idle, da sie sonst rushen, wenn das Tor auf geht
Clan_19 =
{
	Goal = Idle,
}

Clan_18 = tcopy(AggressiveDefault)
Clan_18["HomePoint"] = {x = 114, y = 147}
Clan_18["AttackFrequency"] = 900

Clan_17 =
{
	Goal = Idle,
}

Clan_16 =
{
	Goal = Idle,
}

Clan_15 =
{
	Goal = Idle,
}

Clan_14 =
{
	Goal = Idle,
}

Clan_13 =
{
	Goal = Defensive,
	UpdateWaitTime = 60,

	Lookout = 
	{
		Lookout1 = {x = 409, y = 438, Groupsize = 2, UnitId = 2432, Spread = 5, Fight = 0},
	},
	FirstAttackWaitTime = 3600,
	MinimalHomePointCrew = 4,	
	AttackGroupSize = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 312, y = 297}, 
	Range = 512,
	AlarmedWaitTime = 60, 
	AttackFrequency = 300,	
	
}