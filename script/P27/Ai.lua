dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

AggressiveDefault =
{
	MinimalHomePointCrew = 6,
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 491, y1 = 509, x2 = 8, y2 = 34},
	Goal = Agressive,
	StandbyCrew = 2,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}

--Tiieejer
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 375, y = 267} 
Clan_27["AttackFrequency"] = 240

--Tiieejer
Clan_26 = {Goal = Idle}

--Tiieejer
Clan_25 = tcopy(AggressiveDefault)
Clan_25["HomePoint"] = {x = 431, y = 208}
Clan_25["AttackFrequency"] = 240

--Tiieejer
Clan_24 = tcopy(AggressiveDefault)	
Clan_24["HomePoint"] = {x = 461, y = 165}
Clan_24["AttackFrequency"] = 240


-- Blades
Clan_23 = {Goal = Idle}

-- Blades
Clan_22 = {Goal = Idle}

--Tiieejer
Clan_21 = tcopy(AggressiveDefault)	
Clan_21["HomePoint"] = {x = 274, y = 112}
Clan_21["AttackFrequency"] = 200
