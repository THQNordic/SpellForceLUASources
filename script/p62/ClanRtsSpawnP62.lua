-- RTS SPAWN, Gobblins Scout Camp am Startportal
Ruinencamp =
{
	X = 171,
	Y = 189,
	Range = 3,
	Chief = 0, 
	WaitTime = 50,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		777, 777, 	-- Goblin Brown 1 Faust
	 	779, 779, 	-- Goblin Brown 1 Keule
	 	266,		-- Goblin Green 1 Fireburst
	 	784, 784, 784, 784, 784,	 -- Goblin Green 1 Dolch 
	 	783, 783, 783,	-- Goblin Green 1 Schwert 
	 	262	-- Goblin Green 1 Healer 
	 },
	ShuffleUnits = TRUE,

}

InitSpawn
{
	Clan = 4, 
	Groups = {Ruinencamp},
	Conditions = 	
	{  
	},
}

RtsSpawn
{
	Clan = 4, MaxClanSize = 15,
	Groups = {Ruinencamp},
	Conditions = 	
	{
	},
					
}