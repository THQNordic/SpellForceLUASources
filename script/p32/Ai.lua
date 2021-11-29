dofile("script/AiHelper.lua")

-- AI Verhalten Sharrowdale

AggressiveDefaultPartI =
{
	MinimalHomePointCrew = 5,
	MaximalHomePointCrew = 25,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 36, y1 = 243, x2 = 417, y2 = 33},
	Goal = Agressive,
	StandbyCrew = 2,
	ScoutGroupSize = 1, 
	Range = 256,
	AttackFrequency = 240
}

AggressiveDefaultPartII =
{
	MinimalHomePointCrew = 0,
	MaximalHomePointCrew = 15,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 455, y1 = 71, x2 = 212, y2 = 307},
	Enemy = {Clan = Player},
	Goal = Agressive,
	StandbyCrew = 1,
	ScoutGroupSize = 1, 
	Range = 256,
	AttackFrequency = 240,
	AttackWaitTime = Minutes(10)
}


--Blades
Clan_27 = tcopy(AggressiveDefaultPartI)
Clan_27["HomePoint"] = {x = 180, y = 70}



--Blades
Clan_26 = tcopy(AggressiveDefaultPartI)
Clan_26["HomePoint"] = {x = 317, y = 67}


--Blades
Clan_25 =
{
	Goal = Idle,
}	

--Geister
Clan_24 = tcopy(AggressiveDefaultPartII)
Clan_24["HomePoint"] = {x = 418, y = 100}


--Blades
Clan_23 =
{
	Goal = Idle,
}

--Blades
Clan_22 = tcopy(AggressiveDefaultPartI)
Clan_22["HomePoint"] = {x = 257, y = 172}
	
--Blades
Clan_21 = tcopy(AggressiveDefaultPartII)
Clan_21["MinimalHomePointCrew"] = 5
Clan_21["HomePoint"] = {x = 220, y = 289}

--Blades
Clan_20 = tcopy(AggressiveDefaultPartII)
Clan_20["MinimalHomePointCrew"] = 5
Clan_20["HomePoint"] = {x = 204, y = 277}
Clan_20["AttackWaitTime"] = 300

Clan_10 =
{
	Goal = Script,
}	

Clan_9 =
{
	Goal = Script,
}
Clan_8 =
{
	Goal = Script,
}
Clan_7 =
{
	Goal = Script,
}