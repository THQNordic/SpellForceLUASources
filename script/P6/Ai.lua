dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

-- Alle AggressiveCamps machen das auﬂer da wo was anderes steht *g
AggressiveDefault =
{
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 69, y1 = 139,x2 = 503, y2 = 440},
	Goal = Agressive,
	StandbyCrew = 4,
	ScoutGroupSize = 1,
	MinimalHomePointCrew = 4,
	MaximalHomePointCrew = 10
}

-- Erster Trupp im Lager hinter Fluﬂ
Clan_27 = tcopy (AggressiveDefault)
Clan_27["MaximalHomePointCrew"] = 15
Clan_27["StandbyCrew"] = 2
Clan_27["HomePoint"] = {x = 398, y = 211}
Clan_27["AttackFrequency"] = 300

--  Zweiter Trupp im Lager hinter Fluﬂ
Clan_26 = tcopy (AggressiveDefault)
Clan_26["ScoutGroupSize"] = 2
Clan_26["HomePoint"] = {x = 403, y = 199}
Clan_26["AttackFrequency"] = 380

--  Dritter Trupp im Lager hinter Fluﬂ
Clan_25 = { Goal = Idle}	

--  Vierter Trupp im Lager hinter Fluﬂ
Clan_24 = { Goal = Idle}	

-- Suedliche Blockade
Clan_23 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	Lookout =
	{
		--Lookout1 = {x = 286, y = 340, Groupsize = 1, UnitId = 658},
	},
	FirstAttackWaitTime = Hours(5),
	MinimalHomePointCrew = 2,	
	MaximalHomePointCrew = 30,
	Enemy = {Clan = Player},
	HomePoint = {x = 156, y = 190}, 
	Range = 256,
	AttackFrequency = 3000
}	

--Camp am Monument
Clan_22 = tcopy (AggressiveDefault)
Clan_22["MinimalHomePointCrew"] = 3
Clan_22["MaximalHomePointCrew"] = 6
Clan_22["StandbyCrew"] = 2
Clan_22["ScoutGroupSize"] = 2
Clan_22["HomePoint"] = {x = 189, y = 291}
Clan_22["AttackFrequency"] = 340

-- Westliches Brigantenlager Armee2
Clan_21 = tcopy (AggressiveDefault)
Clan_21["MinimalHomePointCrew"] = 5
Clan_21["MaximalHomePointCrew"] = 12
Clan_21["StandbyCrew"] = 2
Clan_21["ScoutGroupSize"] = 2
Clan_21["HomePoint"] = {x = 188, y = 195}
Clan_21["Range"] = 256
Clan_21["AttackFrequency"] = 300

-- erstes Nordcamp
Clan_20 = {Goal = Idle}

-- zweites Nordcamp
Clan_19 = tcopy (AggressiveDefault)
Clan_19["MinimalHomePointCrew"] = 3
Clan_19["StandbyCrew"] = 2
Clan_19["ScoutGroupSize"] = 2
Clan_19["HomePoint"] = {x = 396, y = 310}
Clan_19["AttackWaitTime"] = 300
Clan_19["AttackFrequency"] = 240

-- drittes
Clan_18 = tcopy (AggressiveDefault)
Clan_18["MinimalHomePointCrew"] = 3
Clan_18["StandbyCrew"] = 2
Clan_18["HomePoint"] = {x = 368, y = 311}
Clan_18["AttackWaitTime"] = 300
Clan_18["AttackFrequency"] = 340

-- Resourcencamp
Clan_17 = {Goal = Idle}

