dofile("script/AiHelper.lua")

-- AI Verhalten Darkwind Keep


AggressiveDefault =
{
	MinimalHomePointCrew = 10,
	MaximalHomePointCrew = 12,
	MaximalNumberScoutGroups = 4,
	AttackGroupSize = 8,
	AreaRange = {x1 = 198, y1 = 474, x2 = 300, y2 = 222},
	Goal = Agressive,
	ScoutGroupSize = 3, 
	Range = 544,
	AttackFrequency = 250,
}

--aggressiv von anfang an
-- Blades Ost
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 316, y = 171}
Clan_27["Range"] = 544
Clan_27["AttackFrequency"] = 300
Clan_27["AreaRange"] = {x1 = 198, y1 = 474, x2 = 300, y2 = 222}

-- Echsen Ost
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 306, y = 146}
Clan_26["Range"] = 544
Clan_26["AttackFrequency"] = 200
Clan_26["AreaRange"] = {x1 = 198, y1 = 474, x2 = 300, y2 = 222}




--scriptm‰ﬂig umstellen, wellen schicken
-- Blades West
Clan_25 =
{
	Goal = Idle,
}

-- Echsen West
Clan_24 =
{
	Goal = Idle,
}



--------------------------------------------------
--AggressiveDefault =
--{
--	MinimalHomePointCrew = 10,
--	MaximalHomePointCrew = 20,
--	MaximalNumberScoutGroups = 2,
--	AreaRange = {x1 = 275, y1 = 249, x2 = 286, y2 = 207},
--	Goal = Agressive,
--	ScoutGroupSize = 4, 
--	Range = 512,
--	AttackFrequency = 300
--}
--
---- Blades Ost
--Clan_27 = tcopy(AggressiveDefault)
--Clan_27["HomePoint"] = {x = 318, y = 169}
--Clan_27["Range"] = 520
--Clan_27["AttackFrequency"] = 200
--Clan_27["AreaRange"] = {x1 = 264, y1 = 304, x2 = 308, y2 = 268}
--	
--
---- Echsen Ost
--Clan_26 = tcopy(AggressiveDefault)
--Clan_26["HomePoint"] = {x = 307, y = 152}
--Clan_26["Range"] = 520
--Clan_26["AttackFrequency"] = 200
--Clan_26["AreaRange"] = {x1 = 264, y1 = 304, x2 = 308, y2 = 268}
--
--
---- Blades West
--Clan_25 = tcopy(AggressiveDefault)
--Clan_25["HomePoint"] = {x = 231, y = 184}
--Clan_25["Range"] = 520
--Clan_25["AttackFrequency"] = 180
--Clan_25["AreaRange"] = {x1 = 204, y1 = 304, x2 = 278, y2 = 391}
--
--
---- Echsen West
--Clan_24 = tcopy(AggressiveDefault)
--Clan_24["HomePoint"] = {x = 219, y = 212}
--Clan_24["Range"] = 520
--Clan_24["AttackFrequency"] = 190
--Clan_24["AreaRange"] = {x1 = 204, y1 = 304, x2 = 278, y2 = 391}







