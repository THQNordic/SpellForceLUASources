dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

AggressiveDefault =
{
	MinimalHomePointCrew = 6,
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 1,
	AreaRange = {x1 = 21, y1 = 123, x2 = 503, y2 = 445},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}

-- Südliche Trolle
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 205, y = 248}
Clan_27["Range"] = 256
Clan_27["AttackFrequency"] = 223
	
	
Clan_26 =
{
	Goal = Idle,
}

