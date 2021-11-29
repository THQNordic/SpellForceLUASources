dofile("script/AiHelper.lua")

-- AI Verhalten Greydusk
AggressiveDefault =
{
	MaximalNumberScoutGroups = 4,
	MinimalHomePointCrew = 8,
	MaximalHomePointCrew = 20,
	AreaRange = {x1 = 16, y1 = 499, x2 = 503, y2 = 10},
	Goal = Agressive,
	StandbyCrew = 4,
	ScoutGroupSize = 1,
	AttackFrequency = 300
}

DefensiveDefault =
{
	Goal = Defensive,
	UpdateWaitTime = Minutes(3),
	FirstAttackWaitTime = Hours(5),
	MinimalHomePointCrew = 6,	
	MaximalHomePointCrew = 25,
	Enemy = {Clan = Player},
	Range = 512,
	AttackFrequency = 1500,
}

--Trolle, die Im Dorf bleiben
Clan_27 = { Goal = Idle}	

--Angriffstrolle
Clan_26 = tcopy (AggressiveDefault)
Clan_26["MinimalHomePointCrew"] = 3
Clan_26["MaximalHomePointCrew"] = 22
Clan_26["HomePoint"] = {x = 83, y = 390}
Clan_26["Range"] = 256

--Trolle, die Im Dorf bleiben
Clan_25 = { Goal = Idle}

--Zihar reinforce
Clan_24 = tcopy (DefensiveDefault)
Clan_24["MaximalHomePointCrew"] = 18
Clan_24["HomePoint"] = {x = 425, y = 314}

--nördliches Plateaucamp
Clan_23 = tcopy (AggressiveDefault)
Clan_23["ScoutGroupSize"] = 2
Clan_23["HomePoint"] = {x = 210, y = 373}
Clan_23["NoScoutAreas"] ={NSA1 = {x1 = 50, x2 = 344, y1 = 123, y2 = 429}}


--südliches Plateaucamp
Clan_22 = tcopy (AggressiveDefault)
Clan_22["HomePoint"] = {x = 220, y = 137}
Clan_22["NoScoutAreas"] ={NSA1 = {x1 = 50, x2 = 344, y1 = 123, y2 = 429}}

-- Norden Höhlenstörer
Clan_21 = tcopy (DefensiveDefault)
Clan_21["HomePoint"] = {x = 294, y = 414}

-- Süden Höhlenstörer
Clan_20 = tcopy (DefensiveDefault)
Clan_20["HomePoint"] = {x = 271, y = 160}


-- gespawnte skelett gruppen
--Clan_9 = { Goal = Script }
--Clan_8 = { Goal = Script }
--Clan_7 = { Goal = Script }
--Clan_6 = { Goal = Script }


Clan_9 = 
{
	Goal = Agressive,
HomePoint = {x = 366, y = 315}, 
	MaximalNumberScoutGroups = 4,
	StandbyCrew = 0,
	ScoutGroupSize = 1,
	AttackGroupSize = 2,
	MinimalHomePointCrew = 17,	
	MaximalHomePointCrew = 20,
	Range = 64,
	AttackFrequency = 60,
}
Clan_8 =
{
	Goal = Agressive,
HomePoint = {x = 336, y = 303}, 
	MaximalNumberScoutGroups = 4,
	StandbyCrew = 0,
	ScoutGroupSize = 1,
	AttackGroupSize = 2,
	MinimalHomePointCrew = 17,	
	MaximalHomePointCrew = 20,
	Range = 64,
	AttackFrequency = 60,
}

Clan_7 = 
{
	Goal = Agressive,
HomePoint = {x = 332, y = 258}, 
	MaximalNumberScoutGroups = 4,
	StandbyCrew = 0,
	ScoutGroupSize = 1,
	AttackGroupSize = 2,
	MinimalHomePointCrew = 17,	
	MaximalHomePointCrew = 20,
	Range = 64,
	AttackFrequency = 60,
}

Clan_6 = 
{
	Goal = Agressive,
HomePoint = {x = 385, y = 265}, 
	MaximalNumberScoutGroups = 4,
	StandbyCrew = 0,
	ScoutGroupSize = 1,
	AttackGroupSize = 2,
	MinimalHomePointCrew = 17,	
	MaximalHomePointCrew = 20,
	Range = 64,
	AttackFrequency = 60,
}

