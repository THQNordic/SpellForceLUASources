-- _______________________________________
--I                                      I
--I       P201_Blackwater_Coast          I
--I______________________________________I

dofile("script/AiHelper.lua")



AggressiveDefault =
{
	MinimalHomePointCrew = 2,
	MaximalHomePointCrew = 10,
	MaximalNumberScoutGroups = 2,
	AreaRange = {x1 = 30, y1 = 140, x2 = 235, y2 = 5},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackGroupSize = 4,
	AttackFrequency = 300
}


--Skeletoncamp Urias
Clan_27 =
{
	Goal = Idle,
}	

--Skeletoncamp1 Grabstätte Defensiv
Clan_26 =
{
	Goal = Idle,
}	

--Skeletoncamp2 Grabstätte Agressiv
Clan_25 = tcopy(AggressiveDefault)
Clan_25["HomePoint"] = {x = 175, y = 99}
Clan_25["AttackFrequency"] = 300


--Skeletoncamp3 Grabstätte Defensiv
Clan_24 =
{
	Goal = Idle,
}	



REM =[[	
-- Kitharlager im Süd-Westen

Clan_27 = tcopy(AggressiveDefault)
Clan_27["AreaRange"] = {x1 = 93, y1 = 217, x2 = 163, y2 = 40}
Clan_27["HomePoint"] = {x = 122, y = 198}
Clan_27["AttackFrequency"] = 500


--Grosses Kitharlager im Osten
Clan_25 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	Lookout =
	{
		Lookout1 = {x = 372, y = 191, Groupsize = 2, UnitId = 1606},
		Lookout2 = {x = 415, y = 209, Groupsize = 2, UnitId = 1492},
	},
	FirstAttackWaitTime = 100000,
	MinimalHomePointCrew = 6,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = Player},
	HomePoint = {x = 408, y = 175}, 
	AlarmedWaitTime = 35, 
	AttackFrequency = 800,
}	

--kl. Kithar Lager Süden
Clan_24 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	--Lookout =
	--{
	--	Lookout1 = {x = 213, y = 190, Groupsize = 1, UnitId = 1606},
		
	--},
	FirstAttackWaitTime = 100000,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 218, y = 172}, 
	AlarmedWaitTime = 15, 
	AttackFrequency = 400,
}	

--kl. Kithar Lager im Osten
Clan_23 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	Lookout =
	{
		Lookout1 = {x = 339, y = 205, Groupsize = 1, UnitId = 1606},
		Lookout2 = {x = 370, y = 191, Groupsize = 1, UnitId = 1606},
	},
	FirstAttackWaitTime = 100000,
	MinimalHomePointCrew = 7,	
	MaximalHomePointCrew = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 346, y = 210}, 
	AlarmedWaitTime = 10, 
	AttackFrequency = 350,
}	

Clan_8 =
{
	Goal = Nomadic,
	NomadicRange = {x1 = 343, y1 = 146, x2 = 370, y2 = 100},
}
]]