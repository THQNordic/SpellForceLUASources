dofile("script/AiHelper.lua")

AggressiveDefault =
{
	MinimalHomePointCrew = 3,
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 1, y1 = 65, x2 = 502, y2 = 506},
	Goal = Agressive,
	StandbyCrew = 2,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}

DefensiveDefault =
{
	Goal = Defensive,
	UpdateWaitTime = 10,
	StandbyCrew = 2,
	FirstAttackWaitTime = Hours(5),
	MinimalHomePointCrew = 8,	
	MaximalHomePointCrew = 20,
	Enemy = {Clan = Player},
	Range = 512,
	AttackWaitTime = 1,
	AlarmedWaitTime = 5
}

-- Aussenhof
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 134, y = 109}
Clan_27["Range"] = 128
Clan_27["AttackFrequency"] = 200
	
-- Dorf 1
Clan_26 = tcopy(DefensiveDefault)
Clan_26["Lookout"] = {	Lookout1 = {x = 154, y = 122, Groupsize = 2, UnitId = 968, Spread = 1}}
Clan_26["MinimalHomePointCrew"] = 3
Clan_26["MaximalHomePointCrew"] = 12
Clan_26["HomePoint"] = {x = 193, y = 163}
Clan_26["Range"] = 128
Clan_26["AttackFrequency"] = 400

-- Dorf 2 Teil 1
Clan_25 = tcopy(DefensiveDefault)
Clan_25["Lookout"] = {	Lookout1 = {x = 357, y = 134, Groupsize = 2, UnitId = 968, Spread = 1}}
Clan_25["HomePoint"] = {x = 403, y = 205}
Clan_25["Range"] = 128
Clan_25["AttackFrequency"] = 400

-- Plünderer
Clan_24 = tcopy(DefensiveDefault)
Clan_24["Lookout"] = {Lookout1 = {x = 203, y = 170, Groupsize = 2, UnitId = 968, Spread = 1}, Lookout2 = {x = 357, y = 153, Groupsize = 2, UnitId = 970, Spread = 1}}
Clan_24["HomePoint"] = {x = 374, y = 121}
Clan_24["AttackFrequency"] = 200

-- Briar Maincamp Defense
Clan_23 = {Goal = Idle}

--Briar Maincamp Offense
Clan_22 = tcopy(AggressiveDefault)
Clan_22["HomePoint"] = {x = 147, y = 352}
Clan_22["AttackFrequency"] = 200

-- Garde
Clan_21 = tcopy(AggressiveDefault)
Clan_21["HomePoint"] = {x = 300, y = 330}
Clan_21["AttackFrequency"] = 200

-- Briar Maincamp Defense
Clan_20 = {Goal = Idle}

-- Briar Maincamp Defense
Clan_19 = {Goal = Idle}