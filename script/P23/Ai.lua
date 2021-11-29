dofile("script/AiHelper.lua")

-- AI The Rift (aka "Die Spalte" aka "United Trash")




--RTS SPAWN, Aufbaustörer Manticoras
Clan_27 =
{
	Goal = Agressive,
	MinimalHomePointCrew = 1,	
	MaximalHomePointCrew = 10,
	StandbyCrew = 2,
	ScoutGroupSize = 1,
	MaximalNumberScoutGroups = 2,
	Enemy = {Clan = Player},
	HomePoint = {x = 149, y = 166}, 
	Range = 512,
	AttackWaitTime = 300,
	AttackFrequency = 200,

}	

