dofile("script/AiHelper.lua")

-- AI Greyfell


ScoutDefault =
{
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 263, y1 = 160,x2 = 127, y2 = 260},
	Enemy = {Clan = Player},
	Goal = Agressive,
	StandbyCrew = 4,
	ScoutGroupSize = 1,
	MinimalHomePointCrew = 4,
	MaximalHomePointCrew = 10,
	AlarmedWaitTime = 60,
	AttackWaitTime = 600
}


-- Gobblins am Südlichen Pass
Clan_27 = tcopy(ScoutDefault)
Clan_27["HomePoint"] = {x = 192, y = 166}
Clan_27["AttackFrequency"] = 280

-- Orks Angriffstruppe
Clan_26 =
{
	Goal = Defensiv,
	MinimalHomePointCrew = 6,	
	MaximalHomePointCrew = 14,
	StandbyCrew = 2,
	ScoutGroupSize = 1,
	MaximalNumberScoutGroups = 1,
	Enemy = {Clan = Player},
	HomePoint = {x = 181, y = 161}, 
	Range = 512,
	AlarmedWaitTime = 30, 
	AttackWaitTime = 600,
	AttackFrequency = 380,
}	

-- Gobblins II
Clan_25 =
{
	Goal = idle,
}

-- Greyfell Patrulljen
Clan_24 =
{
	Goal = Nomadic,
	NomadicRange = {x1 = 390, y1 = 160, x2 = 460, y2 = 318},
}

-- Greyfell Bürger
Clan_10 =
{
	Goal = Nomadic,
	NomadicRange = {x1 = 390, y1 = 160, x2 = 460, y2 = 318},
}

-- Tierchen
Clan_23 =
{
	Goal = Idle,
}