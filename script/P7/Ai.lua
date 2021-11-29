dofile("script/AiHelper.lua")

-- AI Verhalten Icegate Marsh




--Blades
Clan_27 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 20,
	Enemy = {Clan = Player},
	HomePoint = {x = 155, y = 79},
	Lookout =
	{
		Lookout1 = {x = 147, y = 95, Groupsize = 2, UnitId = 304},
	}, 
	Range = 256,
	AttackWaitTime = 60,
	AttackFrequency = 550,
	UpdateWaitTime = 1,
	AttackGroupSize = 1,
	FirstAttackWaitTime = Minutes(360)
}	


--Drachlinge
Clan_26 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 1,	
	MaximalHomePointCrew = 10,
	StandbyCrew = 2,
	ScoutGroupSize = 1,
	MaximalNumberScoutGroups = 2,
	HomePoint = {x = 211, y = 176}, 
	Range = 512,
	AttackWaitTime = 300,
	AttackFrequency = 200
}	

--Eisgolems eins
Clan_25 =
{
	Goal = Idle,
}	

--Eisgolems zwei
Clan_24 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 20,
	StandbyCrew = 2,
	ScoutGroupSize = 1,
	MaximalNumberScoutGroups = 2,
	HomePoint = {x = 433, y = 252}, 
	Range = 512,
	AttackWaitTime = 300,
	AttackFrequency = 240
}

--Eiselfen I
Clan_23 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 8,	
	MaximalHomePointCrew = 20,
	StandbyCrew = 2,
	ScoutGroupSize = 3,
	MaximalNumberScoutGroups = 2,
	HomePoint = {x = 332, y = 457}, 
	Range = 512,
	AttackWaitTime = 300,
	AttackFrequency = 340
}

--Eiselfen II
Clan_22 =
{
	Goal = Idle,
}

--Eiselementare 
Clan_22 =
{
	Goal = Idle,
}