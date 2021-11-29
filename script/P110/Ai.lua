dofile("script/AiHelper.lua")


--P110



AggressiveDefault =
{
	MinimalHomePointCrew = 10,
	MaximalHomePointCrew = 15,
	MaximalNumberScoutGroups = 4,
	AttackGroupSize = 1,
	Goal = Agressive,
	ScoutGroupSize = 0, 
	AttackFrequency = 150,
	AreaRange = {x1 = 231, y1 = 477, x2 = 271, y2 = 440},
	Range = 256,
	HomePoint = {x = 235, y = 453},
}


	
REM = [[
--SternenSpawn Haupthaus
Clan_27 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	--Lookout =
	--{
	--	Lookout1 = {x = 100, y = 252, Groupsize = 2, UnitId = 1628},
	--	Lookout2 = {x = 100, y = 238, Groupsize = 2, UnitId = 1626},
	--},
	FirstAttackWaitTime = 11000,
	MinimalHomePointCrew = 35,	
	MaximalHomePointCrew = 50,
	Enemy = {Clan = Player},
	HomePoint = {x = 132, y = 249}, 
	AlarmedWaitTime = 1, 
	AttackFrequency = 150,
}	
]]

--SternenSpawn Nebenhaus Süd
Clan_22 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	FirstAttackWaitTime = 9000,
	MinimalHomePointCrew = 25,	
	MaximalHomePointCrew = 35,
	Enemy = {Clan = Player},
	HomePoint = {x = 143, y = 233}, 
	AlarmedWaitTime = 1, 
	AttackFrequency = 150,
}	

--SternenSpawn Nebenhaus Nord
Clan_21 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	FirstAttackWaitTime = 10000,
	MinimalHomePointCrew = 25,	
	MaximalHomePointCrew = 35,
	Enemy = {Clan = Player},
	HomePoint = {x = 146, y = 263}, 
	AlarmedWaitTime = 1, 
	AttackFrequency = 150,
}	


--MondSpawn Haupthaus
Clan_25 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	Lookout =
	{
		Lookout1 = {x = 280, y = 479, Groupsize = 2, UnitId = 1628},
		Lookout2 = {x = 297, y = 449, Groupsize = 2, UnitId = 1626},
	},
	FirstAttackWaitTime = 9000,
	MinimalHomePointCrew = 25,	
	MaximalHomePointCrew = 35,
	Enemy = {Clan = Player},
	HomePoint = {x = 394, y = 470}, 
	AlarmedWaitTime = 1, 
	AttackFrequency = 150,
}	

--SonnenSpawn Haupthaus
Clan_23 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	Lookout =
	{
		Lookout1 = {x = 242, y = 58, Groupsize = 2, UnitId = 1503},
		Lookout2 = {x = 256, y = 93, Groupsize = 2, UnitId = 1505},
	},
	FirstAttackWaitTime = 9000,
	MinimalHomePointCrew = 25,	
	MaximalHomePointCrew = 35,
	Enemy = {Clan = Player},
	HomePoint = {x = 352, y = 49}, 
	AlarmedWaitTime = 1, 
	AttackFrequency = 150,
}	


--MondSpawn Tempel

Clan_26 =
{
	Goal = Script,
}

--SonnenSpawn Tempel

Clan_24 =
{
	Goal = Script,
}

--SternStadt Tempel

Clan_27 =
{
	Goal = Script,
}