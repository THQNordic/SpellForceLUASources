dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

AggressiveDefault =
{
	MinimalHomePointCrew = 3,
	MaximalHomePointCrew = 15,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 491, y1 = 509, x2 = 8, y2 = 34},
	Goal = Agressive,
	StandbyCrew = 2,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}


--Eisgolems
Clan_27 = tcopy(AggressiveDefault)
Clan_27["MinimalHomePointCrew"] = 5
Clan_27["MaximalHomePointCrew"] = 22
Clan_27["HomePoint"] = {x = 67, y = 350}
Clan_27["AttackFrequency"] = 240
	
--Spawnblades
Clan_25 = {Goal = Idle}	

--Spawnblades
Clan_24 = {Goal = Idle}

Clan_23 = tcopy(AggressiveDefault)
Clan_23["HomePoint"] = {x = 90, y = 434}
Clan_23["AttackFrequency"] = 349

Clan_22 = tcopy(AggressiveDefault)
Clan_22["MinimalHomePointCrew"] = 4
Clan_22["MaximalHomePointCrew"] = 17
Clan_22["HomePoint"] = {x = 157, y = 147}
Clan_22["AttackFrequency"] = 180

Clan_21 = tcopy(AggressiveDefault)
Clan_21["MinimalHomePointCrew"] = 5
Clan_21["MaximalHomePointCrew"] = 20
Clan_21["HomePoint"] = {x = 191, y = 147}
Clan_21["AttackFrequency"] = 297

Clan_20 = tcopy(AggressiveDefault)
Clan_20["MinimalHomePointCrew"] = 7
Clan_20["MaximalHomePointCrew"] = 15
Clan_20["HomePoint"] = {x = 202, y = 136}
Clan_20["AttackFrequency"] = 233


