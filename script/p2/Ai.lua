dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

-- Alle AggressiveCamps machen das außer da wo was anderes steht *g
AggressiveDefault =
{
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 228, y1 = 164,x2 = 370, y2 = 48},
	Goal = Agressive,
	StandbyCrew = 4,
	ScoutGroupSize = 0, -- weil dann keiner kommt und in das Brückencamp läuft oder bei den Wladläufern vorbei
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
}


--Gobblins Ruinencamp 1
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 245, y = 151}
Clan_27["AttackFrequency"] = 200
Clan_27["AttackWaitTime"] = Minutes (5)
Clan_27["ScoutGroupSize"] = 2

-- Gobbblins Ruff Waldcamp
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 250, y = 272}
Clan_26["AttackFrequency"] = 280


---- Ruffs Orks
Clan_25 = tcopy(AggressiveDefault)
Clan_25["HomePoint"] = {x = 256, y = 278}
Clan_25["AttackFrequency"] = Minutes (5)


-- Beastmen
Clan_24 =
{
	Goal = Idle,
}	

-- Orcs Wald Camp von Murak, Versorgungscamp für Angriffscamp Brücke 1
Clan_23 = tcopy(DefensiveDefault)
Clan_23["HomePoint"] = {x = 249, y = 325}
Clan_23["AttackFrequency"] = Minutes (5)
Clan_23["Lookout"] = {Lookout1 = {x = 214, y = 321, Groupsize = 2, UnitId = 1157}}

-- Orcs Wald Camp von Murak, Versorgungscamp für Angriffscamp Brücke 1
Clan_22 = tcopy(DefensiveDefault)
Clan_22["MaximalHomepointCrew"] = 22
Clan_22["HomePoint"] = {x = 266, y = 340} 
Clan_22["AttackFrequency"] = Minutes (4)
Clan_22["Lookout"] ={Lookout1 = {x = 210, y = 324, Groupsize = 2, UnitId = 1157}}

-- Blockade Gobbos
Clan_21 =
{
	Goal = Idle,
}

Clan_20 =
{
	Goal = Idle,
}

-- Blockade Orks
Clan_19 =
{
	Goal = Idle,
}

-- Brückencamp Gobbos links 1
Clan_18 = tcopy(AggressiveDefault)
Clan_18["HomePoint"] = {x = 186, y = 284}
Clan_18["AttackFrequency"] = Minutes (3)

-- Brückencamp Gobbos rechts 1
Clan_17 = tcopy(AggressiveDefault)
Clan_17["HomePoint"] = {x = 189, y = 293}
Clan_17["AttackFrequency"] = Minutes (4)


-- Brückencamp Gobbos rechts 2
Clan_16 = tcopy(AggressiveDefault)
Clan_16["HomePoint"] = {x = 194, y = 293}
Clan_16["AttackFrequency"] = Minutes (3)

-- Blockade Gobbos
Clan_15 =
{
	Goal = Idle,
}

-- Klarg und Klurgs Gesellen
Clan_10 =
{
	Goal = Idle,
}
