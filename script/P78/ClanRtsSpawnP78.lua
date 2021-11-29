-- RTS Spawn:
-- p78 Tutorial

--Monumentenclaim
OnOneTimeEvent
{
	Conditions = 
	{
		IsMonumentInUse {X = 206, Y = 214, Range = 0},
	},
	Actions = 
	{
		SetGlobalTimeStamp{Name = "TutorialMonumentClaimedTimer"},
	},
}


--
--OrkDorf I
RtsSpawnNT
{
	Clan = 27,
	MaxClanSize = 5,
	X = 290,
	Y = 191,
	Range = 5,
	
	
	Timer	= "TutorialMonumentClaimedTimer",
	Init	= {1291, 1291, 1291, 1293, 1293}, 	-- Orcs
	SpawnData =
	{
		[0]		= {Minutes = 3, 	Units = {1291, 1293, 1291, 1293, 1291, 1293, 1292}},
	},
	NpcBuildingsExist = {X = 290, Y = 191, Range = 15},
	CampDestroyedActions = { SetGlobalFlagTrue{Name = "OrcCamp1Destroyed"}, },
}


--OrkDorf II
RtsSpawnNT
{
	Clan = 26,
	MaxClanSize = 8,
	X = 380,
	Y = 170,
	Range = 5,
	
	
	Timer	= "TutorialMonumentClaimedTimer",
	Init	= {1291, 1291, 1293, 1293, 1292}, 	-- Orcs
	SpawnData =
	{
		[0]		= {Minutes = 2.5, 	Units = {1291, 1293, 1291, 1293, 1292}},     
	},
	NpcBuildingsExist = {X = 382, Y = 172, Range = 20},
	CampDestroyedActions = { SetGlobalFlagTrue{Name = "OrcCamp2Destroyed"}, },
}















Aufbau1 =
{
	X = 200,
	Y = 176,
	Range = 3,
	Chief = 0,	
	WaitTime = 90,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		354, 354, 354, 354,	--Animal Deer Old
		353, 353, 353, 353, 353,	-- Animal Deer Young
		355		-- Animal Moose
	},                    
	ShuffleUnits = TRUE,
	
}




InitSpawn
{
	Clan = 23, 
	Groups = {Aufbau1},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 23, MaxClanSize = 25,
	Groups = {Aufbau1},
	Conditions = 	
	{
	},
}


