dofile("script/AiHelper.lua")

-- AI Verhalten Leafshade

-- Alle AggressiveCamps machen das außer da wo was anderes steht *g
AggressiveDefault =
{
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 92, y1 = 78, x2 = 478, y2 = 510},
	Goal = Agressive,
	StandbyCrew = 2,
	ScoutGroupSize = 1,
	MinimalHomePointCrew = 4,
	MaximalHomePointCrew = 10
}

DefensiveDefault =
{
	Goal = Defensive,
	UpdateWaitTime = Minutes(3),
	FirstAttackWaitTime = Hours(5),
	MinimalHomePointCrew = 4,	
	MaximalHomePointCrew = 14,
	Enemy = {Clan = Player},
	Range = 512,
	AlarmedWaitTime = 1
}

--Gobblins Holzfällercamp/Eisenlager
Clan_27 = tcopy(AggressiveDefault)
Clan_27["MinimalHomePointCrew"] = 3
Clan_27["HomePoint"] = {x = 385, y = 301}
Clan_27["AttackFrequency"] = 200

--Gobblins Holzfällercamp/Steinlager
Clan_26 = tcopy(DefensiveDefault)
Clan_26["Lookout"] = {Lookout1 = {x = 286, y = 340, Groupsize = 1, UnitId = 658}}
Clan_26["MinimalHomePointCrew"] = 2
Clan_26["HomePoint"] = {x = 209, y = 319}
Clan_26["AttackFrequency"] = 30

-- Hohe Wacht
Clan_25 = tcopy(DefensiveDefault)
Clan_25["Lookout"] ={	Lookout1 = {x = 183, y = 217, Groupsize = 1, UnitId = 779, Range = 0}, 
						Lookout2 = {x = 183, y = 215, Groupsize = 1, UnitId = 779, Range = 0}}
Clan_25["HomePoint"] = {x = 249, y = 213}
Clan_25["Range"] = 256
Clan_25["AttackFrequency"] = 300

-- Gobblins Holzfällercamp 1
Clan_24 = tcopy(AggressiveDefault)
Clan_24["MaximalHomePointCrew"] = 20
Clan_24["HomePoint"] = {x = 428, y = 267}
Clan_24["AttackFrequency"] = 280

-- Orcs Holzfällercamp1
Clan_23 = tcopy(AggressiveDefault)
Clan_23["MinimalHomePointCrew"] = 2
Clan_23["MaximalHomePointCrew"] = 8
Clan_23["HomePoint"] = {x = 377, y = 228}
Clan_23["AttackFrequency"] = 340


-- Orcs/Gobbos Nachschublager
Clan_22 = tcopy(AggressiveDefault)
Clan_22["MinimalHomePointCrew"] = 5
Clan_22["MaximalHomePointCrew"] = 15
Clan_22["HomePoint"] = {x = 392, y = 184}
Clan_22["AttackFrequency"] = 360


-- Aufbaustörer/Plänkler
Clan_21 =
{
	Goal = Idle,
}


-- Hauptcamp Gobblinfraktion
Clan_20 = tcopy(AggressiveDefault)
Clan_20["MinimalHomePointCrew"] = 2
Clan_20["MaximalHomePointCrew"] = 10
Clan_20["HomePoint"] = {x = 209, y = 319}
Clan_20["AttackFrequency"] = 300
Clan_20["Lookout"] ={Lookout1 = {x = 164, y = 221, Groupsize = 1, UnitId = 658}}
	
-- OrcsHauptlager 1
Clan_19 =
{
	Goal = Idle,
}

-- OrcsHauptlager 2
Clan_18 = tcopy(AggressiveDefault)
Clan_18["MinimalHomePointCrew"] = 3
Clan_18["MaximalHomePointCrew"] = 35
Clan_18["HomePoint"] = {x = 194, y = 371}
Clan_18["AttackFrequency"] = 300

---- Hauptcamp Fernkämpfer
Clan_17 = tcopy(AggressiveDefault)
Clan_17["MinimalHomePointCrew"] = 6
Clan_17["MaximalHomePointCrew"] = 30
Clan_17["HomePoint"] = {x = 210, y = 350}
Clan_17["AttackFrequency"] = 180

-- Nachschublager 1
Clan_16 = tcopy(AggressiveDefault)
Clan_16["MinimalHomePointCrew"] = 3
Clan_16["MaximalHomePointCrew"] = 35
Clan_16["HomePoint"] = {x = 420, y = 190}
Clan_16["AttackFrequency"] = 300

-- Nachschublager 2
Clan_15 = tcopy(AggressiveDefault)
Clan_15["MinimalHomePointCrew"] = 6
Clan_15["MaximalHomePointCrew"] = 30
Clan_15["HomePoint"] = {x = 391, y = 154}
Clan_15["AttackFrequency"] = 180

-- Die Twonks
Clan_7 =
{
	Goal = Nomadic,
	NomadicRange = {x1 = 119, y1 = 284, x2 = 385, y2 = 419},
}
