dofile("script/AiHelper.lua")

AggressiveDefault =
{
	MinimalHomePointCrew = 3,
	MaximalHomePointCrew = 15,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 491, y1 = 509, x2 = 8, y2 = 34},
	Goal = Agressive,
	StandbyCrew = 4,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}

DefensiveDefault =
{
	Goal = Defensive,
	UpdateWaitTime = Minutes(3),
	FirstAttackWaitTime = Hours(5),
	MinimalHomePointCrew = 4,	
	MaximalHomePointCrew = 15,
	Enemy = {Clan = Player},
	Range = 512,
}

--Skeleton Südliche Garnison
Clan_27 = tcopy(DefensiveDefault)
Clan_27["Lookout"] ={Lookout1 = {x = 297, y = 205, Groupsize = 2, UnitId = 146}}
Clan_27["MinimalHomePointCrew"] = 2
Clan_27["HomePoint"] = {x = 289, y = 116}
Clan_27["AttackFrequency"] = 480

--Zombies Südliche Garnison
Clan_26 = {Goal = Idle}	

--Erste Unforgiven Armee
Clan_25 = tcopy(DefensiveDefault)
Clan_25["Lookout"] = {Lookout1 = {x = 218, y = 127, Groupsize = 1, UnitId = 281}}
Clan_25["HomePoint"] = {x = 148, y = 75}
Clan_25["AttackFrequency"] = 560


--Zweite Unforgiven Armee
Clan_24 = tcopy(AggressiveDefault)
Clan_24["HomePoint"] = {x = 180, y = 116}

--Dritte Unforgiven Armee
Clan_23 = {Goal = Idle}

--Schatzkammer
Clan_22 = {Goal = Idle}

--Bibliothek
Clan_21 = {Goal = Idle}

--Gesindehaus Zombies
Clan_20 = tcopy(DefensiveDefault)
Clan_20["Lookout"] ={Lookout1 = {x = 83, y = 150, Groupsize = 1, UnitId = 227}}
Clan_20["MinimalHomePointCrew"] = 6
Clan_20["MaximalHomePointCrew"] = 18
Clan_20["HomePoint"] = {x = 337, y = 180}
Clan_20["AttackFrequency"] = 423

--Gesindehaus Skelette
Clan_19 = tcopy(AggressiveDefault)
Clan_19["HomePoint"] = {x = 326, y = 224}

--Stallungen Zombies
Clan_18 = {Goal = Idle}	

--Stallungen Skelette
Clan_17 = tcopy(AggressiveDefault)
Clan_17["MaximalHomePointCrew"] = 10
Clan_17["ScoutGroupSize"] = 2
Clan_17["HomePoint"] = {x = 420, y = 283}
Clan_17["AttackWaitTime"] = 623
Clan_17["AttackFrequency"] = 323


--Stallungen Zombies
Clan_16 = {Goal = Idle}	

--Tiere
Clan_15 = {Goal = Idle}