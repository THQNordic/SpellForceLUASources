-- _______________________________________
--I                                      I
--I             P209_Kathai			     I
--I______________________________________I

dofile("script/AiHelper.lua")


AggressiveDefault =
{
	MinimalHomePointCrew = 2,
	MaximalHomePointCrew = 15,
	MaximalNumberScoutGroups = 1,
	AreaRange = {x1 = 97, y1 = 430, x2 = 246, y2 = 157},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackGroupSize = 5,
	AttackWaitTime = 900,
	AttackFrequency = 300,
	FirstAttackWaitTime = 1800,
	Enemy = {Clan = Player},
}

DefensiveDefault =
{
	MinimalHomePointCrew = 2,
	MaximalHomePointCrew = 15,
	Goal = Defensive,
	AttackGroupSize = 4,
	AttackFrequency = 300,
	FirstAttackWaitTime = 100000,
	Enemy = {Clan = Player},
	AlarmedWaitTime = 60, 
}

-- OstTorCamps

--Skeletoncamp1 OstTor Agressiv
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 182, y = 254}
Clan_27["AttackFrequency"] = 300

--Skeletoncamp2 OstTor Agressiv
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 185, y = 287}
Clan_26["AttackFrequency"] = 300

--Skeletoncamp4 OstTor Agressiv
Clan_24 = tcopy(AggressiveDefault)
Clan_24["HomePoint"] = {x = 214, y = 260}
Clan_24["AttackFrequency"] = 300

--Mumiencamp3 OstTor Defensive
Clan_25 = tcopy(DefensiveDefault)
Clan_25["HomePoint"] = {x = 217, y = 297}
Clan_25["Lookout"] = {Lookout1 = {x = 170, y = 277, Groupsize = 2, UnitId = 2089}}
Clan_25["AttackFrequency"] = 300

--Mumiencamp5 OstTor Defensive
Clan_23 = tcopy(DefensiveDefault)
Clan_23["HomePoint"] = {x = 218, y = 242}
Clan_23["Lookout"] = {Lookout1 = {x = 170, y = 277, Groupsize = 2, UnitId = 2089}}
Clan_23["AttackFrequency"] = 300



--NordTorCamps

--Skeletoncamp1 NordTor Agressiv
Clan_22 = tcopy(AggressiveDefault)
Clan_22["HomePoint"] = {x = 246, y = 406}
Clan_22["AttackFrequency"] = 300

--Mumiencamp2 NordTor Defensive
Clan_21 = tcopy(DefensiveDefault)
Clan_21["HomePoint"] = {x = 264, y = 412}
Clan_21["Lookout"] = {Lookout1 = {x = 238, y = 422, Groupsize = 2, UnitId = 2089}}
Clan_21["AttackFrequency"] = 300

--Skeletoncamp3 NordTor Agressiv
Clan_20 = tcopy(AggressiveDefault)
Clan_20["HomePoint"] = {x = 253, y = 382}
Clan_20["AttackFrequency"] = 300

--Mumiencamp4 NordTor Defensive
Clan_19 = tcopy(DefensiveDefault)
Clan_19["HomePoint"] = {x = 265, y = 360}
Clan_19["Lookout"] = {Lookout1 = {x = 238, y = 422, Groupsize = 2, UnitId = 2089}}
Clan_19["AttackFrequency"] = 300



--SüdTorCamps

--Skeletoncamp1 SüdTor Agressiv
Clan_18 = tcopy(AggressiveDefault)
Clan_18["HomePoint"] = {x = 141, y = 151}
Clan_18["AttackFrequency"] = 300

--Mumiencamp2 SüdTor Defensive
Clan_17 = tcopy(DefensiveDefault)
Clan_17["HomePoint"] = {x = 165, y = 149}
Clan_17["Lookout"] = {Lookout1 = {x = 146, y = 186, Groupsize = 2, UnitId = 2089}}
Clan_17["AttackFrequency"] = 300

--Skeletoncamp3 SüdTor Defensive
Clan_16 = tcopy(DefensiveDefault)
Clan_16["HomePoint"] = {x = 191, y = 155}
Clan_16["Lookout"] = {Lookout1 = {x = 146, y = 186, Groupsize = 2, UnitId = 2123}}
Clan_16["AttackFrequency"] = 300



--InnenstadtCamps

--Skeletoncamp1 Innenstadt Idle
Clan_15 =
{
	Goal = Idle,
}

--Skeletoncamp2 Innenstadt Idle
Clan_14 =
{
	Goal = Idle,
}

--Skeletoncamp3 Innenstadt Idle
Clan_13 =
{
	Goal = Idle,
}

--Skeletoncamp4 Innenstadt Idle
Clan_12 =
{
	Goal = Idle,
}

--Skeletoncamp5 Innenstadt Idle
Clan_11 =
{
	Goal = Idle,
}

--Skeletoncamp6 Innenstadt Idle
Clan_10 =
{
	Goal = Idle,
}

--Skeletoncamp7 Innenstadt Idle
Clan_9 =
{
	Goal = Idle,
}

--Skeletoncamp8 Innenstadt Idle
Clan_8 =
{
	Goal = Idle,
}

--Skeletoncamp9 Innenstadt Idle
Clan_7 =
{
	Goal = Idle,
}

--Skeletoncamp10 Innenstadt Idle
Clan_6 =
{
	Goal = Idle,
}

--Skeletoncamp11 Innenstadt Idle
Clan_5 =
{
	Goal = Idle,
}

--Skeletoncamp12 Innenstadt Idle
Clan_4 =
{
	Goal = Idle,
}

--Skeletoncamp13 Innenstadt Idle
Clan_3 =
{
	Goal = Idle,
}