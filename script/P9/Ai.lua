dofile("script/AiHelper.lua")

-- AI Verhalten Northern Windwalls




-- Angriffswelle 1
Clan_27 = {	Goal = Script}	

--Angriffswelle 2
Clan_26 = { Goal = Script}

--Angriffswelle 3
Clan_25 = { Goal = Script}

-- Skelettcamp Osten vor der Blockade 
Clan_24 = { Goal = Idle}	

---- Skelettcamp Untoten Zwischenlager  
Clan_23 = { Goal = Idle}

-- Skeleton Skirmisher Camp Altes Zwischenlager 2
Clan_22 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 8,	
	MaximalHomePointCrew = 20,
	StandbyCrew = 2,
	ScoutGroupSize = 1,
	AreaRange = {x1 = 56, y1 = 198, x2 = 428, y2 = 21},
	NoScoutAreas =
	{
		NSA = {x1 = 240, y1 = 309, x2 = 285, y2 = 446}
	},
	HomePoint = {x = 208, y = 202}, 
	Range = 512,
	AttackFrequency = 360
}

-- Portaltruppe um Kishan
Clan_21 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 15,
	StandbyCrew = 2,
	ScoutGroupSize = 2,
	AreaRange = {x1 = 56, y1 = 198, x2 = 428, y2 = 21},
	HomePoint = {x = 227, y = 50}, 
	Range = 512,
	AttackFrequency = 360
}

-- Schattencamp
Clan_20 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 25,
	StandbyCrew = 2,
	ScoutGroupSize = 2,
	AreaRange = {x1 = 56, y1 = 198, x2 = 428, y2 = 21},
	HomePoint = {x = 326, y = 199}, 
	Range = 512,
	AttackFrequency = 360
}

-- Eisenblocker
Clan_19 = { Goal = Idle}

-- SPinnen an der Mine
Clan_18 = { Goal = Idle}

-- Tiere
Clan_17 = { Goal = Idle}

-- PP Trolle
Clan_16 = { Goal = Idle}

