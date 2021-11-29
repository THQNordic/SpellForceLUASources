-- RTS Spawn:
-- p212 Gorge

GlobalSpawnDuration = 90



-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
AufbauDschungel1 =
{
	X = 197,
	Y = 420,
	Range = 15,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		348, 348, 348, 348,	--Wildes Schwein
		352, 352, 352, 352, 352,	-- büffel
		343, 343, 343, 343, --hase
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
	},                    
	ShuffleUnits = TRUE,
	
}


AufbauDschungel2 =
{
	X = 329,
	Y = 436,
	Range = 15,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		348, 348, 348, 348,	--Wildes Schwein
		352, 352, 352, 352, 352,	-- büffel
		343, 343, 343, 343, --hase
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
	},                    
	ShuffleUnits = TRUE,
	
}

DschungelMitte =
{
	X = 282,
	Y = 215,
	Range = 15,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		
		348, 348, 348, 348,	--Wildes Schwein
		343, 343, 343, 343, --hase
		352, 352, 352, 352, 352,	-- büffel
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
		
	},                    
	ShuffleUnits = FALSE,
	
}

DschungelUnten =
{
	X = 75,
	Y = 113,
	Range = 15,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		348, 348, 348, 348,	--Wildes Schwein
		343, 343, 343, 343, --hase
		352, 352, 352, 352, 352,	-- büffel
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
	},                    
	ShuffleUnits = FALSE,
}

DschungelUnten2 =
{
	X = 476,
	Y = 112,
	Range = 15,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		348, 348, 348, 348,	--Wildes Schwein
		343, 343, 343, 343, --hase
		352, 352, 352, 352, 352,	-- büffel
		1045, 1046, 1045, 1045, 1046 --schweine dreckig und sauber
	},                    
	ShuffleUnits = FALSE,
}



InitSpawn
{
	Clan = 18, 
	Groups = {AufbauDschungel1, AufbauDschungel2, DschungelMitte, DschungelUnten, DschungelUnten2},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 18, MaxClanSize = 30,
	Groups = {AufbauDschungel1, AufbauDschungel2, DschungelMitte, DschungelUnten, DschungelUnten2},
	Conditions = 	
	{
	},
}
