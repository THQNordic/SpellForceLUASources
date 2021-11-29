-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
BuffaloElfen01 =
{
	X = 165,
	Y = 477,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloElfen02 =
{
	X = 119,
	Y = 441,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloMenschen01 =
{
	X = 91,
	Y = 443,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloMenschen02 =
{
	X = 44,
	Y = 422,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloZwerge01 =
{
	X = 79,
	Y = 393,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloZwerge02 =
{
	X = 87,
	Y = 364,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloDunkelelfen01 =
{
	X = 321,
	Y = 58,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloDunkelelfen02 =
{
	X = 361,
	Y = 68,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloTrolle01 =
{
	X = 404,
	Y = 74,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloTrolle02 =
{
	X = 460,
	Y = 61,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloOrks01 =
{
	X = 448,
	Y = 92,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

BuffaloOrks02 =
{
	X = 449,
	Y = 125,
	Range = 5,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		352, 352, 352, 352, 352	--Animal Buffalo
	},                    
	ShuffleUnits = FALSE,
	
}

-- INIT SPAWN

InitSpawn
{
	Clan = 27, 
	Groups = {BuffaloElfen01, BuffaloElfen02},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 26, 
	Groups = {BuffaloMenschen01, BuffaloMenschen02},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 25, 
	Groups = {BuffaloZwerge01, BuffaloZwerge02},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 24, 
	Groups = {BuffaloDunkelelfen01, BuffaloDunkelelfen02},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 23, 
	Groups = {BuffaloTrolle01, BuffaloTrolle02},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 22, 
	Groups = {BuffaloOrks01, BuffaloOrks02},
	Conditions = 	
	{
	},
}


-- RTS SPAWN

		
RtsSpawn
{
	Clan = 27, MaxClanSize = 10,
	Groups = {BuffaloMenschen01, BuffaloMenschen02},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 26, MaxClanSize = 10,
	Groups = {BuffaloMenschen01, BuffaloMenschen02},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 25, MaxClanSize = 10,
	Groups = {BuffaloZwerge01, BuffaloZwerge02},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 24, MaxClanSize = 10,
	Groups = {BuffaloDunkelelfen01, BuffaloDunkelelfen02},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 23, MaxClanSize = 10,
	Groups = {BuffaloTrolle01, BuffaloTrolle02},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 22, MaxClanSize = 10,
	Groups = {BuffaloOrks01, BuffaloOrks02},
	Conditions = 	
	{
	},
}
