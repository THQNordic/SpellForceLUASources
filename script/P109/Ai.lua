dofile("script/AiHelper.lua")

-- AI Verhalten Elonie

AggressiveDefault =
{
	MinimalHomePointCrew = 6,
	MaximalHomePointCrew = 20,
	MaximalNumberScoutGroups = 1,
	AreaRange = {x1 = 199, y1 = 511, x2 = 11, y2 = 17},
	Goal = Agressive,
	ScoutGroupSize = 1, 
	Range = 512,
	AttackFrequency = 300
}

-- DunkelElfenCamp
Clan_27 = tcopy(AggressiveDefault)
Clan_27["HomePoint"] = {x = 157, y = 295}
Clan_27["AttackFrequency"] = 222
	

-- DunkelElfenCamp
Clan_26 = tcopy(AggressiveDefault)
Clan_26["HomePoint"] = {x = 162, y = 314}
Clan_26["AttackFrequency"] = 297

-- Trolle
Clan_25 =
{
	Goal = Idle,
}	


-- Trolle Lager Teil 1
Clan_24 = tcopy(AggressiveDefault)
Clan_24["HomePoint"] = {x = 385, y = 135}
Clan_24["AttackFrequency"] = 333
Clan_24["MinimalHomePointCrew"] = 4

-- Trolle
Clan_23 =
{
	Goal = Idle,
}	

-- Trolle Lager Teil 2
Clan_22 =
{
	Goal = Defensive,
	UpdateWaitTime = 60,
	Lookout = 
	{
		Lookout1 = {x = 348, y =  80, Groupsize = 2, UnitId = 1215, Spread = 5, Fight = 0},
	},
	FirstAttackWaitTime = 3600,
	MinimalHomePointCrew = 4,	
	AttackGroupSize = 5,
	Enemy = {Clan = Player},
	HomePoint = {x = 438, y = 106}, 
	Range = 512,
	AlarmedWaitTime = 5, 
	AttackFrequency = 360,	
}

-- Dritte Dunkelelfen Partei für Westen
Clan_21 =
{
	Goal = Idle,
}	

-- Trolle am Menschenaufbau
Clan_20 = tcopy(AggressiveDefault)
Clan_20["HomePoint"] = {x = 80, y = 160}
Clan_20["AttackFrequency"] = 400

-- Trolle am Menschenaufbau
Clan_19 = tcopy(AggressiveDefault)
Clan_19["HomePoint"] = {x = 81, y = 153}
Clan_19["AttackFrequency"] = 250


-- Trolle Lager Teil 2
Clan_18 =
{
	Goal = Defensive,
	UpdateWaitTime = 60,
	Lookout = 
	{
		Lookout1 = {x = 198, y =  440, Groupsize = 1, UnitId = 1215, Spread = 5, Fight = 0},
	},
	FirstAttackWaitTime = 3600,
	MinimalHomePointCrew = 4,	
	AttackGroupSize = 5,
	Enemy = {Clan = Player},
	HomePoint = {x = 148, y = 389}, 
	Range = 256,
	AlarmedWaitTime = 5, 
	AttackFrequency = 360,	
}

-- Trolle am Menschenaufbau
Clan_17 = tcopy(AggressiveDefault)
Clan_17["HomePoint"] = {x = 117, y = 390}
Clan_17["AttackFrequency"] = 250
Clan_17["MinimalHomePointCrew"] = 2