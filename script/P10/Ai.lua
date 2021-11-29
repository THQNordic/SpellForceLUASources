dofile("script/AiHelper.lua")

-- AI Southern Windwalls




--Beastmen defensiv
Clan_27 =
{
	Goal = Idle,

}	

---- Beastmen offensiv, durch defensive *g
Clan_26 =
{
	Goal = Defensive,
	UpdateWaitTime = 180,
	Lookout =
	{
		Lookout1 = {x = 310, y = 422, Groupsize = 2, UnitId = 725},
		Lookout2 = {x = 283, y = 414, Groupsize = 2, UnitId = 725},
	},
	FirstAttackWaitTime = 9000,
	MinimalHomePointCrew = 2,	
	MaximalHomePointCrew = 10,
	Enemy = {Clan = Player},
	HomePoint = {x = 319, y = 389}, 
	AlarmedWaitTime = 1, 
	AttackFrequency = 300,
}	

-- SuedTrolle
Clan_25 =
{
	Goal = Idle,
}	


-- Zwergengeister
Clan_24 =
{
	Goal = Nomadic,
	NomadicRange = {x1 = 718, y1 = 429, x2 = 749, y2 = 464},
}

--- Trolle II
Clan_23 =
{
	Goal = Idle,
}

-- Tiere
Clan_22 =
{
	Goal = Idle,
}

-- PP Ghoule
Clan_21 =
{
	Goal = Idle,
}

-- PP Ghoule II
Clan_20 =
{
	Goal = Idle,
}