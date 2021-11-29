dofile("script/AiHelper.lua")

-- AI Turorial





-- Erstes Orkcamp
Clan_27 =
{
	Goal = Idle,
}	
rem = [[
Clan_26 =
{
	Goal = Defensive,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 12,
--	StandbyCrew = 2,
	--ScoutGroupSize = 1,
	--MaximalNumberScoutGroups = 1,
	Enemy = {Clan = Player},
	HomePoint = {x = 181, y = 161}, 
	Range = 128,
	AlarmedWaitTime = 1, 
	AttackWaitTime = 1,
	AttackFrequency = 250,
	Lookout1 = {x = 351, y = 203, Groupsize = 1, UnitId = 895, Spread = 1, Fight = 0},
	UpdateWaitTime = 1,
}	
]]


-- zewites Orkcamp
Clan_26 =
{
	Goal = Defensive,
	UpdateWaitTime = 10,
--	Lookout = {	Lookout1 = {x = 351, y = 203, Groupsize = 1, UnitId = 895, Spread = 1},	},
	FirstAttackWaitTime = 29000,
	MinimalHomePointCrew = 3,
	MaximalHomePointCrew = 12,
	StandbyCrew = 2,
	Enemy = {Clan = Player},
	HomePoint = {x = 380, y = 180}, 
	Range = 128,
	AlarmedWaitTime = 1,
	AttackWaitTime = 1,
	AttackFrequency = 400,
--	AttackGroupSize = 2,
}


-- Gobblins II
Clan_25 =
{
	Goal = Idle,
}

-- Tierchen
Clan_23 =
{
	Goal = Idle,
}

-- Gobblins Aufbau (die am See)
Clan_16 =
{
	Goal = Script,
}


