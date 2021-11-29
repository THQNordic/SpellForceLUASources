dofile("script/AiHelper.lua")

-- AI Verhalten Howling Mounds

AggressiveDefault =
{
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 242, y1 = 378, x2 = 11, y2 = 93},
	Goal = Agressive,
	StandbyCrew = 4,
	ScoutGroupSize = 0, -- Die Jungs hinter dem Tor sollen mal wieder erst angreifen, wenn das Tore auf ist
	Range = 512,
}


--Bogenschützen
Clan_27 = { Goal = Idle}

---- Spectre Camp am Zwergenmonument
Clan_26 = tcopy (AggressiveDefault)
Clan_26["MinimalHomePointCrew"] = 8
Clan_26["ScoutGroupSize"] = 1
Clan_26["HomePoint"] = {x = 313, y = 274}
Clan_26["Range"] = 128
Clan_26["AttackFrequency"] = 200

-- Nordarmee
Clan_25 = tcopy (AggressiveDefault)
Clan_25["MinimalHomePointCrew"] = 12
Clan_25["ScoutGroupSize"] = 1
Clan_25["HomePoint"] = {x = 113, y = 293}
Clan_25["AttackFrequency"] = 400

-- Suedarmee
Clan_24 = tcopy (AggressiveDefault)
Clan_24["MinimalHomePointCrew"] = 6
Clan_24["ScoutGroupSize"] = 1
Clan_24["HomePoint"] = {x = 87, y = 200}
Clan_24["AttackFrequency"] = 300

-- Angriffstruppe
Clan_23 = tcopy (AggressiveDefault)
Clan_23["MinimalHomePointCrew"] = 1
Clan_23["MaximalHomePointCrew"] = 8
Clan_23["StandbyCrew"] = 2
Clan_23["HomePoint"] = {x = 254, y = 237}
Clan_23["AttackFrequency"] = 240

--Schockcaster1
Clan_22 = { Goal = Idle}

-- Schockcaster2
Clan_21 = { Goal = Idle}

-- Erster Teil Hauptarmee
Clan_20 = { Goal = Idle}

--Zweiter Teil Hauptarmee
Clan_19 = tcopy (AggressiveDefault)
Clan_19["MinimalHomePointCrew"] = 1
Clan_19["StandbyCrew"] = 2
Clan_19["HomePoint"] = {x = 313, y = 274}
Clan_19["AttackFrequency"] = 240

--Dritter Teil Hauptarmee
Clan_18 = { Goal = Idle}

-- Portalwachen
Clan_17 = { Goal = Idle}

-- Aussenwachen
Clan_16 = { Goal = Idle}
--
-- Oasencamp
Clan_15 = tcopy (AggressiveDefault)
Clan_15["MinimalHomePointCrew"] = 3
Clan_15["MaximalHomePointCrew"] = 10
Clan_15["StandbyCrew"] = 2
Clan_15["ScoutGroupSize"] = 1
Clan_15["HomePoint"] = {x = 158, y = 244}
Clan_15["AttackFrequency"] = 180

-- Turmcamp
Clan_14 = tcopy (AggressiveDefault)
Clan_14["MinimalHomePointCrew"] = 6
Clan_14["MaximalHomePointCrew"] = 25
Clan_14["StandbyCrew"] = 2
Clan_14["ScoutGroupSize"] = 1
Clan_14["HomePoint"] = {x = 65, y = 244}
Clan_14["AttackFrequency"] = 300

-- Tierchen (och wie süß)
Clan_8 = { Goal = Idle}