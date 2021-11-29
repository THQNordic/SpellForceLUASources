dofile("script/AiHelper.lua")

-- AI Verhalten Stoneblade Mountain

AggressiveDefault =
{
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 30, y1 = 13,x2 = 477, y2 = 450},
	Goal = Agressive,
	StandbyCrew = 4,
	ScoutGroupSize = 1
}

--Trolle 1 WestCamp
Clan_27 = tcopy(AggressiveDefault)
Clan_27["MinimalHomePointCrew"] = 3
Clan_27["MaximalHomePointCrew"] = 18
Clan_27["StandbyCrew"] = 2
Clan_27["HomePoint"] = {x = 304, y = 287}
Clan_27["AttackFrequency"] = 400

-- Trolle 2 NordCamp
Clan_26 = tcopy(AggressiveDefault)
Clan_26["MinimalHomePointCrew"] = 4
Clan_26["MaximalHomePointCrew"] = 15
Clan_26["ScoutGroupSize"] = 2
Clan_26["HomePoint"] = {x = 405, y = 321}
Clan_26["AttackFrequency"] = 280

-- Trolle 3 SuedCamp
Clan_25 = tcopy(AggressiveDefault)
Clan_25["MinimalHomePointCrew"] = 2
Clan_25["MaximalHomePointCrew"] = 8
Clan_25["HomePoint"] = {x = 390, y = 270}
Clan_25["AttackFrequency"] = 220

-- Minotauren 1 Suedlicher Talkessel
Clan_24 = tcopy(AggressiveDefault)
Clan_24["MinimalHomePointCrew"] = 2
Clan_24["MaximalHomePointCrew"] = 16
Clan_24["HomePoint"] = {x = 101, y = 177}
Clan_24["AttackFrequency"] = 280

-- Minotauren  Noerdlicher Talkessel
Clan_23 = tcopy(AggressiveDefault)
Clan_23["MinimalHomePointCrew"] = 4
Clan_23["MaximalHomePointCrew"] = 20
Clan_23["ScoutGroupSize"] = 2
Clan_23["HomePoint"] = {x = 127, y = 208}
Clan_23["AttackFrequency"] = 240

-- Clan 22 mal rausgenommen, weil hier kein Camp steht seit Ewigkeiten, drei Minoautren weniger machen den Kohl nicht fett

-- Blockade Minotauren
Clan_21 = tcopy(AggressiveDefault)
Clan_21["MinimalHomePointCrew"] = 2
Clan_21["MaximalHomePointCrew"] = 10
Clan_21["AttackGroupSize"] = 5
Clan_21["HomePoint"] = {x = 170, y = 190}
Clan_21["AttackFrequency"] = 250

-- Minotauren
Clan_20 = tcopy(AggressiveDefault)
Clan_20["MinimalHomePointCrew"] = 3
Clan_20["MaximalHomePointCrew"] = 22
Clan_20["StandbyCrew"] = 2
Clan_20["HomePoint"] = {x = 104, y = 147}
Clan_20["AttackFrequency"] = 300

-- Blockade  Trolle
Clan_19 = tcopy(AggressiveDefault)
Clan_19["MinimalHomePointCrew"] = 3
Clan_19["MaximalHomePointCrew"] = 16
Clan_19["StandbyCrew"] = 2
Clan_19["HomePoint"] = {x = 308, y = 230}
Clan_19["AttackFrequency"] = 240

-- Editor
Clan_18 = { Goal = Idle}

--Tierchen
Clan_8 = {Goal = Idle}	