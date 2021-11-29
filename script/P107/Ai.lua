dofile("script/AiHelper.lua")


--P107
-- AI Verhalten für Geister


AggressiveDefault =
{
	MinimalHomePointCrew = 4,
	MaximalHomePointCrew = 16,
	MaximalNumberScoutGroups = 4,
	AreaRange = {x1 = 96, y1 = 174, x2 = 194, y2 = 97},
	Goal = Agressive,
	ScoutGroupSize = 2, 
	Range = 512,
	HomePoint = { x = 111 , y = 67},
	AttackFrequency = 200,
	
	
}

--GeisterGrab
Clan_27 =
{
	Goal = Script,
}

--SkelettGrab beim Mondsilber

Clan_26 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	FirstAttackWaitTime = 900000,
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 133, y = 180}, 
	AlarmedWaitTime = 10, 
	AttackFrequency = 250,
}

--SkelettGrab beim Schlachtfeld

Clan_25 = tcopy(AggressiveDefault)
Clan_25["HomePoint"] = {x = 111, y = 67}
Clan_25["AttackFrequency"] = 200
	

Clan_24 =
{
	Goal = Idle,
	
}

--SchlachtfeldLager 2

Clan_23 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	FirstAttackWaitTime = 900000,
	MinimalHomePointCrew = 4,	
	MaximalHomePointCrew = 15,
	Enemy = {Clan = Player},
	HomePoint = {x = 107, y = 106}, 
	AttackFrequency = 250,
}

--SchlachtfeldLager 3

Clan_22 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	FirstAttackWaitTime = 900000,
	MinimalHomePointCrew = 4,	
	MaximalHomePointCrew = 15,
	Enemy = {Clan = Player},
	HomePoint = {x = 100, y = 100}, 
	AttackFrequency = 250,
}