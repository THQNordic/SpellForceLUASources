dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

AggressiveDefault =
{
	MinimalHomePointCrew = 6,
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 1,
	AreaRange = {x1 = 345, y1 = 79, x2 = 467, y2 = 244},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}

-- Südliche Trolle
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 421, y = 200}
Clan_27["Range"] = 128
Clan_27["AttackFrequency"] = 222
	

-- nördliche Trolle
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 355, y = 86}
Clan_26["Range"] = 128
Clan_26["AttackFrequency"] = 277

-- Banditen
Clan_25 =
{
	Goal = Idle,
}

-- Elfen in der Stadt
Clan_10 =
{
	Goal = Idle,
}		


