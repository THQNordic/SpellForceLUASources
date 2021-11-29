dofile("script/AiHelper.lua")

-- AI Verhalten FinalBattle

AggressiveDefault =
{
	MinimalHomePointCrew = 6,
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 2,
	AreaRange = {x1 = 345, y1 = 79, x2 = 467, y2 = 244},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}

-- Elementare Nordost1
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 321, y = 283}
Clan_27["Range"] = 520
Clan_27["AttackFrequency"] = 200
Clan_27["AreaRange"] = {x1 = 312, y1 = 397, x2 = 511, y2 = 230}
	

-- Elementare Nordost2
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 306, y = 298}
Clan_26["Range"] = 520
Clan_26["AttackFrequency"] = 200
Clan_26["AreaRange"] = {x1 = 312, y1 = 397, x2 = 511, y2 = 230}


-- Elementare Südost1
Clan_25 = tcopy(AggressiveDefault)
Clan_25["HomePoint"] = {x = 458, y = 106}
Clan_25["Range"] = 520
Clan_25["AttackFrequency"] = 180
Clan_25["AreaRange"] = {x1 = 506, y1 = 76, x2 = 317, y2 = 263}


-- Elementare Südost2
Clan_24 = tcopy(AggressiveDefault)
Clan_24["HomePoint"] = {x = 443, y = 170}
Clan_24["Range"] = 520
Clan_24["AttackFrequency"] = 190
Clan_24["AreaRange"] = {x1 = 506, y1 = 76, x2 = 317, y2 = 263}


-- Elementare Südost3
Clan_23 = tcopy(AggressiveDefault)
Clan_23["HomePoint"] = {x = 436, y = 148}
Clan_23["Range"] = 520
Clan_23["AttackFrequency"] = 220
Clan_23["AreaRange"] = {x1 = 506, y1 = 76, x2 = 317, y2 = 263}	

--------------------------------------------------------
-- Werwölfe Nordwest1
Clan_22 = tcopy(AggressiveDefault)
Clan_22["HomePoint"] = {x = 73, y = 305}
Clan_22["Range"] = 520
Clan_22["AttackFrequency"] = 180
Clan_22["AreaRange"] = {x1 = 23, y1 = 232, x2 = 283, y2 = 435}	

-- Werwölfe Südwest1
Clan_21 = tcopy(AggressiveDefault)
Clan_21["HomePoint"] = {x = 86, y = 109}
Clan_21["Range"] = 520
Clan_21["AttackFrequency"] = 270
Clan_21["AreaRange"] = {x1 = 37, y1 = 56, x2 = 257, y2 = 499}	

-- Werwölfe Südwest2
Clan_20 = tcopy(AggressiveDefault)
Clan_20["HomePoint"] = {x = 107, y = 77}
Clan_20["Range"] = 520
Clan_20["AttackFrequency"] = 210
Clan_20["AreaRange"] = {x1 = 37, y1 = 56, x2 = 257, y2 = 499}	

	
-- Werwölfe Südwest3
Clan_19 = tcopy(AggressiveDefault)
Clan_19["HomePoint"] = {x = 126, y = 52}
Clan_19["Range"] = 520
Clan_19["AttackFrequency"] = 180
Clan_19["AreaRange"] = {x1 = 37, y1 = 56, x2 = 257, y2 = 499}

---------------------------------------------------------------

-- Dunkelelfen

-- Dunkelelfen1
Clan_17 = tcopy(AggressiveDefault)
Clan_17["HomePoint"] = {x = 188, y = 212}
Clan_17["Range"] = 128
Clan_17["AttackFrequency"] = 120
Clan_17["AreaRange"] = {x1 = 214, y1 = 226, x2 = 114, y2 = 177}	

-- Dunkelelfen2
Clan_16 = tcopy(AggressiveDefault)
Clan_16["HomePoint"] = {x = 186, y = 196}
Clan_16["Range"] = 128
Clan_16["AttackFrequency"] = 60
Clan_16["AreaRange"] = {x1 = 214, y1 = 226, x2 = 114, y2 = 177}	

-- Dunkelelfen3
Clan_15 = tcopy(AggressiveDefault)
Clan_15["HomePoint"] = {x = 274, y = 234}
Clan_15["Range"] = 128
Clan_15["AttackFrequency"] = 120
Clan_15["AreaRange"] = {x1 = 259, y1 = 254, x2 = 328, y2 = 175}	

-- Dunkelelfen4
Clan_14 = tcopy(AggressiveDefault)
Clan_14["HomePoint"] = {x = 302, y = 204}
Clan_14["Range"] = 128
Clan_14["AttackFrequency"] = 150
Clan_14["AreaRange"] = {x1 = 259, y1 = 254, x2 = 328, y2 = 175}





