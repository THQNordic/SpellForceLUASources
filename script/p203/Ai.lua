dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

AggressiveDefault =
{
	MinimalHomePointCrew = 6,
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 3,
	AreaRange = {x1 = 32, y1 = 372, x2 = 434, y2 = 455},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackGroupSize = 5,
	AttackFrequency = 300
}

-- Aufbaustörer Orks 
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 239, y = 403}
Clan_27["Range"] = 128
Clan_27["AttackFrequency"] = 400
	

---- Aufbaustörer Orks 
--Clan_26 = tcopy(AggressiveDefault)
--Clan_26["HomePoint"] = {x = 282, y = 393}
--Clan_26["Range"] = 128
--Clan_26["AttackFrequency"] = 369

-- Endcamp
Clan_26 =
{
	Goal = Idle,
}

-- Aufbaustörer Orks Drei, Nahe der Blockade
Clan_25 = tcopy(AggressiveDefault)
Clan_25["HomePoint"] = {x = 323, y = 396}
Clan_25["Range"] = 128
Clan_25["AttackFrequency"] = 223


-- Endcamp
--Clan_24 = tcopy(AggressiveDefault)
--Clan_24["HomePoint"] = {x = 344, y = 143}
--Clan_24["Range"] = 128
--Clan_24["AttackFrequency"] = 277		
--Clan_24["AreaRange"] = {x1 = 72, y1 = 321, x2 = 410, y2 = 73}

Clan_24 =
{
	Goal = Defensive,
	UpdateWaitTime = 60,

	Lookout = 
	{
		Lookout1 = {x = 404, y = 256, Groupsize = 2, UnitId = 2050, Spread = 5, Fight = 0},
	},
	FirstAttackWaitTime = 7200,
	MinimalHomePointCrew = 4,	
	AttackGroupSize = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 344, y = 143}, 
	Range = 512,
	AlarmedWaitTime = 60, 
	AttackFrequency = 300,	
	
}

---- Endcamp
--Clan_23 = tcopy(AggressiveDefault)
--Clan_23["HomePoint"] = {x = 344, y = 114}
--Clan_23["Range"] = 128
--Clan_23["AttackFrequency"] = 277		
--Clan_23["AreaRange"] = {x1 = 72, y1 = 321, x2 = 410, y2 = 73}

Clan_23 =
{
	Goal = Defensive,
	UpdateWaitTime = 60,

	Lookout = 
	{
		Lookout1 = {x = 299, y = 200, Groupsize = 2, UnitId = 2050, Spread = 5, Fight = 0},
	},
	FirstAttackWaitTime = 7200,
	MinimalHomePointCrew = 4,	
	AttackGroupSize = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 344, y = 114}, 
	Range = 512,
	AlarmedWaitTime = 60, 
	AttackFrequency = 322,	
	
}

-- Endcamp                               		
Clan_22 = tcopy(AggressiveDefault)       
Clan_22["HomePoint"] = {x = 286, y = 119}
Clan_22["Range"] = 256                   
Clan_22["AttackFrequency"] = 400		 
Clan_22["AreaRange"] = {x1 = 72, y1 = 421, x2 = 410, y2 = 73}

---- Endcamp
--Clan_21 =
--{
--	Goal = Idle,
--}
  
Clan_21 =
{
	Goal = Defensive,
	UpdateWaitTime = 60,

	Lookout = 
	{
		Lookout1 = {x = 246, y = 392, Groupsize = 2, UnitId = 2050, Spread = 5, Fight = 0},
	},
	FirstAttackWaitTime = 7200,
	MinimalHomePointCrew = 4,	
	AttackGroupSize = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 285, y = 117}, 
	Range = 512,
	AlarmedWaitTime = 60, 
	AttackFrequency = 269,	
	
}  
  
-- Endcamp
Clan_20 =
{
	Goal = Idle,
}

-- Endcamp
Clan_19 =
{
	Goal = Idle,
}





