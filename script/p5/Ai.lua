dofile("script/AiHelper.lua")

-- AI Verhalten Shiel


-- Alle AggressiveCamps machen das auﬂer da wo was anderes steht *g
AggressiveDefault =
{
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 84, y1 = 478, x2 = 467, y2 = 94},
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

--Korns Truppe/Armee1
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 173, y = 355}
Clan_27["AttackFrequency"] = 200
	
-- Korns Orks Armee1
Clan_26 = tcopy(AggressiveDefault)
Clan_26["StandbyCrew"] = 4
Clan_26["HomePoint"] = {x = 361, y = 383}
Clan_26["AttackFrequency"] = 380
	
-- Korns Orks Armee1 Mine
Clan_25 = tcopy(AggressiveDefault)
Clan_25["MinimalHomePointCrew"] = 2
Clan_25["HomePoint"] = {x = 373, y = 364}
Clan_25["AttackFrequency"] = 300
	
-- Korns Orks Armee1 Schmiede
Clan_24 = tcopy(AggressiveDefault)
Clan_24["MinimalHomePointCrew"] = 2
Clan_24["StandbyCrew"] = 3
Clan_24["HomePoint"] = {x = 346, y = 391}
Clan_24["AttackWaitTime"] = 500
Clan_24["AttackFrequency"] = 350

-- Armee2 Gobblins Lager
Clan_23 = tcopy(AggressiveDefault)
Clan_23["MinimalHomePointCrew"] = 1
Clan_23["MaximalHomePointCrew"] = 8
Clan_23["HomePoint"] = {x = 362, y = 236}
Clan_23["AttackWaitTime"] = 500
Clan_23["AttackFrequency"]= 240

--Armee2 Briganten Lager
Clan_22 = tcopy(AggressiveDefault)
Clan_22["MinimalHomePointCrew"] = 3
Clan_22["MaximalHomePointCrew"] = 6
Clan_22["HomePoint"] = {x = 342, y = 216}
Clan_22["AttackFrequency"] = 240

-- Westliches Brigantenlager Armee2
Clan_21 = tcopy(AggressiveDefault)
Clan_21["MinimalHomePointCrew"] = 5
Clan_21["MaximalHomePointCrew"] = 6
Clan_21["ScoutGroupSize"] = 2
Clan_21["HomePoint"] = {x = 237, y = 154}
Clan_21["AttackFrequency"] = 340

-- Gobblins in der Aufbauzone
Clan_20 = { Goal = Idle,}

-- Briganten
Clan_19 = { Goal = Idle,}

-- Gobbos Menschenmonument
Clan_18 = { Goal = Idle,}

-- Portalblockierer
Clan_17 =	{ Goal = Idle,}

-- Armee 4
Clan_16 =	{ Goal = Idle,}

-- Armee 3
Clan_15 =	{ Goal = Idle,}

-- Tiere
Clan_14 =	{ Goal = Idle,}

-- PP-Spawn
Clan_13 =	{ Goal = Idle,}

-- PP-Spawn
Clan_12 =	{ Goal = Idle,}

-- Talkesselcamp
Clan_11 = tcopy(AggressiveDefault)
Clan_11["MinimalHomePointCrew"] = 5
Clan_11["MaximalHomePointCrew"] = 6
Clan_11["ScoutGroupSize"] = 2
Clan_11["HomePoint"] = {x = 79, y = 318}
Clan_11["AttackFrequency"] = 340

-- Elfenmonument
Clan_10 = tcopy(AggressiveDefault)
Clan_10["MinimalHomePointCrew"] = 3
Clan_10["HomePoint"] = {x = 198, y = 256}
Clan_10["AttackFrequency"] = 340
