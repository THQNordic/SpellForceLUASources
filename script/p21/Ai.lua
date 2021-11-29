dofile("script/AiHelper.lua")

-- AI Farlorns Hope


-- Erstes Red Legion Camp
Clan_27 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 3,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 26},
	HomePoint = {x = 276, y = 262}, 
	Range = 128,
	AlarmedWaitTime = 1, 
	AttackWaitTime = 1,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 251, y = 265, Groupsize = 5, UnitId = 974, Spread = 1, Fight = 1},
		Lookout2 = {x = 253, y = 267, Groupsize = 3, UnitId = 993, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	AttackGroupSize = 3,
	FirstAttackWaitTime = Minutes(2),
}	

-- Erstes Briar Camp
Clan_26 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 3,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 27},
	HomePoint = {x = 216, y = 295}, 
	Range = 128,
	AlarmedWaitTime = 10, 
	AttackWaitTime = 10,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 223, y = 287, Groupsize = 5, UnitId = 969, Spread = 1, Fight = 1},
		Lookout2 = {x = 225, y = 289, Groupsize = 3, UnitId = 994, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	AttackGroupSize = 3,
	FirstAttackWaitTime = Minutes(1),
}	

-- erstes einzelnes Briar Camp nach Portal
Clan_25 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 3,	
	MaximalHomePointCrew = 22,
	StandbyCrew = 2,
	ScoutGroupSize = 1,
	AreaRange = {x1 = 472, y1 = 27, x2 = 4, y2 = 485},
	NoScoutAreas =
	{
		NSA1 = {x1 = 296, x2 = 62, y1 = 320, y2 = 82},
		NSA2 = {x1 = 424, x2 = 94, y1 = 473, y2 = 166},
		NSA3 = {x1 = 393, x2 = 177, y1 = 445, y2 = 235},
		NSA4 = {x1 = 179, x2 = 128, y1 = 192, y2 = 177},
		NSA5 = {x1 = 290, x2 = 246, y1 = 259, y2 = 275},
	},	
	Enemy = {Clan = Player},
	HomePoint = {x = 174, y = 262}, 
	Range = 512,
	AttackWaitTime = 600,
	AttackFrequency = 300,
}	


-- Zweites freundliches Camp nach Portal
Clan_24 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 23},
	HomePoint = {x = 182, y = 158}, 
	Range = 256,
	AlarmedWaitTime = 1, 
	AttackWaitTime = 1,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 206, y = 160, Groupsize = 5, UnitId = 974, Spread = 1, Fight = 1},
		Lookout2 = {x = 208, y = 162, Groupsize = 3, UnitId = 993, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	AttackGroupSize = 3,
	FirstAttackWaitTime = Minutes(1),
}	

-- Zweites Briar Camp nach Portal
Clan_23 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 24},
	HomePoint = {x = 235, y = 137}, 
	Range = 256,
	AlarmedWaitTime = 1, 
	AttackWaitTime = 1,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 229, y = 149, Groupsize = 5, UnitId = 969, Spread = 1, Fight = 1},
		Lookout2 = {x = 230, y = 152, Groupsize = 3, UnitId = 994, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	AttackGroupSize = 3,
	FirstAttackWaitTime = Minutes(2),
}

-- Zweites Briar Camp nach Portal Teil II
Clan_22 =
{
	Goal = Idle,
}	


-- Drittes freundliches Camp nach Portal
Clan_21 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 20},
	HomePoint = {x = 422, y = 205}, 
	Range = 256,
	AlarmedWaitTime = 1, 
	AttackWaitTime = 1,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 396, y = 214, Groupsize = 5, UnitId = 974, Spread = 1, Fight = 1},
		Lookout2 = {x = 397, y = 215, Groupsize = 3, UnitId = 993, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	FirstAttackWaitTime = Minutes(1),
	AttackGroupSize = 3,
}	

-- Drittes Briar Camp nach Portal
Clan_20 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 21},
	HomePoint = {x = 327, y = 213}, 
	Range = 256,
	AlarmedWaitTime = 10, 
	AttackWaitTime = 10,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 338, y = 230, Groupsize = 5, UnitId = 969, Spread = 1, Fight = 1},
		Lookout2 = {x = 340, y = 230, Groupsize = 3, UnitId = 994, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	FirstAttackWaitTime = Minutes(2),
	AttackGroupSize = 3,
}


-- Kasten 8 freundliches Camp
Clan_19 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 18},
	HomePoint = {x = 449, y = 128}, 
	Range = 256,
	AlarmedWaitTime = 1, 
	AttackWaitTime = 1,
	AttackFrequency = Minutes(3),
	Lookout =
	{
		Lookout1 = {x = 431, y = 118, Groupsize = 5, UnitId = 974, Spread = 1, Fight = 1},
		Lookout2 = {x = 430, y = 119, Groupsize = 3, UnitId = 993, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	FirstAttackWaitTime = Minutes(1),
	AttackGroupSize = 3,
}	

-- Angriffscamp Rampe
Clan_18 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 19},
	HomePoint = {x = 364, y = 143}, 
	Range = 256,
	AlarmedWaitTime = 10, 
	AttackWaitTime = 10,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 377, y = 143, Groupsize = 3, UnitId = 969, Spread = 1, Fight = 1},
		Lookout2 = {x = 379, y = 142, Groupsize = 1, UnitId = 994, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	FirstAttackWaitTime = Minutes(2),
	AttackGroupSize = 3,
}


-- Angriffscamp Rampe Sueden
Clan_17 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 4,	
	MaximalHomePointCrew = 22,
	StandbyCrew = 2,
	ScoutGroupSize = 2,
	MaximalNumberScoutGroups = 1,
	Enemy = {Clan = Player},
	HomePoint = {x = 411, y = 134}, 
	Range = 512,
	AttackWaitTime = 600,
	AttackFrequency = 300,
	AreaRange = {x1 = 472, y1 = 27, x2 = 4, y2 = 485},
	NoScoutAreas =
	{
		NSA1 = {x1 = 296, x2 = 62, y1 = 320, y2 = 82},
		NSA2 = {x1 = 424, x2 = 94, y1 = 473, y2 = 166},
		NSA3 = {x1 = 393, x2 = 177, y1 = 445, y2 = 235},
		NSA4 = {x1 = 179, x2 = 128, y1 = 192, y2 = 177},
		NSA5 = {x1 = 290, x2 = 246, y1 = 259, y2 = 275},
	},
}	

--Kasten 11 freundliches Camp 
Clan_16 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 15},
	HomePoint = {x = 304, y = 72}, 
	Range = 256,
	AlarmedWaitTime = 1, 
	AttackWaitTime = 1,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 396, y = 69, Groupsize = 5, UnitId = 974, Spread = 1, Fight = 1},
		Lookout2 = {x = 397, y = 69, Groupsize = 3, UnitId = 993, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	FirstAttackWaitTime = Minutes(1),
	AttackGroupSize = 3,
}	

--Kasten 11 feindliches Camp 
Clan_15 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
	Enemy = {Clan = 16},
	HomePoint = {x = 206, y = 64}, 
	Range = 256,
	AlarmedWaitTime = 10, 
	AttackWaitTime = 10,
	AttackFrequency = 250,
	Lookout =
	{
		Lookout1 = {x = 222, y = 67, Groupsize = 5, UnitId = 969, Spread = 1, Fight = 1},
		Lookout2 = {x = 222, y = 69, Groupsize = 3, UnitId = 994, Spread = 1, Fight = 1},
	},
	UpdateWaitTime = 1,
	FirstAttackWaitTime = Minutes(2),
	AttackGroupSize = 3,
}


-- Kleine Orc Hütte
Clan_14 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 4,	
	MaximalHomePointCrew = 22,
	StandbyCrew = 2,
	ScoutGroupSize = 2,
	MaximalNumberScoutGroups = 2,
	HomePoint = {x = 383, y = 98}, 
	Range = 512,
	AttackFrequency = 400,
	AreaRange = {x1 = 472, y1 = 27, x2 = 4, y2 = 485},
	NoScoutAreas =
	{
		NSA1 = {x1 = 296, x2 = 62, y1 = 320, y2 = 82},
		NSA2 = {x1 = 424, x2 = 94, y1 = 473, y2 = 166},
		NSA3 = {x1 = 393, x2 = 177, y1 = 445, y2 = 235},
		NSA4 = {x1 = 179, x2 = 128, y1 = 192, y2 = 177},
		NSA5 = {x1 = 290, x2 = 246, y1 = 259, y2 = 275},
	},
}	

-- Briar Main Camp Vorposten
Clan_13 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 4,	
	MaximalHomePointCrew = 22,
	StandbyCrew = 2,
	ScoutGroupSize = 2,
	MaximalNumberScoutGroups = 1,
	HomePoint = {x = 112, y = 105}, 
	Range = 512,
	AttackFrequency = Minutes (4),
	AreaRange = {x1 = 472, y1 = 27, x2 = 4, y2 = 485},
	NoScoutAreas =
	{
		NSA1 = {x1 = 296, x2 = 62, y1 = 320, y2 = 82},
		NSA2 = {x1 = 424, x2 = 94, y1 = 473, y2 = 166},
		NSA3 = {x1 = 393, x2 = 177, y1 = 445, y2 = 235},
		NSA4 = {x1 = 179, x2 = 128, y1 = 192, y2 = 177},
		NSA5 = {x1 = 290, x2 = 246, y1 = 259, y2 = 275},
	},
}	

-- Briar Main Camp I
Clan_12 = {Goal = Idle}

-- Briar Main Camp II
Clan_11 = {Goal = Idle}

-- Briar Main Camp III
Clan_10 = {Goal = Idle}