dofile("script/AiHelper.lua")

DefaultAgressive = 
{
	Goal = Agressive,
	MinimalHomePointCrew = 1,
	ScoutGroupSize = 1,
	MaximalNumberScoutGroups = 4,
	AttackGroupSize = 1,
	Enemy = {Clan = Player},
	AttackWaitTime = Minutes(5),
}

Clan_1 = tcopy(DefaultAgressive)
Clan_1["HomePoint"] = {x = 288, y = 330}


