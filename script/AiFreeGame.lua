-- this dofile has to be called, because the names and helper functions are defined here
dofile("script/AiHelper.lua")

Agressive =
{
	MinimalHomePointCrew = 5,	
	MaximalHomePointCrew = 20,
	StandbyCrew = 0,
	ScoutGroupSize = 2,
	MaximalNumberScoutGroups = 2,
	Enemy = {Clan = Player},
	Range = 256,
}	

Defensive =
{
	Lookout = 	-- should not be used
	{
	},
	MinimalHomePointCrew = 5,	
	Enemy = {Clan = Player},
	Range = 64,
}

