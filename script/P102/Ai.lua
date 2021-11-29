dofile("script/AiHelper.lua")

--P102
-- AI Verhalten für Orks

AggressiveDefault =
{
	MinimalHomePointCrew = 5,
	MaximalHomePointCrew = 10,
	MaximalNumberScoutGroups = 2,
	AreaRange = {x1 = 164, y1 = 194, x2 = 262, y2 = 33},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 256,
	AttackGroupSize = 4,
	AttackFrequency = 300
}

	
--Grosses Kitharlager im Süden

Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 259, y = 164}
--Clan_26["AreaRange"] = {x1 = 234, y1 = 189, x2 = 275, y2 = 181}
Clan_26["AttackFrequency"] = 500

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