dofile("script/AiHelper.lua")


--P103
-- AI Verhalten für Orks

AggressiveDefault =
{
	MinimalHomePointCrew = 2,
	MaximalHomePointCrew = 10,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 10, y1 = 413, x2 = 104, y2 = 168},
	Goal = Agressive,
	ScoutGroupSize = 2, 
	Range = 512,
	AttackFrequency = 300
	
}

-- Oger beim Eisen
Clan_27 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
--	Lookout =
--	{
--		Lookout1 = {x = 104, y = 214, Groupsize = 1, UnitId = 686},
--		
--	},
	--FirstAttackWaitTime = 1800,
	MinimalHomePointCrew = 2,	
	MaximalHomePointCrew = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 139, y = 265}, 
	AlarmedWaitTime = 3, 
	AttackFrequency = 25,
}


-- Orks in Sverans Lager 01
Clan_25 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	Lookout =
	{
		Lookout1 = {x = 72, y = 382, Groupsize = 2, UnitId = 370},
		
	},
	--FirstAttackWaitTime = 1800,
	MinimalHomePointCrew = 2,	
	MaximalHomePointCrew = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 83, y = 423}, 
	AlarmedWaitTime = 1, 
	AttackFrequency = 25,
}

--OrkFestung01Lager03
Clan_24 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	Lookout =
	{
		Lookout1 = {x = 88, y = 413, Groupsize = 2, UnitId = 370},
		
	},
	--FirstAttackWaitTime = 1800,
	MinimalHomePointCrew = 2,	
	MaximalHomePointCrew = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 130, y = 391}, 
	AlarmedWaitTime = 1, 
	AttackFrequency = 50,
}


--OrkFestung01Lager01
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 92, y = 376}
Clan_26["Range"] = 512
Clan_26["AttackFrequency"] = 300



--Orklager Händler01
Clan_23 = tcopy(AggressiveDefault)
Clan_23["HomePoint"] = {x = 196, y = 401}
Clan_23["AreaRange"] = {x1 = 176, y1 = 352, x2 = 221, y2 = 295}
Clan_23["Range"] = 256
Clan_23["ScoutGroupSize"] = 1 
Clan_23["AttackFrequency"] = 150

--Orklager Händler02
Clan_22 = tcopy(AggressiveDefault)
Clan_22["HomePoint"] = {x = 219, y = 418}
Clan_22["AreaRange"] = {x1 = 176, y1 = 352, x2 = 221, y2 = 295}
Clan_22["Range"] = 256
Clan_22["ScoutGroupSize"] = 1 
Clan_22["AttackFrequency"] = 200	


--Orklager Händler03
Clan_14 = tcopy(AggressiveDefault)
Clan_14["HomePoint"] = {x = 178, y = 435}
Clan_14["AreaRange"] = {x1 = 176, y1 = 352, x2 = 221, y2 = 295}
Clan_14["Range"] = 256
Clan_14["ScoutGroupSize"] = 1 
Clan_14["AttackFrequency"] = 200	




Clan_19 =
{
	Goal = Idle,
}

Clan_18 =
{
	Goal = Idle,
}

Clan_17 =
{
	Goal = Idle,
}

Clan_16 =
{
	Goal = Idle,
}
	



--Lager bei Eisenressourcen
Clan_13 = tcopy(AggressiveDefault)
Clan_13["HomePoint"] = {x = 54, y = 322}
Clan_13["Range"] = 512
Clan_13["ScoutGroupSize"] = 1 
Clan_13["AttackFrequency"] = 300

-- Orks vor Sverans Lager 01
Clan_12 = tcopy(AggressiveDefault)
Clan_12["HomePoint"] = {x = 47, y = 331}
Clan_12["Range"] = 512
Clan_12["ScoutGroupSize"] = 1 
Clan_12["AttackFrequency"] = 300

-- Orks Hortar1
Clan_20 = tcopy(AggressiveDefault)
Clan_20["HomePoint"] = {x = 317, y = 259}
Clan_20["Range"] = 512
Clan_20["ScoutGroupSize"] = 1 
Clan_20["AttackFrequency"] = 300

-- Orks Hortar2
Clan_21 = tcopy(AggressiveDefault)
Clan_21["HomePoint"] = {x = 306, y = 237}
Clan_21["Range"] = 512
Clan_21["ScoutGroupSize"] = 1 
Clan_21["AttackFrequency"] = 300






--Oger bei Ariaquelle
Clan_15 =
{
	Goal = Idle,
}	
