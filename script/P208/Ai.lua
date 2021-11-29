dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

AggressiveDefault =
{
	MinimalHomePointCrew = 6,
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 1,
	AreaRange = {x1 = 42, y1 = 53, x2 = 297, y2 = 174},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}

-- Erstes Camp im Norden
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 264, y = 172}
Clan_27["AttackFrequency"] = 222
	

-- Erstes Camp im Sueden
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 180, y = 32}
Clan_26["AttackFrequency"] = 277

-- Zweites Camp im Sueden
Clan_25 = tcopy(AggressiveDefault)
Clan_25["HomePoint"] = {x = 56, y = 63}
Clan_25["AttackFrequency"] = 311


-- Camp Mitte
Clan_24 =
{
	Goal = Idle,
}


-- Heldenmonument
Clan_23 = tcopy(AggressiveDefault)
Clan_23["HomePoint"] = {x = 148, y = 237}
Clan_23["AttackFrequency"] = 256

-- Am Tor
Clan_22 =
{
	Goal = Idle,
}

-- Beastmen
Clan_21 = tcopy(AggressiveDefault)
Clan_21["HomePoint"] = {x = 241, y = 436}
Clan_21["AttackFrequency"] = 223
Clan_21["AreaRange"] = {x1 = 108, y1 = 268, x2 = 317, y2 = 429} 

-- Beastmen
Clan_20 =
{
	Goal = Idle,
}

-- Beastmen
Clan_19 =
{
	Goal = Idle,
}

-- Beastmen
Clan_18 = tcopy(AggressiveDefault)
Clan_18["HomePoint"] = {x = 179, y = 329}
Clan_18["AttackFrequency"] = 223
Clan_18["AreaRange"] = {x1 = 108, y1 = 268, x2 = 317, y2 = 429}

-- Beastmen
Clan_17 =
{
	Goal = Idle,
}

-- Noch mal Werwölfe
Clan_17 =
{
	Goal = Idle,
}