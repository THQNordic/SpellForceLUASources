-----------------------------------------------
-- 	Tierspawning  Fallfire Wastes -------------
-----------------------------------------------
BuffaloElfOrk01 =
{
	X = 229,
	Y = 228,
	Range = 4,
	Chief = 0,	
	WaitTime = 120,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352,	--Animal Buffalo
	},                    
	ShuffleUnits = TRUE,
	
}

BuffaloElfOrk02 =
{
	X = 181,
	Y = 238,
	Range = 4,
	Chief = 0,	
	WaitTime = 120,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352,	--Animal Buffalo
	},                    
	ShuffleUnits = TRUE,
	
}

BuffaloElfOrk03 =
{
	X = 188,
	Y = 202,
	Range = 4,
	Chief = 0,	
	WaitTime = 120,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352,	--Animal Buffalo
	},                    
	ShuffleUnits = TRUE,
	
}

BuffaloElfOrk04 =
{
	X = 155,
	Y = 219,
	Range = 4,
	Chief = 0,	
	WaitTime = 120,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352,	--Animal Buffalo
	},                    
	ShuffleUnits = TRUE,
	
}

BuffaloHumanTroll01 =
{
	X = 52,
	Y = 76,
	Range = 4,
	Chief = 0,	
	WaitTime = 120,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352, 352, 352, 352, 352, 352,	--Animal Buffalo
	},                    
	ShuffleUnits = TRUE,
	
}

BuffaloHumanTroll02 =
{
	X = 33,
	Y = 131,
	Range = 4,
	Chief = 0,	
	WaitTime = 120,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352, 352, 352, 352, 352, 352,	--Animal Buffalo
	},                    
	ShuffleUnits = TRUE,
	
}


InitSpawn
{
	Clan = 27, 
	Groups = {BuffaloElfOrk01, BuffaloElfOrk02, BuffaloElfOrk03, BuffaloElfOrk04, BuffaloHumanTroll01, BuffaloHumanTroll02},
	Conditions = 	
	{
	},
}
		
RtsSpawn
{
	Clan = 27, MaxClanSize = 40,
	Groups = {BuffaloElfOrk01, BuffaloElfOrk02, BuffaloElfOrk03, BuffaloElfOrk04, BuffaloHumanTroll01, BuffaloHumanTroll02},
	Conditions = 	
	{
	},
}