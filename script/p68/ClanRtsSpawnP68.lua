-- RTS Spawn:
-- p68 Whisperling Swamp

-----------------------------------------------
-- 	Tierspawning
-----------------------------------------------
DwarfDeer1 =
{
	X = 375,
	Y = 213,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

DwarfDeer2 =
{
	X = 356,
	Y = 175,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

HumanDeer1 =
{
	X = 293,
	Y = 111,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

HumanDeer2 =
{
	X = 274,
	Y = 74,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

ElfDeer1 =
{
	X = 198,
	Y = 95,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

ElfDeer2 =
{
	X = 185,
	Y = 139,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

OrcDeer1 =
{
	X = 94,
	Y = 307,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

OrcDeer2 =
{
	X = 104,
	Y = 355,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

TrollDeer1 =
{
	X = 159,
	Y = 421,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

TrollDeer2 =
{
	X = 203,
	Y = 451,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

DarkElfDeer1 =
{
	X = 272,
	Y = 420,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

DarkElfDeer2 =
{
	X = 290,
	Y = 380,
	Range = 8,
	Chief = 0,	
	WaitTime = AnimalSpawnTime,
	AvatarMinLevel = 0,
	AvatarMaxLevel = 0,
	Conditions = 
	{
	},
	Units = 
	{
		355,	--Hirsch
		354, 354, 354, 354,	--Reh
		353, 353, 353	--Rehkitz
	},                    
	ShuffleUnits = TRUE,
	
}

-- INIT SPAWN

InitSpawn
{
	Clan = 27, 
	Groups = {DwarfDeer1, DwarfDeer2},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 26, 
	Groups = {HumanDeer1, HumanDeer2},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 25, 
	Groups = {ElfDeer1, ElfDeer2},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 24, 
	Groups = {OrcDeer1, OrcDeer2},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 23, 
	Groups = {TrollDeer1, TrollDeer2},
	Conditions = 	
	{
	},
}

InitSpawn
{
	Clan = 22, 
	Groups = {DarkElfDeer1, DarkElfDeer2},
	Conditions = 	
	{
	},
}

-- RTS SPAWN
		
RtsSpawn
{
	Clan = 27, MaxClanSize = 16,
	Groups = {DwarfDeer1, DwarfDeer2},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 26, MaxClanSize = 16,
	Groups = {HumanDeer1, HumanDeer2},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 25, MaxClanSize = 16,
	Groups = {ElfDeer1, ElfDeer2},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 24, MaxClanSize = 16,
	Groups = {OrcDeer1, OrcDeer2},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 23, MaxClanSize = 16,
	Groups = {TrollDeer1, TrollDeer2},
	Conditions = 	
	{
	},
}

RtsSpawn
{
	Clan = 22, MaxClanSize = 16,
	Groups = {DarkElfDeer1, DarkElfDeer2},
	Conditions = 	
	{
	},
}
